using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class ProjectCategoryListViewModel : BaseNopModel
    {
        public ProjectCategoryListViewModel()
        {
            ProjectCategoryList = new List<ProjectCategoryViewModel>();
        }

        public IList<ProjectCategoryViewModel> ProjectCategoryList { get; set; }        
    }
}