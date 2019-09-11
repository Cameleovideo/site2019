using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Core;
using Nop.Services.Events;
using Nop.Services.Orders;
using Nop.Services.Common;
using Nop.Core.Data;
using Nop.Core.Domain.Common;

namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public class CameleoEventUserService : ICameleoEventUserService
    {
        #region Fields

        private readonly IEventPublisher _eventPublisher;
        private readonly IRepository<CameleoEventUser> _eventUserRepository;
        private readonly IRepository<CameleoCustomerEvent> _customerEventRepository;        
        #endregion

        #region Ctor

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoEventUserService(IEventPublisher eventPublisher, IRepository<CameleoEventUser> eventUserRepository, IRepository<CameleoCustomerEvent> customerEventRepository)
        {
            _eventPublisher = eventPublisher;            
            _eventUserRepository = eventUserRepository;
            _customerEventRepository = customerEventRepository;           
        }

        #endregion

        #region Methods

        /// <summary>
        /// Gets all event users for all groups in a given event
        /// </summary>
        /// <returns>event users</returns>
        public CameleoEventUserListViewModel GetEventUserListViewModel(int pEventId) 
        {            
            var records = GetAllEventUsers(pEventId, 0, int.MaxValue);
            CameleoEventUserListViewModel eventUserListViewModel = new CameleoEventUserListViewModel();
            var eventUsers = records
                .Select(x =>
                {
                    var m = new CameleoEventUserViewModel()
                    {
                        Id = x.Id,
                        EventId = x.EventId,
                        UserName = x.UserName,
                        Password = x.Password,
                        LastName = x.LastName,
                        FirstName = x.FirstName,
                        Email = x.Email,
                        UniqueId = x.UniqueId,
                        Group = x.Group,
                        SuperiorName = x.SuperiorName,
                        isStaff = x.isStaff,
                        CreatedOnUtc = x.CreatedOnUtc,
                        EventUserCount = GetEventUsersCount(pEventId, x.Group),
                        AcceptedEventUserCount = GetAcceptedEventUsersCount(pEventId, x.Group),
                    };
                    return m;
                })
                .ToList();
            eventUserListViewModel.CameleoEventUserList = eventUsers;
            return eventUserListViewModel;
        }

        /// <summary>
        /// Gets all event users for a given group in a given event
        /// </summary>
        /// <returns>event users</returns>
        public CameleoEventUserListViewModel GetEventUserListViewModel(int pEventId, string pGroup)
        {
            var tmpEventUserCount = GetEventUsersCount(pEventId, pGroup);
            var tmpAcceptedEventUserCount = GetAcceptedEventUsersCount(pEventId, pGroup);
            var records = GetAllEventUsers(pEventId, pGroup);
            CameleoEventUserListViewModel eventUserListViewModel = new CameleoEventUserListViewModel();
            var eventUsers = records
                .Select(x =>
                {
                    var m = new CameleoEventUserViewModel()
                    {
                        Id = x.Id,
                        EventId = x.EventId,
                        UserName = x.UserName,
                        Password = x.Password,
                        LastName = x.LastName,
                        FirstName = x.FirstName,
                        Email = x.Email,
                        UniqueId = x.UniqueId,
                        Group = x.Group,
                        SuperiorName = x.SuperiorName,
                        isStaff = x.isStaff,
                        CreatedOnUtc = x.CreatedOnUtc,
                        EventUserCount = tmpEventUserCount,
                        AcceptedEventUserCount = tmpAcceptedEventUserCount,
                    };
                    return m;
                })
                .ToList();
            eventUserListViewModel.CameleoEventUserList = eventUsers;
            return eventUserListViewModel;
        }


        /// <summary>
        /// Deletes a event user
        /// </summary>
        /// <param name="eventUser">Event user</param>
        public void DeleteEventUser(CameleoEventUser eventUser)
        {
            if (eventUser == null)
            {
                throw new ArgumentNullException("eventUser");
            }

            _eventUserRepository.Delete(eventUser);            

            //event notification
            _eventPublisher.EntityDeleted(eventUser);
        }

        /// <summary>
        /// Gets all event users
        /// </summary>
        /// <returns>event users</returns>
        public IPagedList<CameleoEventUser> GetAllEventUsers(int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = from tr in _eventUserRepository.Table
                        orderby tr.UserName
                        select tr;
            var records = new PagedList<CameleoEventUser>(query, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets number of event users for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        public int GetEventUsersCount(int eventId, string pGroup)
        {
            int userCount = 0;

            var query = from tr in _eventUserRepository.Table
                        where tr.EventId == eventId && tr.Group == pGroup
                        orderby tr.UserName
                        select tr;
            userCount = query.Count();
            return userCount;
        }

        /// <summary>
        /// Gets number of event users for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        public int GetEventUsersCount(CameleoEventUser pEventUser)
        {
            return GetEventUsersCount(pEventUser.EventId, pEventUser.Group);
        }

        /// <summary>
        /// Gets number of event users that have accepted to participate for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        public int GetAcceptedEventUsersCount(int eventId, string pGroup)
        {
            int userCount = 0;

            var query = from ce in _customerEventRepository.Table
                        join eu in _eventUserRepository.Table on ce.EventUserId equals eu.Id
                        where ce.Accepted && eu.EventId == eventId && eu.Group == pGroup
                        select ce.EventUserId;
            
            userCount = query.Distinct().Count();
            return userCount;
        }

        /// <summary>
        /// Gets number of event users that have accepted to participate for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        public int GetAcceptedEventUsersCount(CameleoEventUser pEventUser)
        {
            return GetAcceptedEventUsersCount(pEventUser.EventId, pEventUser.Group);
        }

        /// <summary>
        /// Gets all event users for a given event
        /// </summary>
        /// <returns>event users</returns>
        public IPagedList<CameleoEventUser> GetAllEventUsers(int pEventId, int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = from tr in _eventUserRepository.Table
                        where tr.EventId == pEventId
                        orderby tr.Group, tr.LastName, tr.FirstName
                        select tr;
            var records = new PagedList<CameleoEventUser>(query, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets all event users for a given event and group
        /// </summary>
        /// <returns>event users</returns>
        public IPagedList<CameleoEventUser> GetAllEventUsers(int pEventId, string pGroupName, int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = from tr in _eventUserRepository.Table
                        where tr.EventId == pEventId && tr.Group == pGroupName
                        orderby tr.LastName, tr.FirstName
                        select tr;
            var records = new PagedList<CameleoEventUser>(query, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets all event users that did not answer for a given event and group
        /// </summary>
        /// <returns>event users</returns>
        public IPagedList<CameleoEventUser> GetNoAnswerEventUsers(int pEventId, string pGroup, int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = from tr in _eventUserRepository.Table
                        where tr.EventId == pEventId && tr.Group == pGroup && !(from o in _customerEventRepository.Table select o.EventUserId).Contains(tr.Id)
                        orderby tr.UserName
                        select tr;
            var records = new PagedList<CameleoEventUser>(query, pageIndex, pageSize);
            return records;
        }

        


        /// <summary>
        /// Gets a event user by username
        /// </summary>
        /// <param name="userName">Event user username</param>
        /// <returns>Event user</returns>
        public CameleoEventUser GetEventUserByUserName(string userName)
        {            
            var query = (from tr in _eventUserRepository.Table
                        where tr.UserName == userName
                        select new 
                        {
                            Id = tr.Id,
                            EventId = tr.EventId,
                            UserName = tr.UserName,
                            Password = tr.Password,
                            LastName = tr.LastName,
                            FirstName = tr.FirstName,
                            Email = tr.Email,
                            Group = tr.Group,
                            UniqueId = tr.UniqueId,
                            SuperiorName = tr.SuperiorName,
                            isStaff = tr.isStaff,
                            CreatedOnUtc = tr.CreatedOnUtc,
                        });
            
            if (query.Count() > 0)
	        {
                var tmp = query.First();
                if (tmp == null)
                {
                    return null;
                }
                else
                {
                    return GetEventUserById(tmp.Id);                    
                }
	        }
            else
            {
                return null;
            }            
        }

        /// <summary>
        /// Gets a event user by id
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <returns>Event user</returns>
        public CameleoEventUser GetEventUserById(int eventUserId)
        {
            if (eventUserId == 0)
            {
                return null;
            }                

            return _eventUserRepository.GetById(eventUserId);
        }

        /// <summary>
        /// Inserts a event user
        /// </summary>
        /// <param name="eventUser">Event user</param>
        public void InsertEventUser(CameleoEventUser eventUser)
        {
            if (eventUser == null)
            {
                throw new ArgumentNullException("eventUser");
            }

            _eventUserRepository.Insert(eventUser);
            
            //event notification
            _eventPublisher.EntityInserted(eventUser);
        }

        /// <summary>
        /// Updates a event user
        /// </summary>
        /// <param name="eventUser">Event user</param>
        public void UpdateEventUser(CameleoEventUser eventUser)
        {
            if (eventUser == null)
            {
                throw new ArgumentNullException("eventUser");
            }

            _eventUserRepository.Update(eventUser);
            
            //event notification
            _eventPublisher.EntityUpdated(eventUser);
        }
        #endregion
    }
}
