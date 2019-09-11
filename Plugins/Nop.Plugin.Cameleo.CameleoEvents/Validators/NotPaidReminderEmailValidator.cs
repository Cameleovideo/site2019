﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class NotPaidReminderEmailValidator : AbstractValidator<NotPaidReminderEmailListViewModel>
    {
        public NotPaidReminderEmailValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.ParticipationFee).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.NotPaidReminder.Fields.ParticipationFee.Required"));            
        }
    }
}