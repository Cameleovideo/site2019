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
    public class CameleoProjectService : ICameleoProjectService
    {
        #region Fields

        private readonly IEventPublisher _eventPublisher;
        private readonly IRepository<CameleoProject> _projectRepository;        
        private readonly ILocalizationService _localizationService;        

        #endregion

        #region Ctor

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoProjectService(IEventPublisher eventPublisher, IRepository<CameleoProject> projectRepository, ILocalizationService localizationService)
        {
            _eventPublisher = eventPublisher;            
            _projectRepository = projectRepository;            
            _localizationService = localizationService;            
        }

        #endregion

        #region Methods        

        /// <summary>
        /// Deletes a project
        /// </summary>
        /// <param name="pProject">Project</param>
        public void DeleteProject(CameleoProject pProject)
        {
            if (pProject == null)
            {
                throw new ArgumentNullException("project");
            }

            _projectRepository.Delete(pProject);

            //event notification
            _eventPublisher.EntityDeleted(pProject);
        }

        /// <summary>
        /// Gets all projects
        /// </summary>
        /// <returns>projects</returns>
        public IPagedList<CameleoProject> GetAllProjects(int pageIndex = 0, int pageSize = int.MaxValue)
        {            
            var query = _projectRepository.Table;
            query = query.OrderBy(c => c.CreatedOnUtc).OrderByDescending(c => c.CreatedOnUtc);
            
            var records = new PagedList<CameleoProject>(query, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets all projects for an event
        /// </summary>
        /// <returns>projects</returns>
        public List<CameleoProject> GetAllProjectsForEvent(int eventId)
        {
            var query = _projectRepository.Table;
            query = query
                        .Where(c => c.EventId == eventId)
                        .OrderBy(c => c.CreatedOnUtc).OrderByDescending(c => c.CreatedOnUtc);

            var records = new List<CameleoProject>(query);
            return records;          
        }


        /// <summary>
        /// Gets a project by id
        /// </summary>
        /// <param name="projectId">Project identifier</param>
        /// <returns>Project</returns>
        public CameleoProject GetProjectById(int projectId)
        {
            if (projectId == 0)
            {
                return null;
            }

            return _projectRepository.GetById(projectId);
        }

        /// <summary>
        /// Gets projects for a customer event
        /// </summary>
        /// <param name="customerEventId">Customer Event identifier</param>
        /// <returns>Projects</returns>
        public List<CameleoProject> GetAllProjectsByCustomerEvent(int customerEventId) 
        {
            var query = _projectRepository.Table;
            query = query
                        .Where(c => c.CustomerEventId == customerEventId)
                        .OrderBy(c => c.CreatedOnUtc).OrderByDescending(c => c.CreatedOnUtc);

            var records = new List<CameleoProject>(query);
            return records;          
        }

        /// <summary>
        /// Inserts a project
        /// </summary>
        /// <param name="pProject">Project</param>
        public void InsertProject(CameleoProject pProject)
        {
            if (pProject == null)
            {
                throw new ArgumentNullException("project");
            }

            pProject.CreatedOnUtc = DateTime.Now;

            _projectRepository.Insert(pProject);

            //event notification
            _eventPublisher.EntityInserted(pProject);
        }

        /// <summary>
        /// Updates a project
        /// </summary>
        /// <param name="pProject">Project</param>
        public void UpdateProject(CameleoProject pProject)
        {
            if (pProject == null)
            {
                throw new ArgumentNullException("project");
            }

            _projectRepository.Update(pProject);

            //event notification
            _eventPublisher.EntityUpdated(pProject);
        }
        #endregion
    }
}
