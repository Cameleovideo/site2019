using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class EventUserValidator : AbstractValidator<CameleoEventUserViewModel>
    {
        public EventUserValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.FirstName).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEventUsers.Fields.FirstName.Required"));
            RuleFor(x => x.LastName).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEventUsers.Fields.LastName.Required"));
            RuleFor(x => x.Group).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEventUsers.Fields.Group.Required"));            
        }
    }
}