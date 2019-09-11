using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Core;
using Nop.Services.Events;
using Nop.Services.Localization;
using Nop.Core.Data;
using System.Web.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public class CameleoEventService : ICameleoEventService
    {
        #region Fields

        private readonly IEventPublisher _eventPublisher;
        private readonly IRepository<CameleoEvent> _eventRepository;
        private readonly IRepository<CameleoEventUser> _eventUserRepository;
        private readonly IRepository<CameleoCustomerEvent> _customerEventRepository;
        private readonly ILocalizationService _localizationService;
        private readonly ICameleoEventUserService _eventUserService;

        #endregion

        #region Ctor

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoEventService(IEventPublisher eventPublisher, IRepository<CameleoEvent> eventRepository, IRepository<CameleoEventUser> eventUserRepository,
            IRepository<CameleoCustomerEvent> customerEventRepository, ILocalizationService localizationService, ICameleoEventUserService eventUserService)
        {
            _eventPublisher = eventPublisher;            
            _eventRepository = eventRepository;
            _eventUserRepository = eventUserRepository;
            _customerEventRepository = customerEventRepository;
            _localizationService = localizationService;
            _eventUserService = eventUserService;
        }

        #endregion

        #region Methods

        /// <summary>
        /// Get EventListViewModel for all events
        /// </summary> 
        public CameleoEventListViewModel GetEventListViewModel()
        {
            var records = GetAllEvents();
            var eventsModel = records
                .Select(x =>
                {
                    var m = new CameleoEventViewModel()
                    {
                        Id = x.Id,
                        EventName = x.EventName,
                        EventCode = x.EventCode,
                        ClientName = x.ClientName,
                        CreatedOnUtc = x.CreatedOnUtc,
                        ShootedOnUtc = x.ShootedOnUtc,
                        AcceptReminderDateUtc = x.AcceptReminderDateUtc,
                        AcceptMinimumPercentage = x.AcceptMinimumPercentage,
                        AcceptReminderDelay = x.AcceptReminderDelay,
                        PayReminderDateUtc = x.PayReminderDateUtc,
                        PayMinimumPercentage = x.PayMinimumPercentage,
                        PayReminderDelay = x.PayReminderDelay,
                        Status = x.Status,
                        StatusString = _localizationService.GetResource(CameleoEventStatusStrings.LocalizedStringValues[x.Status]),
                        ClientLogo = x.ClientLogo,
                        IntroLogo = x.IntroLogo,
                        ParticipationFee = x.ParticipationFee,
                        Groups = GetAllGroupsForEvent(x.Id),
                    };
                    return m;
                })
                .ToList();
            var model = new CameleoEventListViewModel();
            model.CameleoEventList = eventsModel;

            return model;
        }

        /// <summary>
        /// Get EventViewModel from a CameleoEvent
        /// </summary>        
        public CameleoEventViewModel GetEventViewModel(int eventId) 
        {           
            var tmpEvent = GetEventById(eventId);
            if (tmpEvent == null)
            {
                return null;
            }
            else
            {
                CameleoEventViewModel eventViewModel = new CameleoEventViewModel(tmpEvent, GetAllGroupsForEvent(tmpEvent.Id), _localizationService.GetResource(CameleoEventStatusStrings.LocalizedStringValues[tmpEvent.Status]));
                //var tmpEventUser = _eventUserService.GetEventUserById(tmpEvent.Id);
                return eventViewModel;
            }        
        }

        /// <summary>
        /// Deletes a event
        /// </summary>
        /// <param name="pEvent">Event</param>
        public void DeleteEvent(CameleoEvent pEvent)
        {
            if (pEvent == null)
            {
                throw new ArgumentNullException("event");
            }

            _eventRepository.Delete(pEvent);

            //event notification
            _eventPublisher.EntityDeleted(pEvent);
        }

        /// <summary>
        /// Gets all events
        /// </summary>
        /// <returns>events</returns>
        public IPagedList<CameleoEvent> GetAllEvents(int pageIndex = 0, int pageSize = int.MaxValue)
        {            
            var query = _eventRepository.Table;
            query = query.OrderBy(c => c.ShootedOnUtc).OrderByDescending(c => c.ShootedOnUtc);
            
            var records = new PagedList<CameleoEvent>(query, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets all groups for an event
        /// </summary>
        /// <returns>groups</returns>
        public List<CameleoSelectListItem> GetAllGroupsForEvent(int eventId)
        {
            var query = from tr in _eventUserRepository.Table                        
                        where tr.EventId == eventId
                        orderby tr.Group
                        select tr.Group;
            query = query.Distinct();
            var records = new List<string>(query);

            var groupSelectList = new List<CameleoSelectListItem>();           
            foreach (var tmpGroup in records)
            {
                // Get nb of users in this group                
                var queryNbUsers = from a in _eventUserRepository.Table
                            where a.EventId == eventId && a.Group == tmpGroup
                            select a;
                int nbUsers = queryNbUsers.Count();

                // Get nb of users that have accepted in this group
                var queryNbAcceptedUsers =  from ce in _customerEventRepository.Table
                                            join eu in _eventUserRepository.Table on ce.EventUserId equals eu.Id
                                            where ce.Accepted && eu.Group == tmpGroup && eu.EventId == eventId
                                            select ce.EventUserId;
                int nbAcceptedUsers = queryNbAcceptedUsers.Distinct().Count();

                // Get nb of users that have accepted image use in this group
                var queryNbAcceptedImageUseUsers = from ce in _customerEventRepository.Table
                                           join eu in _eventUserRepository.Table on ce.EventUserId equals eu.Id
                                           where ce.AcceptedImageUse && eu.Group == tmpGroup && eu.EventId == eventId
                                           select ce.EventUserId;
                int nbAcceptedImageUseUsers = queryNbAcceptedImageUseUsers.Distinct().Count();

                // Get nb of users that have refused in this group
                var queryNbRefusedUsers = from ce in _customerEventRepository.Table
                                           join eu in _eventUserRepository.Table on ce.EventUserId equals eu.Id
                                           where !ce.Accepted && ce.AcceptedStatus == (int)AcceptedStatus.Refused && eu.Group == tmpGroup && eu.EventId == eventId
                                           select ce.EventUserId;
                int nbRefusedUsers = queryNbRefusedUsers.Distinct().Count();

                // Add the group with                 
                groupSelectList.Add(new CameleoSelectListItem(nbUsers, nbAcceptedUsers, nbAcceptedImageUseUsers, nbRefusedUsers) { Text = tmpGroup, Value = tmpGroup });                
            }

            return groupSelectList;            
        }


        /// <summary>
        /// Gets a event by id
        /// </summary>
        /// <param name="eventId">Event identifier</param>
        /// <returns>Event</returns>
        public CameleoEvent GetEventById(int eventId)
        {
            if (eventId == 0)
            {
                return null;
            }

            return _eventRepository.GetById(eventId);
        }

        /// <summary>
        /// Gets a event by event user id
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <returns>Event</returns>
        public CameleoEvent GetEventByEventUserId(int eventUserId) 
        {
            if (eventUserId == 0)
            {
                return null;
            }

            //Get event user
            var tmpEventUser = _eventUserRepository.GetById(eventUserId);
            if (tmpEventUser == null)
            {
                return null;
            }
            else
            {
                return GetEventById(tmpEventUser.EventId);
            }
        }

        /// <summary>
        /// Inserts a event
        /// </summary>
        /// <param name="pEvent">Event</param>
        public void InsertEvent(CameleoEvent pEvent)
        {
            if (pEvent == null)
            {
                throw new ArgumentNullException("event");
            }

            pEvent.CreatedOnUtc = DateTime.Now;

            _eventRepository.Insert(pEvent);

            //event notification
            _eventPublisher.EntityInserted(pEvent);
        }

        /// <summary>
        /// Updates a event
        /// </summary>
        /// <param name="pEvent">Event</param>
        public void UpdateEvent(CameleoEvent pEvent)
        {
            if (pEvent == null)
            {
                throw new ArgumentNullException("event");
            }

            _eventRepository.Update(pEvent);

            //event notification
            _eventPublisher.EntityUpdated(pEvent);
        }
        #endregion
    }
}
