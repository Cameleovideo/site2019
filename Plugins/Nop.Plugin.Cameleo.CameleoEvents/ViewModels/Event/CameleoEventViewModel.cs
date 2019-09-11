using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using System.Web.Mvc;
using Nop.Plugin.Cameleo.CameleoEvents.Validators;
using FluentValidation.Attributes;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    [Validator(typeof(EventValidator))]
    public class CameleoEventViewModel : BaseNopEntityModel
    {
        public CameleoEventViewModel()
        {
            Groups = new List<CameleoSelectListItem>();
            ShowGroupDetails = false;
            ParticipationFee = 0;
        }

        public CameleoEventViewModel(CameleoEvent pEvent, List<CameleoSelectListItem> pGroups, string pStatusString)
        {
            Id = pEvent.Id;
            EventName = pEvent.EventName;
            EventCode = pEvent.EventCode;
            ClientName = pEvent.ClientName;
            CreatedOnUtc = pEvent.CreatedOnUtc;
            ShootedOnUtc = pEvent.ShootedOnUtc;
            AcceptReminderDateUtc = pEvent.AcceptReminderDateUtc;
            AcceptReminderDelay = pEvent.AcceptReminderDelay;
            AcceptMinimumPercentage = pEvent.AcceptMinimumPercentage;
            PayReminderDateUtc = pEvent.PayReminderDateUtc;
            PayReminderDelay = pEvent.PayReminderDelay;
            PayMinimumPercentage = pEvent.PayMinimumPercentage;
            Status = pEvent.Status;
            StatusString = pStatusString;
            Groups = pGroups;
            ShowGroupDetails = false;
            ClientLogo = pEvent.ClientLogo;
            IntroLogo = pEvent.IntroLogo;
            ParticipationFee = pEvent.ParticipationFee;
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.EventName")]        
        public string EventName { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.EventCode")]        
        public string EventCode { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.ClientName")]        
        public string ClientName { get; set; }
        
        [DisplayFormat(NullDisplayText = "Plugins.Cameleo.CameleoEvents.DateUnknown", DataFormatString = "{0:yyyy-MM-dd}")]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.CreatedOnUtc")]        
        public DateTime CreatedOnUtc { get; set; }
        
        [DisplayFormat(NullDisplayText = "Plugins.Cameleo.CameleoEvents.DateUnknown", DataFormatString = "{0:yyyy-MM-dd}")]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.ShootedOnUtc")]        
        public DateTime? ShootedOnUtc { get; set; }
        
        [DisplayFormat(NullDisplayText = "Plugins.Cameleo.CameleoEvents.DateUnknown", DataFormatString = "{0:yyyy-MM-dd}")]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.AcceptReminderDateUtc")]        
        public DateTime? AcceptReminderDateUtc { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.AcceptReminderDelay")]        
        public int AcceptReminderDelay { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.AcceptMinimumPercentage")]        
        public int AcceptMinimumPercentage { get; set; }
        
        [DisplayFormat(NullDisplayText = "Plugins.Cameleo.CameleoEvents.DateUnknown", DataFormatString = "{0:yyyy-MM-dd}")]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.PayReminderDateUtc")]        
        public DateTime? PayReminderDateUtc { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.PayReminderDelay")]        
        public int PayReminderDelay { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.PayMinimumPercentage")]        
        public int PayMinimumPercentage { get; set; }

        [UIHint("Nop.Plugin.Cameleo.CameleoEvents.Views.Admin.EditorTemplates.EventStatus")]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.Status")]        
        public int Status { get; set; }

        public string StatusString { get; set; } 

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.Logo")]
        public string ClientLogo { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.IntroLogo")]
        public string IntroLogo { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.ParticipationFee")]
        [DisplayFormat(NullDisplayText = "0")]
        public decimal? ParticipationFee { get; set; }

        public IList<CameleoSelectListItem> Groups { get; set; }
        public bool ShowGroupDetails { get; set; }
        public string DetailedGroupName { get; set; }
        public CameleoSelectListItem GroupDetails { get; set; }
        public int CustomerEventId { get; set; }

        public bool AcceptReminderDatePassed 
        {
            get 
            {
                if (AcceptReminderDateUtc != null && DateTime.Now.AddDays(-1).CompareTo(AcceptReminderDateUtc) > 0)
	            {		 
                    return true;
	            }                
                else
                {
                    return false;
                }
            } 
        }
        public double AcceptDaysLeft
        {
            get
            {
                if (AcceptReminderDateUtc != null)
                {
                    return Math.Round(((DateTime)AcceptReminderDateUtc - DateTime.Now).TotalDays)+1;
                }
                else
                {
                    return -1;
                }                
            }
        }

        public bool OnlinePaymentEnabled
        {
            get
            {
                //if (EventCode == "4000001879" || EventCode == "4000001887" || EventCode == "4000001898" || EventCode == "4000001894" || EventCode == "4000001902" || EventCode == "4000001903")
                //{
                //    return false;
                //}
                //else
                //{
                //    return true;
                //}
                return true;
            }
        }
    }
}