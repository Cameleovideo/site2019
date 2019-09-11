using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class EventValidator : AbstractValidator<CameleoEventViewModel>
    {
        public EventValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.ClientName).NotEmpty().WithMessage(localizationService.GetResource("plugins.cameleo.cameleoevents.fields.clientname.required"));
            RuleFor(x => x.EventCode).NotEmpty().WithMessage(localizationService.GetResource("plugins.cameleo.cameleoevents.fields.eventcode.required"));
            RuleFor(x => x.EventName).NotEmpty().WithMessage(localizationService.GetResource("plugins.cameleo.cameleoevents.fields.eventname.required"));
            RuleFor(x => x.ShootedOnUtc).NotEmpty().WithMessage(localizationService.GetResource("plugins.cameleo.cameleoevents.fields.ShootedOnUtc.required"));
            RuleFor(x => x.AcceptReminderDateUtc).NotEmpty().WithMessage(localizationService.GetResource("plugins.cameleo.cameleoevents.fields.AcceptReminderDateUtc.required"));
        }
    }
}