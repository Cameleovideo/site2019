using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Core;
using System.Web.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public partial interface ICameleoEventService
    {
        /// <summary>
        /// Get EventListViewModel for all events
        /// </summary> 
        CameleoEventListViewModel GetEventListViewModel();

        /// <summary>
        /// Get EventViewModel from a CameleoEvent
        /// </summary>        
        CameleoEventViewModel GetEventViewModel(int eventId);

        /// <summary>
        /// Deletes a event
        /// </summary>
        /// <param name="pEvent">Event</param>
        void DeleteEvent(CameleoEvent pEvent);

        /// <summary>
        /// Gets all events
        /// </summary>
        /// <returns>events</returns>
        IPagedList<CameleoEvent> GetAllEvents(int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all groups for an event
        /// </summary>
        /// <returns>groups</returns>
        List<CameleoSelectListItem> GetAllGroupsForEvent(int eventId);

        /// <summary>
        /// Gets a event by id
        /// </summary>
        /// <param name="eventId">Event identifier</param>
        /// <returns>Event</returns>
        CameleoEvent GetEventById(int eventId);

        /// <summary>
        /// Gets a event by event user id
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <returns>Event</returns>
        CameleoEvent GetEventByEventUserId(int eventUserId);

        /// <summary>
        /// Inserts a event
        /// </summary>
        /// <param name="pEvent">Event</param>
        void InsertEvent(CameleoEvent pEvent);

        /// <summary>
        /// Updates a event
        /// </summary>
        /// <param name="pEvent">Event</param>
        void UpdateEvent(CameleoEvent pEvent);
    }
}
