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
    [Validator(typeof(IntroLetterValidator))]
    public class IntroLetterListViewModel : BaseNopModel
    {
        public IntroLetterListViewModel()
        {            
            CameleoEventUserList = new List<CameleoEventUserViewModel>();
            SelectedEventUserList = new Dictionary<int, bool>();
            showPreview = false;
            showAllIntroLetters = false;
        }
        
        //***********************Event user list
        public IList<CameleoEventUserViewModel> CameleoEventUserList { get; set; }
        public IDictionary<int,bool> SelectedEventUserList { get; set; }
        
        //***********************Customer event id for the group superior currently generating intro letters
        public int StaffCustomerEventId { get; set; }

        //Event Id
        public int EventId { get; set; }

        // Group name of the group superior currently generating reminders
        public string GroupName { get; set; }  

        //***********************Images to put on the reminder        
        public string LogoPath { get; set; }
        public string Step1Path { get; set; }
        public string Step2Path { get; set; }
        public string Step3Path { get; set; }
        public string Step4Path { get; set; }
        
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.IntroLetter.Fields.ReminderDate")]
        public string ReminderDate { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.IntroLetter.Fields.ParticipationFee")]
        public decimal ParticipationFee { get; set; }
        
        public bool showPreview { get; set; }
        public bool showAllIntroLetters { get; set; }
        public string TopicToUse { get; set; }
        public Rotativa.Options.Size PageSize { get; set; }
    }
}