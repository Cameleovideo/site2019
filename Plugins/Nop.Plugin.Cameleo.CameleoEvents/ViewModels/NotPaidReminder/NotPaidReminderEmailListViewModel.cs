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
    [Validator(typeof(NotPaidReminderEmailValidator))]
    public class NotPaidReminderEmailListViewModel : BaseNopModel
    {
        public NotPaidReminderEmailListViewModel()
        {
            NotPaidUserList = new List<NotPaidUserViewModel>();                        
        }
        
        //***********************Not paid user list
        public IList<NotPaidUserViewModel> NotPaidUserList { get; set; }        
                
        //Event Id
        public int EventId { get; set; }        

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.NotPaidReminder.Fields.ParticipationFee")]
        public decimal ParticipationFee { get; set; }        
    }
}