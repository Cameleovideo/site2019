using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{    
    public class AddCustomerEventAdminValidator : AbstractValidator<AddCustomerEventViewModel>
    {
        public AddCustomerEventAdminValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.AddedEventUserId).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Fields.Add.Required"));
            RuleFor(x => x.AddedCustomerEventUserName).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Fields.CustomerEventUserName.Required"));            
        }
    }
}