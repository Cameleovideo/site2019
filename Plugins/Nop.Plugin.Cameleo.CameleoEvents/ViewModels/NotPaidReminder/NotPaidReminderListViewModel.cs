using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using FluentValidation.Attributes;
using Nop.Plugin.Cameleo.CameleoEvents.Validators;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    [Validator(typeof(NotPaidReminderValidator))]
    public class NotPaidReminderListViewModel : BaseNopModel
    {
        public NotPaidReminderListViewModel()
        {
            NotPaidUserList = new List<NotPaidUserViewModel>();            
            showAll = false;
        }
        
        //***********************Not paid user list
        public IList<NotPaidUserViewModel> NotPaidUserList { get; set; }        
                
        //Event Id
        public int EventId { get; set; }

        //***********************Images to put on the reminder        
        public string LogoPath { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.NotPaidReminder.Fields.ParticipationFee")]
        public decimal ParticipationFee { get; set; }
        
        
        public bool showAll { get; set; }
        public string TopicToUse { get; set; }
        public Rotativa.Options.Size PageSize { get; set; }
    }
}