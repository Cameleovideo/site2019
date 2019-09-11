using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class CustomerEventReminderValidator : AbstractValidator<CustomerEventReminderListViewModel>
    {
        public CustomerEventReminderValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.ShootDate).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.Reminder.Fields.ShootDate.Required"));
            RuleFor(x => x.ReminderDate).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.Reminder.Fields.ReminderDate.Required"));
            RuleFor(x => x.SenderName).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.Reminder.Fields.SenderName.Required"));
            RuleFor(x => x.SenderRole).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.Reminder.Fields.SenderRole.Required"));            
        }
    }
}