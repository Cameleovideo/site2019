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
    public class CameleoProjectSubCategoryService : ICameleoProjectSubCategoryService
    {
        #region Fields

        private readonly IEventPublisher _eventPublisher;
        private readonly IRepository<CameleoProjectSubCategory> _projectSubCategoryRepository;        
        private readonly ILocalizationService _localizationService;        

        #endregion

        #region Ctor

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoProjectSubCategoryService(IEventPublisher eventPublisher, IRepository<CameleoProjectSubCategory> projectSubCategoryRepository, ILocalizationService localizationService)
        {
            _eventPublisher = eventPublisher;
            _projectSubCategoryRepository = projectSubCategoryRepository;            
            _localizationService = localizationService;            
        }

        #endregion

        #region Methods        

        /// <summary>
        /// Get ProjectSubCategoryListViewModel for a Project category
        /// </summary> 
        public ProjectSubCategoryListViewModel GetProjectSubCategoryListViewModel(int categoryId)
        {
            var records = GetAllProjectSubCategoriesForCategory(categoryId);
            var projectSubCategoriesModel = records
                .Select(x =>
                {
                    var m = new ProjectSubCategoryViewModel()
                    {
                        ProjectCategoryId = x.ProjectCategoryId,
                        Id = x.Id,
                        Name = x.Name,
                        Description = x.Description,
                        CreatedOnUtc = x.CreatedOnUtc,
                    };
                    return m;
                })
                .ToList();
            var model = new ProjectSubCategoryListViewModel();
            model.ProjectSubCategoryList = projectSubCategoriesModel;

            return model;
        }

        /// <summary>
        /// Get ProjectSubCategoryViewModel
        /// </summary>        
        public ProjectSubCategoryViewModel GetProjectSubCategoryViewModel(int projectSubCategoryId)
        {
            var tmpSubCategory = GetProjectSubCategoryById(projectSubCategoryId);
            if (tmpSubCategory == null)
            {
                return null;
            }
            else
            {
                ProjectSubCategoryViewModel projectSubCategoryViewModel = new ProjectSubCategoryViewModel(tmpSubCategory);
                return projectSubCategoryViewModel;
            }
        }

        /// <summary>
        /// Deletes a project Sub category 
        /// </summary>
        /// <param name="pProjectSubCategory">Project Sub category</param>
        public void DeleteProjectSubCategory(CameleoProjectSubCategory pProjectSubCategory)
        {
            if (pProjectSubCategory == null)
            {
                throw new ArgumentNullException("project sub category");
            }

            _projectSubCategoryRepository.Delete(pProjectSubCategory);

            //event notification
            _eventPublisher.EntityDeleted(pProjectSubCategory);
        }

        /// <summary>
        /// Gets all project Sub categories
        /// </summary>
        /// <returns>project Sub categories</returns>
        public IPagedList<CameleoProjectSubCategory> GetAllProjectSubCategories(int pageIndex = 0, int pageSize = int.MaxValue)
        {
            var query = _projectSubCategoryRepository.Table;
            query = query.OrderBy(c => c.CreatedOnUtc).OrderByDescending(c => c.CreatedOnUtc);

            var records = new PagedList<CameleoProjectSubCategory>(query, pageIndex, pageSize);
            return records;
        }

        /// <summary>
        /// Gets all projects sub categories for a project category
        /// </summary>
        /// <returns>projects sub categories</returns>
        public List<CameleoProjectSubCategory> GetAllProjectSubCategoriesForCategory(int projectCategoryId)
        {
            var query = _projectSubCategoryRepository.Table;
            query = query
                        .Where(c => c.ProjectCategoryId == projectCategoryId)
                        .OrderBy(c => c.CreatedOnUtc).OrderByDescending(c => c.CreatedOnUtc);

            var records = new List<CameleoProjectSubCategory>(query);
            return records;        
        }


        /// <summary>
        /// Gets a project sub category by id
        /// </summary>
        /// <param name="projectSubCategoryId">Project Sub Category identifier</param>
        /// <returns>Project Sub Category</returns>
        public CameleoProjectSubCategory GetProjectSubCategoryById(int projectSubCategoryId)
        {
            if (projectSubCategoryId == 0)
            {
                return null;
            }

            return _projectSubCategoryRepository.GetById(projectSubCategoryId);
        }


        /// <summary>
        /// Inserts a project sub category
        /// </summary>
        /// <param name="pProjectSubCategory">Project Sub Category</param>
        public void InsertProjectSubCategory(CameleoProjectSubCategory pProjectSubCategory)
        {
            if (pProjectSubCategory == null)
            {
                throw new ArgumentNullException("project sub category");
            }

            pProjectSubCategory.CreatedOnUtc = DateTime.Now;

            _projectSubCategoryRepository.Insert(pProjectSubCategory);

            //event notification
            _eventPublisher.EntityInserted(pProjectSubCategory);
        }

        /// <summary>
        /// Updates a project sub category
        /// </summary>
        /// <param name="pProjectSubCategory">Project Sub Category</param>
        public void UpdateProjectSubCategory(CameleoProjectSubCategory pProjectSubCategory)
        {
            if (pProjectSubCategory == null)
            {
                throw new ArgumentNullException("project sub category");
            }

            _projectSubCategoryRepository.Update(pProjectSubCategory);

            //event notification
            _eventPublisher.EntityUpdated(pProjectSubCategory);
        }
        #endregion
    }
}
