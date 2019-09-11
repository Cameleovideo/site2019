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
    public partial interface ICameleoProjectCategoryService
    {        
        /// <summary>
        /// Get ProjectCategoryListViewModel for all Project categories
        /// </summary> 
        ProjectCategoryListViewModel GetProjectCategoryListViewModel();

        /// <summary>
        /// Get ProjectCategoryViewModel
        /// </summary>        
        ProjectCategoryViewModel GetProjectCategoryViewModel(int projectCategoryId);

        /// <summary>
        /// Deletes a project category
        /// </summary>
        /// <param name="pProjectCategory">Project category</param>
        void DeleteProjectCategory(CameleoProjectCategory pProjectCategory);

        /// <summary>
        /// Gets all project categories
        /// </summary>
        /// <returns>project categories</returns>
        IPagedList<CameleoProjectCategory> GetAllProjectCategories(int pageIndex = 0, int pageSize = int.MaxValue);        

        /// <summary>
        /// Gets a project category by id
        /// </summary>
        /// <param name="projectCategoryId">Project Category identifier</param>
        /// <returns>Project Category</returns>
        CameleoProjectCategory GetProjectCategoryById(int projectCategoryId);        

        /// <summary>
        /// Inserts a project category
        /// </summary>
        /// <param name="pProjectCategory">Project Category</param>
        void InsertProjectCategory(CameleoProjectCategory pProjectCategory);

        /// <summary>
        /// Updates a project category
        /// </summary>
        /// <param name="pProjectCategory">ProjectCategory</param>
        void UpdateProjectCategory(CameleoProjectCategory pProjectCategory);
    }
}
