using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Web.Framework.Localization;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using System.Web.Mvc;
using Nop.Plugin.Cameleo.CameleoEvents.Validators;
using FluentValidation.Attributes;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    [Validator(typeof(ProjectSubCategoryValidator))]
    public class ProjectSubCategoryViewModel : BaseNopEntityModel, ILocalizedModel<ProjectSubCategoryLocalizedModel>
    {
        public ProjectSubCategoryViewModel()
        {
            Locales = new List<ProjectSubCategoryLocalizedModel>();
        }

        public ProjectSubCategoryViewModel(CameleoProjectSubCategory pProjectSubCategory)
        {
            Locales = new List<ProjectSubCategoryLocalizedModel>();
            Id = pProjectSubCategory.Id;
            ProjectCategoryId = pProjectSubCategory.ProjectCategoryId;
            Name = pProjectSubCategory.Name;
            Description = pProjectSubCategory.Description;
            CreatedOnUtc = pProjectSubCategory.CreatedOnUtc;            
        }

        [NopResourceDisplayName("Plugins.Cameleo.ProjectSubCategories.Fields.ProjectCategoryId")]        
        public int ProjectCategoryId { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.ProjectSubCategories.Fields.Name")]        
        public string Name { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.ProjectSubCategories.Fields.Description")]
        public string Description { get; set; }
        
        [DisplayFormat(NullDisplayText = "Plugins.Cameleo.CameleoEvents.DateUnknown", DataFormatString = "{0:yyyy-MM-dd}")]
        [NopResourceDisplayName("Plugins.Cameleo.ProjectSubCategories.Fields.CreatedOnUtc")]        
        public DateTime CreatedOnUtc { get; set; }

        //Locales
        public IList<ProjectSubCategoryLocalizedModel> Locales { get; set; }
        
    }

    public partial class ProjectSubCategoryLocalizedModel : ILocalizedModelLocal
    {
        public int LanguageId { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.ProjectSubCategories.Fields.Name")]
        [AllowHtml]
        public string Name { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.ProjectSubCategories.Fields.Description")]
        [AllowHtml]
        public string Description { get; set; }
    }
}