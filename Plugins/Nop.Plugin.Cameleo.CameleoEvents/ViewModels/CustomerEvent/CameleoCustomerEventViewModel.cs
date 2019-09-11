using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using System.ComponentModel.DataAnnotations;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class CameleoCustomerEventViewModel : BaseNopEntityModel
    {
        public CameleoCustomerEventViewModel()
        {
            Result = "";
        }

        public CameleoCustomerEventViewModel(CameleoCustomerEvent pCustomerEvent, string pCustomerUserName, string pAcceptedStatusString)
        {
            Id = pCustomerEvent.Id;
            EventUserId = pCustomerEvent.EventUserId;
            CustomerId = pCustomerEvent.CustomerId;
            CustomerUserName = pCustomerUserName;
            Paid = pCustomerEvent.Paid;
            Accepted = pCustomerEvent.Accepted;
            AcceptedStatus = pCustomerEvent.AcceptedStatus;
            AcceptedImageUse = pCustomerEvent.AcceptedImageUse;
            CreatedOnUtc = pCustomerEvent.CreatedOnUtc;
            Result = "";
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.EventUserId")]
        public int EventUserId { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.CustomerId")]
        public int CustomerId { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.CustomerUserName")]
        public string CustomerUserName { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.Paid")]
        public bool Paid { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.Accepted")]
        public bool Accepted { get; set; }
        
        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedStatus")]
        public int AcceptedStatus { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedStatusString")]
        public string AcceptedStatusString { get; set; }        

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedImageUse")]
        public bool AcceptedImageUse { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.CreatedOnUtc")]
        public DateTime CreatedOnUtc { get; set; }

        public CameleoEventViewModel CameleoEvent { get; set; }
        public CameleoEventUserViewModel CameleoEventUser { get; set; }
        public string Result { get; set; }     

        // Readonly redirect properties to CameleoEvent and CamelelEventUser
        public string ClientName
        {
            get { return CameleoEvent == null ? "" : CameleoEvent.ClientName; }
            set { CameleoEvent.ClientName = value; }
        }

        public string EventName
        {
            get { return CameleoEvent == null ? "" : CameleoEvent.EventName; }
            set { CameleoEvent.EventName = value; }
        }

        public string EventCode
        {
            get { return CameleoEvent == null ? "" : CameleoEvent.EventCode; }
            set { CameleoEvent.EventCode = value; }
        }

        public string UserName
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.UserName; }
            set { CameleoEventUser.UserName = value; }
        }

        public string Password
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.Password; }
            set { CameleoEventUser.Password = value; }
        }

        public string LastName
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.LastNameFull; }
            set { CameleoEventUser.LastName = value; }
        }

        public string FirstName
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.FirstName; }
            set { CameleoEventUser.FirstName = value; }
        }

        public string Group
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.Group; }
            set { CameleoEventUser.Group = value; }
        }

        public string Email
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.Email; }
            set { CameleoEventUser.Email = value; }
        }

        public string UniqueId
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.UniqueId; }
            set { CameleoEventUser.UniqueId = value; }
        }

        public string SuperiorName
        {
            get { return CameleoEventUser == null ? "" : CameleoEventUser.SuperiorName; }
            set { CameleoEventUser.SuperiorName = value; }
        }

        public bool isStaff
        {
            get { return CameleoEventUser == null ? false : CameleoEventUser.isStaff; }
            set { CameleoEventUser.isStaff = value; }
        }
    }
}