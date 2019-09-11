using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluentValidation;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class IntroLetterValidator : AbstractValidator<IntroLetterListViewModel>
    {
        public IntroLetterValidator(ILocalizationService localizationService)
        {            
            RuleFor(x => x.ReminderDate).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.IntroLetter.Fields.ReminderDate.Required"));
            RuleFor(x => x.ParticipationFee).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.IntroLetter.Fields.ParticipationFee.Required"));            
        }
    }
}