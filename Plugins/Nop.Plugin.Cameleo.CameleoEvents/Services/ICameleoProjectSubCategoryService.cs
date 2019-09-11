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
    public partial interface ICameleoProjectSubCategoryService
    {

        /// <summary>
        /// Get ProjectSubCategoryListViewModel for a Project category
        /// </summary> 
        ProjectSubCategoryListViewModel GetProjectSubCategoryListViewModel(int categoryId);

        /// <summary>
        /// Get ProjectSubCategoryViewModel
        /// </summary>        
        ProjectSubCategoryViewModel GetProjectSubCategoryViewModel(int projectSubCategoryId);

        /// <summary>
        /// Deletes a project Sub category 
        /// </summary>
        /// <param name="pProjectSubCategory">Project Sub category</param>
        void DeleteProjectSubCategory(CameleoProjectSubCategory pProjectSubCategory);

        /// <summary>
        /// Gets all project Sub categories
        /// </summary>
        /// <returns>project Sub categories</returns>
        IPagedList<CameleoProjectSubCategory> GetAllProjectSubCategories(int pageIndex = 0, int pageSize = int.MaxValue);

        /// <summary>
        /// Gets all projects sub categories for a project category
        /// </summary>
        /// <returns>projects sub categories</returns>
        List<CameleoProjectSubCategory> GetAllProjectSubCategoriesForCategory(int projectCategoryId);

        /// <summary>
        /// Gets a project sub category by id
        /// </summary>
        /// <param name="projectSubCategoryId">Project Sub Category identifier</param>
        /// <returns>Project Sub Category</returns>
        CameleoProjectSubCategory GetProjectSubCategoryById(int projectSubCategoryId);        

        /// <summary>
        /// Inserts a project sub category
        /// </summary>
        /// <param name="pProjectSubCategory">Project Sub Category</param>
        void InsertProjectSubCategory(CameleoProjectSubCategory pProjectSubCategory);

        /// <summary>
        /// Updates a project sub category
        /// </summary>
        /// <param name="pProjectSubCategory">Project Sub Category</param>
        void UpdateProjectSubCategory(CameleoProjectSubCategory pProjectSubCategory);
    }
}
