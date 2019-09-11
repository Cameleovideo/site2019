using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.Validators;
using FluentValidation.Attributes;
using System.ComponentModel.DataAnnotations;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class NotPaidUserViewModel : BaseNopEntityModel
    {
        #region Fields
        CameleoCustomerEventViewModel _customerEvent;
        #endregion

        #region Ctor
        public NotPaidUserViewModel(CameleoCustomerEventViewModel customerEvent)
        {
            _customerEvent = customerEvent;
        }
        #endregion

        public int EventId
        {
            get { return _customerEvent.CameleoEvent == null ? -1 : _customerEvent.CameleoEvent.Id; }
            set { _customerEvent.CameleoEvent.Id = value; }
        }
        
        public int CustomerEventId
        {
            get { return _customerEvent == null ? -1 : _customerEvent.Id; }
            set { _customerEvent.Id = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.EventUserId")]
        public int EventUserId
        {
            get { return _customerEvent == null ? -1 : _customerEvent.EventUserId; }
            set { _customerEvent.EventUserId = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.CustomerId")]
        public int CustomerId
        {
            get { return _customerEvent == null ? -1 : _customerEvent.CustomerId; }
            set { _customerEvent.CustomerId = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.CustomerUserName")]
        public string CustomerUserName
        {
            get { return _customerEvent == null ? "" : _customerEvent.CustomerUserName; }
            set { _customerEvent.CustomerUserName = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.Paid")]
        public bool Paid
        {
            get { return _customerEvent == null ? false : _customerEvent.Paid; }
            set { _customerEvent.Paid = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.Accepted")]
        public bool Accepted
        {
            get { return _customerEvent == null ? false : _customerEvent.Accepted; }
            set { _customerEvent.Accepted = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedStatus")]
        public int AcceptedStatus
        {
            get { return _customerEvent == null ? -1 : _customerEvent.AcceptedStatus; }
            set { _customerEvent.AcceptedStatus = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedStatusString")]
        public string AcceptedStatusString
        {
            get { return _customerEvent == null ? "" : _customerEvent.AcceptedStatusString; }
            set { _customerEvent.AcceptedStatusString = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedImageUse")]
        public bool AcceptedImageUse
        {
            get { return _customerEvent == null ? false : _customerEvent.AcceptedImageUse; }
            set { _customerEvent.AcceptedImageUse = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.UserName")]
        public string UserName
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.UserName; }
            set { _customerEvent.CameleoEventUser.UserName = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.Password")]
        public string Password
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.Password; }
            set { _customerEvent.CameleoEventUser.Password = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.LastName")]
        public string LastName
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.LastName; }
            set { _customerEvent.CameleoEventUser.LastName = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.LastName")]
        public string LastNameFull
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.LastNameFull; }
            set { _customerEvent.CameleoEventUser.LastName = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.FirstName")]
        public string FirstName
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.FirstName; }
            set { _customerEvent.CameleoEventUser.FirstName = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.Group")]
        public string Group
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.Group; }
            set { _customerEvent.CameleoEventUser.Group = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.Email")]
        public string Email
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.Email; }
            set { _customerEvent.CameleoEventUser.Email = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.UniqueId")]
        public string UniqueId
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.UniqueId; }
            set { _customerEvent.CameleoEventUser.UniqueId = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.SuperiorName")]
        public string SuperiorName
        {
            get { return _customerEvent.CameleoEventUser == null ? "" : _customerEvent.CameleoEventUser.SuperiorName; }
            set { _customerEvent.CameleoEventUser.SuperiorName = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.isStaff")]
        public bool isStaff
        {
            get { return _customerEvent.CameleoEventUser == null ? false : _customerEvent.CameleoEventUser.isStaff; }
            set { _customerEvent.CameleoEventUser.isStaff = value; }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.CartId")]
        public int CartId { get; set; }
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.IsInCart")]
        public bool IsInCart 
        { 
            get
            {
                if (CartId  > 0 )
                {
                    return true;
                }
                else
	            {
                    return false;
	            }
            }
        }
        public bool ShowCartButtons
        {
            get
            {
                if (CustomerUserName.Contains("4000"))
                {
                    return false;
                }
                else
	            {
                    return true;
	            }
            }
        }
        public bool HasEmail
        {
            get
            {
                return ShowCartButtons;
            }
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.OrderId")]
        public int OrderId { get; set; }
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.IsInOrder")]
        public bool IsInOrder
        {
            get
            {
                if (OrderId > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}