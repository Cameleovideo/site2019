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
    public partial interface ICameleoProjectService
    {        

        /// <summary>
        /// Deletes a project
        /// </summary>
        /// <param name="pProject">Project</param>
        void DeleteProject(CameleoProject pProject);

        /// <summary>
        /// Gets all projects
        /// </summary>
        /// <returns>projects</returns>
        IPagedList<CameleoProject> GetAllProjects(int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all projects for an event
        /// </summary>
        /// <returns>projects</returns>
        List<CameleoProject> GetAllProjectsForEvent(int eventId);

        /// <summary>
        /// Gets a project by id
        /// </summary>
        /// <param name="projectId">Project identifier</param>
        /// <returns>Project</returns>
        CameleoProject GetProjectById(int projectId);

        /// <summary>
        /// Gets projects for a customer event
        /// </summary>
        /// <param name="customerEventId">Customer Event identifier</param>
        /// <returns>Projects</returns>
        List<CameleoProject> GetAllProjectsByCustomerEvent(int customerEventId);

        /// <summary>
        /// Inserts a project
        /// </summary>
        /// <param name="pProject">Project</param>
        void InsertProject(CameleoProject pProject);

        /// <summary>
        /// Updates a project
        /// </summary>
        /// <param name="pProject">Project</param>
        void UpdateProject(CameleoProject pProject);
    }
}
