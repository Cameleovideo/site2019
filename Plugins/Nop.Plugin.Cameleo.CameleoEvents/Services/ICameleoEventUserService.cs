using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Core;

namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public interface ICameleoEventUserService
    {
        /// <summary>
        /// Gets all event users for a given group in a given event
        /// </summary>
        /// <returns>event users</returns>
        CameleoEventUserListViewModel GetEventUserListViewModel(int pEventId, string pGroup);

        /// <summary>
        /// Gets all event users for all groups in a given event
        /// </summary>
        /// <returns>event users</returns>
        CameleoEventUserListViewModel GetEventUserListViewModel(int pEventId);

        /// <summary>
        /// Deletes a event user
        /// </summary>
        /// <param name="eventUser">Event user</param>
        void DeleteEventUser(CameleoEventUser eventUser);

        /// <summary>
        /// Gets all event users
        /// </summary>
        /// <returns>event users</returns>
        IPagedList<CameleoEventUser> GetAllEventUsers(int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all event users for a given event
        /// </summary>
        /// <returns>event users</returns>
        IPagedList<CameleoEventUser> GetAllEventUsers(int pEventId, int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all event users for a given event and group
        /// </summary>
        /// <returns>event users</returns>
        IPagedList<CameleoEventUser> GetAllEventUsers(int pEventId, string pGroupName, int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all event users that did not answer for a given event and group
        /// </summary>
        /// <returns>event users</returns>
        IPagedList<CameleoEventUser> GetNoAnswerEventUsers(int pEventId, string pGroup, int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets number of event users for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        int GetEventUsersCount(CameleoEventUser pEventUser);

        /// <summary>
        /// Gets number of event users for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        int GetEventUsersCount(int eventId, string pGroup);

        /// <summary>
        /// Gets number of event users that have accepted to participate for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        int GetAcceptedEventUsersCount(CameleoEventUser pEventUser);

        /// <summary>
        /// Gets number of event users that have accepted to participate for a given event and group
        /// </summary>
        /// <returns>number of event users</returns>
        int GetAcceptedEventUsersCount(int eventId, string pGroup);

        /// <summary>
        /// Gets a event user by username
        /// </summary>
        /// <param name="userNAme">Event user username</param>
        /// <returns>Event user</returns>
        CameleoEventUser GetEventUserByUserName(string userName);

        /// <summary>
        /// Gets a event user by id
        /// </summary>
        /// <param name="eventUserId">Event user identifier</param>
        /// <returns>Event user</returns>
        CameleoEventUser GetEventUserById(int eventUserId);

        /// <summary>
        /// Inserts a event user
        /// </summary>
        /// <param name="eventUser">Event user</param>
        void InsertEventUser(CameleoEventUser eventUser);

        /// <summary>
        /// Updates a event user
        /// </summary>
        /// <param name="eventUser">Event user</param>
        void UpdateEventUser(CameleoEventUser eventUser);
    }
}
