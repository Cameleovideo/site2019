using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class ProjectCategoryValidator : AbstractValidator<ProjectCategoryViewModel>
    {
        public ProjectCategoryValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage(localizationService.GetResource("plugins.cameleo.projectcategories.fields.name.required"));
            RuleFor(x => x.Description).NotEmpty().WithMessage(localizationService.GetResource("plugins.cameleo.projectcategories.fields.description.required"));            
        }
    }
}