using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Core.Domain.Orders;
using Nop.Core;

namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public interface ICameleoCustomerEventService
    {
         /// <summary>
        /// Gets a customer event user by id
        /// </summary>                
        /// <returns>CameleoCustomerEventViewModel</returns>
        CameleoCustomerEventViewModel GetCustomerEventViewModel(int customerEventId);

        /// <summary>
        /// Gets all customer events for a given customer
        /// </summary>
        /// <returns>customer events</returns>
        CameleoCustomerEventListViewModel GetCustomerEventListViewModel(int customerId);

        /// <summary>
        /// Gets recent customer events registrations
        /// </summary>
        /// <returns>customer events</returns>
        RecentRegistrationListViewModel GetRecentRegistrationListViewModel(int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets customer events related to a given group in a given event
        /// </summary>
        /// <returns>customer events</returns>
        CameleoCustomerEventListViewModel GetCustomerEventListViewModel(int pEventId, string pGroup);

        /// <summary>
        /// Gets customer events related to a shopping cart
        /// </summary>
        /// <returns>customer event</returns>
        IPagedList<CameleoCustomerEvent> GetCustomerEventsFromShoppingCart(ICollection <ShoppingCartItem> ShoppingCartItems, int shoppingCartId, int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all customer events related to an order
        /// </summary>
        /// <returns>customer events</returns>
        IPagedList<CameleoCustomerEvent> GetCustomerEventsFromOrder(int orderId, int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all events for a given customer
        /// </summary>
        /// <returns>CameleoCustomerEvents</returns>
        IPagedList<CameleoCustomerEvent> GetAllCustomerEvents(int customerId, int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all events for a given group in a given event
        /// </summary>
        /// <returns>CameleoCustomerEvents</returns>
        IList<CameleoCustomerEvent> GetAllCustomerEventsForGroup(int eventId, string groupName);

        /// <summary>
        /// Gets all events for a given group in a given event that did not answer yet
        /// </summary>
        /// <returns>CameleoCustomerEvents</returns>
        IList<CameleoCustomerEvent> GetAllNoAnswerCustomerEventsForGroup(int eventId, string groupName);

        /// <summary>
        /// Gets a customer event user by id
        /// </summary>        
        /// <param name="customerId">Customer Event</param>
        /// <returns>CameleoCustomerEvent</returns>
        CameleoCustomerEvent GetCustomerEventById(int? customerEventId);

        /// <summary>
        /// Gets a customer event user by event user id and customer id
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <param name="customerId">Customer identifier</param>
        /// <returns>CameleoCustomerEvent</returns>
        CameleoCustomerEvent GetCustomerEvent(int eventUserId, int customerId);

        /// <summary>
        /// Inserts a customer event
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <param name="customerId">Customer identifier</param>
        void InsertCustomerEvent(int eventUserId, int customerId);

        /// <summary>
        /// Inserts a customer event
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <param name="customerId">Customer identifier</param>
        /// <param name="acceptedStatus">Accepted status</param>
        /// <param name="acceptedImageUse">Accept to use image</param>
        void InsertCustomerEvent(int eventUserId, int customerId, int acceptedStatus, bool acceptedImageUse, bool paid = false);        

        /// <summary>
        /// Update a customer event
        /// </summary>
        /// <param name="customerEvent">Customer Event</param>                
        void UpdateCustomerEvent(CameleoCustomerEvent customerEvent);

        /// <summary>
        /// Deletes a customer event
        /// </summary>
        /// <param name="customerEvent">Customer Event</param>  
        void DeleteCustomerEvent(CameleoCustomerEvent customerEvent);
    }
}