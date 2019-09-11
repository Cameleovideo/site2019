﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class ProjectSubCategoryListViewModel : BaseNopModel
    {
        public ProjectSubCategoryListViewModel()
        {
            ProjectSubCategoryList = new List<ProjectSubCategoryViewModel>();
        }

        public IList<ProjectSubCategoryViewModel> ProjectSubCategoryList { get; set; }        
    }
}