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
    public class CameleoProjectCategoryService : ICameleoProjectCategoryService
    {
        #region Fields

        private readonly IEventPublisher _eventPublisher;
        private readonly IRepository<CameleoProjectCategory> _projectCategoryRepository;        
        private readonly ILocalizationService _localizationService;        

        #endregion

        #region Ctor

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoProjectCategoryService(IEventPublisher eventPublisher, IRepository<CameleoProjectCategory> projectCategoryRepository, ILocalizationService localizationService)
        {
            _eventPublisher = eventPublisher;
            _projectCategoryRepository = projectCategoryRepository;            
            _localizationService = localizationService;            
        }

        #endregion

        #region Methods    
    
        /// <summary>
        /// Get ProjectCategoryListViewModel for all Project categories
        /// </summary> 
        public ProjectCategoryListViewModel GetProjectCategoryListViewModel()
        {
            var records = GetAllProjectCategories();
            var projectCategoriesModel = records
                .Select(x =>
                {
                    var m = new ProjectCategoryViewModel()
                    {
                        Id = x.Id,
                        Name = x.Name,
                        Description = x.Description,
                        CreatedOnUtc = x.CreatedOnUtc,
                    };
                    return m;
                })
                .ToList();
            var model = new ProjectCategoryListViewModel();
            model.ProjectCategoryList = projectCategoriesModel;

            return model;
        }

        /// <summary>
        /// Get ProjectCategoryViewModel
        /// </summary>        
        public ProjectCategoryViewModel GetProjectCategoryViewModel(int projectCategoryId)
        {
            var tmpCategory = GetProjectCategoryById(projectCategoryId);
            if (tmpCategory == null)
            {
                return null;
            }
            else
            {
                ProjectCategoryViewModel projectCategoryViewModel = new ProjectCategoryViewModel(tmpCategory);
                return projectCategoryViewModel;
            }
        }

        /// <summary>
        /// Deletes a project category
        /// </summary>
        /// <param name="pProjectCategory">Project Category</param>
        public void DeleteProjectCategory(CameleoProjectCategory pProjectCategory)
        {
            if (pProjectCategory == null)
            {
                throw new ArgumentNullException("project category");
            }

            _projectCategoryRepository.Delete(pProjectCategory);

            //event notification
            _eventPublisher.EntityDeleted(pProjectCategory);
        }

        /// <summary>
        /// Gets all project categories
        /// </summary>
        /// <returns>project categories</returns>
        public IPagedList<CameleoProjectCategory> GetAllProjectCategories(int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = _projectCategoryRepository.Table;
            query = query.OrderBy(c => c.CreatedOnUtc).OrderByDescending(c => c.CreatedOnUtc);

            var records = new PagedList<CameleoProjectCategory>(query, pageIndex, pageSize);
            return records;
        }
                

        /// <summary>
        /// Gets a project category by id
        /// </summary>
        /// <param name="projectCategoryId">Project Category identifier</param>
        /// <returns>Project Category</returns>
        public CameleoProjectCategory GetProjectCategoryById(int projectCategoryId)
        {
            if (projectCategoryId == 0)
            {
                return null;
            }

            return _projectCategoryRepository.GetById(projectCategoryId);
        }
       

        /// <summary>
        /// Inserts a project category
        /// </summary>
        /// <param name="pProjectCategory">Project Category</param>
        public void InsertProjectCategory(CameleoProjectCategory pProjectCategory)
        {
            if (pProjectCategory == null)
            {
                throw new ArgumentNullException("project category");
            }

            pProjectCategory.CreatedOnUtc = DateTime.Now;

            _projectCategoryRepository.Insert(pProjectCategory);

            //event notification
            _eventPublisher.EntityInserted(pProjectCategory);
        }

        /// <summary>
        /// Updates a project category
        /// </summary>
        /// <param name="pProjectCategory">Project Category</param>
        public void UpdateProjectCategory(CameleoProjectCategory pProjectCategory)
        {
            if (pProjectCategory == null)
            {
                throw new ArgumentNullException("project category");
            }

            _projectCategoryRepository.Update(pProjectCategory);

            //event notification
            _eventPublisher.EntityUpdated(pProjectCategory);
        }
        #endregion
    }
}
