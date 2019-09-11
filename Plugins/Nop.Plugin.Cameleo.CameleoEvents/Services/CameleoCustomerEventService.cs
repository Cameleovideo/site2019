using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Core;
using Nop.Services.Events;
using Nop.Services.Orders;
using Nop.Services.Common;
using Nop.Services.Customers;
using Nop.Services.Localization;
using Nop.Core.Data;
using Nop.Core.Domain.Common;
using Nop.Core.Domain.Orders;

namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public class CameleoCustomerEventService : ICameleoCustomerEventService
    {
        #region Fields

        private readonly IEventPublisher _eventPublisher;
        private readonly IRepository<CameleoCustomerEvent> _customerEventRepository;
        private readonly IRepository<CameleoEvent> _eventRepository;
        private readonly IRepository<CameleoEventUser> _eventUserRepository;
        private readonly IOrderService _orderService;
        IRepository<GenericAttribute> _genericAttributeRepository;
        private readonly IGenericAttributeService _genericAttributeService;
        private readonly ICameleoEventUserService _eventUserService;
        private readonly ICameleoEventService _eventService;        
        private readonly IWorkContext _workContext;
        private readonly ILocalizationService _localizationService;
        private readonly ICustomerService _customerService;

        #endregion

        #region Ctor

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoCustomerEventService(IEventPublisher eventPublisher, IRepository<CameleoCustomerEvent> customerEventRepository, IRepository<CameleoEvent> eventRepository, 
            IRepository<CameleoEventUser> eventUserRepository, IOrderService orderService, IRepository<GenericAttribute> genericAttributeRepository,
            IGenericAttributeService genericAttributeService, ICameleoEventUserService eventUserService, IWorkContext workContext, ILocalizationService localizationService,
            ICameleoEventService eventService, ICustomerService customerService)
        {
            _eventPublisher = eventPublisher;            
            _customerEventRepository= customerEventRepository;
            _eventRepository = eventRepository;
            _eventUserRepository = eventUserRepository;
            _orderService = orderService;
            _genericAttributeRepository = genericAttributeRepository;
            _genericAttributeService = genericAttributeService;
            _eventUserService = eventUserService;            
            _workContext = workContext;
            _localizationService = localizationService;
            _eventService = eventService;
            _customerService = customerService;
        }

        #endregion

        #region Methods
        /// <summary>
        /// Gets a customer event user by id
        /// </summary>                
        /// <returns>CameleoCustomerEventViewModel</returns>
        public CameleoCustomerEventViewModel GetCustomerEventViewModel(int customerEventId)
        {
            var tmpCustomerEvent = GetCustomerEventById(customerEventId);
            if (tmpCustomerEvent == null)
            {
                return null;
            }
            else
            {                
                CameleoCustomerEventViewModel customerEventViewModel = new CameleoCustomerEventViewModel(tmpCustomerEvent, _customerService.GetCustomerById(tmpCustomerEvent.CustomerId).Username, _localizationService.GetResource(AcceptedStatusStrings.LocalizedStringValues[tmpCustomerEvent.AcceptedStatus]));
                var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
                var tmpEvent = _eventService.GetEventById(tmpEventUser.EventId);
                customerEventViewModel.CameleoEventUser = new CameleoEventUserViewModel(tmpEventUser, _eventUserService.GetEventUsersCount(_eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId)), _eventUserService.GetAcceptedEventUsersCount(_eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId)));
                customerEventViewModel.CameleoEvent = new CameleoEventViewModel(tmpEvent, _eventService.GetAllGroupsForEvent(tmpEventUser.EventId), _localizationService.GetResource(CameleoEventStatusStrings.LocalizedStringValues[tmpEvent.Status]));
                return customerEventViewModel;
            }
        }

        /// <summary>
        /// Gets all customer events for a given customer
        /// </summary>
        /// <returns>customer events</returns>
        public CameleoCustomerEventListViewModel GetCustomerEventListViewModel(int customerId)
        {
            var records = GetAllCustomerEvents(customerId);
            CameleoCustomerEventListViewModel customerEventListViewModel = new CameleoCustomerEventListViewModel();
            var events = records
                .Select(x =>
                {
                    var m = new CameleoCustomerEventViewModel()
                    {
                        Id = x.Id,
                        EventUserId = x.EventUserId,
                        CustomerId = x.CustomerId,
                        CustomerUserName = _customerService.GetCustomerById(x.CustomerId).Username,
                        Paid = x.Paid,
                        Accepted = x.Accepted,
                        AcceptedStatus = x.AcceptedStatus,
                        AcceptedStatusString = _localizationService.GetResource(AcceptedStatusStrings.LocalizedStringValues[x.AcceptedStatus]),
                        AcceptedImageUse = x.AcceptedImageUse,
                        CreatedOnUtc = x.CreatedOnUtc,
                        CameleoEventUser = new CameleoEventUserViewModel(_eventUserService.GetEventUserById(x.EventUserId), _eventUserService.GetEventUsersCount(_eventUserService.GetEventUserById(x.EventUserId)), _eventUserService.GetAcceptedEventUsersCount(_eventUserService.GetEventUserById(x.EventUserId))),
                        CameleoEvent = new CameleoEventViewModel(_eventService.GetEventByEventUserId(x.EventUserId), _eventService.GetAllGroupsForEvent(_eventService.GetEventByEventUserId(x.EventUserId).Id), _localizationService.GetResource(CameleoEventStatusStrings.LocalizedStringValues[_eventService.GetEventByEventUserId(x.EventUserId).Status])),
                    };
                    return m;
                })
                .ToList();
            customerEventListViewModel.CameleoCustomerEventList = events;
            return customerEventListViewModel;
        }

        /// <summary>
        /// Gets recent customer events registrations
        /// </summary>
        /// <returns>customer events</returns>
        public RecentRegistrationListViewModel GetRecentRegistrationListViewModel(int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = from tr in _customerEventRepository.Table
                        orderby tr.CreatedOnUtc descending
                        select tr;
            var records = new PagedList<CameleoCustomerEvent>(query, pageIndex, pageSize);

            RecentRegistrationListViewModel recentRegistrationListViewModel = new RecentRegistrationListViewModel();
            var events = records
                .Select(x =>
                {
                    var m = new CameleoCustomerEventViewModel()
                    {
                        Id = x.Id,
                        EventUserId = x.EventUserId,
                        CustomerId = x.CustomerId,
                        CustomerUserName = _customerService.GetCustomerById(x.CustomerId).Username,
                        Paid = x.Paid,
                        Accepted = x.Accepted,
                        AcceptedStatus = x.AcceptedStatus,
                        AcceptedStatusString = _localizationService.GetResource(AcceptedStatusStrings.LocalizedStringValues[x.AcceptedStatus]),
                        AcceptedImageUse = x.AcceptedImageUse,
                        CreatedOnUtc = x.CreatedOnUtc,
                        CameleoEventUser = new CameleoEventUserViewModel(_eventUserService.GetEventUserById(x.EventUserId), _eventUserService.GetEventUsersCount(_eventUserService.GetEventUserById(x.EventUserId)), _eventUserService.GetAcceptedEventUsersCount(_eventUserService.GetEventUserById(x.EventUserId))),
                        CameleoEvent = new CameleoEventViewModel(_eventService.GetEventByEventUserId(x.EventUserId), _eventService.GetAllGroupsForEvent(_eventService.GetEventByEventUserId(x.EventUserId).Id), _localizationService.GetResource(CameleoEventStatusStrings.LocalizedStringValues[_eventService.GetEventByEventUserId(x.EventUserId).Status]))
                    };
                    return m;
                })
                .ToList();
            recentRegistrationListViewModel.RecentRegistrationList = events;
            recentRegistrationListViewModel.TotalCount = records.TotalCount;
            return recentRegistrationListViewModel;
        }

        /// <summary>
        /// Gets customer events related to a given group in a given event
        /// </summary>
        /// <returns>customer events</returns>
        public CameleoCustomerEventListViewModel GetCustomerEventListViewModel(int pEventId, string pGroup)
        {
            var records = GetAllCustomerEventsForGroup(pEventId, pGroup);
            CameleoCustomerEventListViewModel customerEventListViewModel = new CameleoCustomerEventListViewModel();
            var tmpEvent = _eventService.GetEventById(pEventId);
            var tmpEventGroups = _eventService.GetAllGroupsForEvent(pEventId);
            var tmpEventUserCount = _eventUserService.GetEventUsersCount(pEventId, pGroup);
            var tmpAcceptedEventUserCount = _eventUserService.GetAcceptedEventUsersCount(pEventId, pGroup);
            var events = records
                .Select(x =>
                {
                    var m = new CameleoCustomerEventViewModel()
                    {
                        Id = x.Id,
                        EventUserId = x.EventUserId,
                        CustomerId = x.CustomerId,
                        CustomerUserName = _customerService.GetCustomerById(x.CustomerId) == null ? "" : _customerService.GetCustomerById(x.CustomerId).Username,
                        Paid = x.Paid,
                        Accepted = x.Accepted,
                        AcceptedStatus = x.AcceptedStatus,
                        AcceptedStatusString = _localizationService.GetResource(AcceptedStatusStrings.LocalizedStringValues[x.AcceptedStatus]),
                        AcceptedImageUse = x.AcceptedImageUse,
                        CreatedOnUtc = x.CreatedOnUtc,
                        CameleoEventUser = new CameleoEventUserViewModel(_eventUserService.GetEventUserById(x.EventUserId), tmpEventUserCount, tmpAcceptedEventUserCount),
                        CameleoEvent = new CameleoEventViewModel(tmpEvent, tmpEventGroups, _localizationService.GetResource(CameleoEventStatusStrings.LocalizedStringValues[tmpEvent.Status])),
                    };
                    return m;
                })
                .ToList();
            customerEventListViewModel.CameleoCustomerEventList = events;
            customerEventListViewModel.ForSameGroup = true;
            customerEventListViewModel.EventId = pEventId;
            customerEventListViewModel.GroupName = pGroup;
            return customerEventListViewModel;
        }
        

        /// <summary>
        /// Gets customer events related to a shopping cart 
        /// </summary>
        /// <returns>customer event</returns>
        public IPagedList<CameleoCustomerEvent> GetCustomerEventsFromShoppingCart(ICollection <ShoppingCartItem> ShoppingCartItems, int shoppingCartId, int pageIndex = 0, int pageSize = int.MaxValue) 
        {
            var tmpCustomerEvents = new List<CameleoCustomerEvent>();

            //Get cart item            
            var cartItem = ShoppingCartItems
                .Where(sci => sci.Id == shoppingCartId)
                .FirstOrDefault();
            if (!(cartItem == null))
            {
                //Get customer event id from attributes
                var tmpAttributes = _genericAttributeService.GetAttributesForEntity(cartItem.Id, "ShoppingCartItem");
                foreach (var tmpAttribute in tmpAttributes)
                {
                    //Get customer event
                    int tmpId = 0;
                    if (int.TryParse(tmpAttribute.Value, out tmpId))
                    {
                        var tmpCustomerEvent = GetCustomerEventById(tmpId);
                        if (!(tmpCustomerEvent == null))
                        {
                            //Customer event found
                            tmpCustomerEvents.Add(tmpCustomerEvent);
                        }
                    }
                }
            }

            var records = new PagedList<CameleoCustomerEvent>(tmpCustomerEvents, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets all customer events related to an order
        /// </summary>
        /// <returns>customer events</returns>
        public IPagedList<CameleoCustomerEvent> GetCustomerEventsFromOrder(int orderId, int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var tmpCustomerEvents = new List<CameleoCustomerEvent>();

            //Get order
            var tmpOrder = _orderService.GetOrderById(orderId);
            if (!(tmpOrder == null))
            {
                //Find attributes for this order 
                string tmpGUID = tmpOrder.OrderGuid.ToString();
                var query = from ga in _genericAttributeRepository.Table
                            where ga.Value == tmpGUID && ga.KeyGroup == "ShoppingCartItem"
                            select ga;
                var tmpOrderAttribute = query.FirstOrDefault();

                //Get deleted cart item ids
                if (!(tmpOrderAttribute == null))
                {
                    var tmpDeletedCartItemId = tmpOrderAttribute.EntityId;

                    //Get all cart item attributes
                    var tmpCartAttributes = _genericAttributeService.GetAttributesForEntity(tmpDeletedCartItemId, "ShoppingCartItem");

                    foreach (var tmpCartAttribute in tmpCartAttributes)
                    {
                        //Customer event attribute?
                        if (tmpCartAttribute.Key.Contains("CameleoCustomerEvent"))
                        {
                            //Yes
                            //Get customer event
                            int tmpId = 0;
                            if (int.TryParse(tmpCartAttribute.Value, out tmpId))
                            {
                                var tmpCustomerEvent = GetCustomerEventById(tmpId);
                                if (!(tmpCustomerEvent == null))
                                {
                                    //Customer event found
                                    tmpCustomerEvents.Add(tmpCustomerEvent);
                                }
                            }
                        }
                    }
                }
            }

            var records = new PagedList<CameleoCustomerEvent>(tmpCustomerEvents, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets all events for a given customer
        /// </summary>
        /// <returns>CameleoCustomerEvents</returns>
        public IPagedList<CameleoCustomerEvent> GetAllCustomerEvents(int customerId, int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = from tr in _customerEventRepository.Table
                        where tr.CustomerId == customerId
                        orderby tr.EventUserId
                        select tr;
            var records = new PagedList<CameleoCustomerEvent>(query, pageIndex, pageSize);
            
            return records;
        }

        /// <summary>
        /// Gets all events for a given group in a given event
        /// </summary>
        /// <returns>CameleoCustomerEvents</returns>
        public IList<CameleoCustomerEvent> GetAllCustomerEventsForGroup(int eventId, string groupName)
        {
            var query = from ce in _customerEventRepository.Table
                            join eu in _eventUserRepository.Table on ce.EventUserId equals eu.Id
                            where eu.Group == groupName && eu.EventId == eventId
                            orderby eu.UserName
                            select ce;             
            var records = new List<CameleoCustomerEvent>(query);

            return records;
        }

        /// <summary>
        /// Gets all events for a given group in a given event that did not answer yet
        /// </summary>
        /// <returns>CameleoCustomerEvents</returns>
        public IList<CameleoCustomerEvent> GetAllNoAnswerCustomerEventsForGroup(int eventId, string groupName)
        {
            var query = from ce in _customerEventRepository.Table
                        join eu in _eventUserRepository.Table on ce.EventUserId equals eu.Id
                        where eu.Group == groupName && eu.EventId == eventId && ce.AcceptedStatus == (int)AcceptedStatus.ToBeCompleted
                        orderby eu.UserName
                        select ce;
            var records = new List<CameleoCustomerEvent>(query);

            return records;
        }

        /// <summary>
        /// Gets a customer event user by id
        /// </summary>        
        /// <param name="customerId">Customer Event</param>
        /// <returns>CameleoCustomerEvent</returns>
        public CameleoCustomerEvent GetCustomerEventById(int? customerEventId)        
        {
            if (customerEventId == null || customerEventId == 0)
                return null;

            return _customerEventRepository.GetById(customerEventId);
        }

        /// <summary>
        /// Gets a customer event user by event user id and customer id
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <param name="customerId">Customer identifier</param>
        /// <returns>CameleoCustomerEvent</returns>
        public CameleoCustomerEvent GetCustomerEvent(int eventUserId, int customerId) 
        {
            var query = (from tr in _customerEventRepository.Table
                        where tr.CustomerId == customerId && tr.EventUserId == eventUserId
                        orderby tr.EventUserId
                        select new 
                        {
                            Id = tr.Id,
                            CustomerId = tr.CustomerId,
                            EventUserId = tr.EventUserId,
                            Paid = tr.Paid,
                            Accepted = tr.Accepted,
                            AcceptedStatus = tr.AcceptedStatus,
                            AcceptedImageUse = tr.AcceptedImageUse,
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
                    return _customerEventRepository.GetById(tmp.Id);                   
                }
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Inserts a customer event
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <param name="customerId">Customer identifier</param>
        public void InsertCustomerEvent(int eventUserId, int customerId)
        {
            var tmpCustomerEvent = new CameleoCustomerEvent();
            tmpCustomerEvent.CustomerId = customerId;
            tmpCustomerEvent.EventUserId = eventUserId;
            tmpCustomerEvent.Accepted = false;
            tmpCustomerEvent.AcceptedStatus = (int)AcceptedStatus.ToBeCompleted;
            tmpCustomerEvent.AcceptedImageUse = false;
            tmpCustomerEvent.Paid = false;
            tmpCustomerEvent.CreatedOnUtc = DateTime.Now;

            _customerEventRepository.Insert(tmpCustomerEvent);

            //event notification
            _eventPublisher.EntityInserted(tmpCustomerEvent);
        }

       
        /// <summary>
        /// Inserts a customer event
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <param name="customerId">Customer identifier</param>
        /// <param name="acceptedStatus">Accepted status</param>
        /// <param name="acceptedImageUse">Accept to use image</param>
        /// <param name="paid">Paid status</param>
        public void InsertCustomerEvent(int eventUserId, int customerId, int acceptedStatus, bool acceptedImageUse, bool paid = false)
        {
            var tmpCustomerEvent = new CameleoCustomerEvent();
            tmpCustomerEvent.CustomerId = customerId;
            tmpCustomerEvent.EventUserId = eventUserId;
            if (acceptedStatus == (int)AcceptedStatus.ToBeCompleted || acceptedStatus == (int)AcceptedStatus.Refused)
            {
                tmpCustomerEvent.Accepted = false;
            }
            else
            {
                tmpCustomerEvent.Accepted = true;
            }

            tmpCustomerEvent.AcceptedStatus = acceptedStatus;
            tmpCustomerEvent.AcceptedImageUse = acceptedImageUse;
            tmpCustomerEvent.Paid = paid;
            tmpCustomerEvent.CreatedOnUtc = DateTime.Now;

            _customerEventRepository.Insert(tmpCustomerEvent);

            //event notification
            _eventPublisher.EntityInserted(tmpCustomerEvent);
        }

        /// <summary>
        /// Update a customer event
        /// </summary>
        /// <param name="customerEvent">Customer Event</param>                
        public void UpdateCustomerEvent(CameleoCustomerEvent customerEvent)
        {
            if (customerEvent == null)
            {
                throw new ArgumentNullException("customerevent");
            }

            _customerEventRepository.Update(customerEvent);
             

            //event notification
            _eventPublisher.EntityUpdated(customerEvent);
        }

        /// <summary>
        /// Deletes a customer event
        /// </summary>
        /// <param name="customerEvent">Customer Event</param>                
        public void DeleteCustomerEvent(CameleoCustomerEvent customerEvent)
        {
            if (customerEvent == null)
                throw new ArgumentNullException("customerEvent");

            _customerEventRepository.Delete(customerEvent);
            
            //event notification
            _eventPublisher.EntityDeleted(customerEvent);
        }
        #endregion
    }
}