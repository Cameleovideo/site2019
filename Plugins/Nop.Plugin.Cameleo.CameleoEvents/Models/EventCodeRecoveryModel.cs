using System.Web.Mvc;
using FluentValidation.Attributes;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Plugin.Cameleo.CameleoEvents.Validators;

namespace Nop.Plugin.Cameleo.CameleoEvents.Models
{
    [Validator(typeof(EventCodeRecoveryValidator))]
    public partial class EventCodeRecoveryModel : BaseNopModel
    {
        public EventCodeRecoveryModel()
        {
            SuccessfullySent = false;
        }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.FirstName")]
        public string FirstName { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.LastName")]
        public string LastName { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Event")]
        public string Event { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Group")]
        public string Group { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Email")]
        public string Email { get; set; }

        [AllowHtml]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Notes")]
        public string Notes { get; set; }

        public bool SuccessfullySent { get; set; }
        public string Result { get; set; }
    }
}