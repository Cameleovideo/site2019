using FluentValidation;
using Nop.Services.Localization;
using Nop.Plugin.Cameleo.CameleoEvents.Models;

namespace Nop.Plugin.Cameleo.CameleoEvents.Validators
{
    public class EventCodeRecoveryValidator : AbstractValidator<EventCodeRecoveryModel>
    {
        public EventCodeRecoveryValidator(ILocalizationService localizationService)
        {
            RuleFor(x => x.FirstName).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.FirstName.Required"));
            RuleFor(x => x.LastName).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.LastName.Required"));
            RuleFor(x => x.Event).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Event.Required"));
            RuleFor(x => x.Group).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Group.Required"));
            RuleFor(x => x.Email).NotEmpty().WithMessage(localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Email.Required"));
            RuleFor(x => x.Email).EmailAddress().WithMessage(localizationService.GetResource("Common.WrongEmail"));
        }}
}