using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class AddCustomerEventValidator : AbstractValidator<CameleoCustomerEventListViewModel>
    {
        public AddCustomerEventValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.NewCustomerEvent).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Fields.NewCustomerEvent.Required"));
            RuleFor(x => x.Password).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Fields.Password.Required"));            
        }
    }
}