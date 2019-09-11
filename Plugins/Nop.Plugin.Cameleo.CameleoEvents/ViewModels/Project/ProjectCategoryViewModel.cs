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
    [Validator(typeof(ProjectCategoryValidator))]
    public class ProjectCategoryViewModel : BaseNopEntityModel, ILocalizedModel<ProjectCategoryLocalizedModel>
    {
        public ProjectCategoryViewModel()
        {
            Locales = new List<ProjectCategoryLocalizedModel>();
        }

        public ProjectCategoryViewModel(CameleoProjectCategory pProjectCategory)
        {
            Locales = new List<ProjectCategoryLocalizedModel>();
            Id = pProjectCategory.Id;
            Name = pProjectCategory.Name;
            Description = pProjectCategory.Description;
            CreatedOnUtc = pProjectCategory.CreatedOnUtc;            
        }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.ProjectCategories.Fields.Name")]        
        public string Name { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.ProjectCategories.Fields.Description")]
        public string Description { get; set; }
        
        [DisplayFormat(NullDisplayText = "Plugins.Cameleo.CameleoEvents.DateUnknown", DataFormatString = "{0:yyyy-MM-dd}")]
        [NopResourceDisplayName("Plugins.Cameleo.ProjectCategories.Fields.CreatedOnUtc")]        
        public DateTime CreatedOnUtc { get; set; }

        //Locales
        public IList<ProjectCategoryLocalizedModel> Locales { get; set; }
        
    }

    public partial class ProjectCategoryLocalizedModel : ILocalizedModelLocal
    {
        public int LanguageId { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.ProjectCategories.Fields.Name")]
        [AllowHtml]
        public string Name { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.ProjectCategories.Fields.Description")]
        [AllowHtml]
        public string Description { get; set; }
    }
}