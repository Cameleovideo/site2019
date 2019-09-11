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
    [Validator(typeof(EventUserValidator))]
    public class CameleoEventUserViewModel : BaseNopEntityModel
    {
        #region Fields
        private string _lastName = "";
        #endregion

        #region Ctor
        public CameleoEventUserViewModel()
        {
            _lastName = "";
        }

        public CameleoEventUserViewModel(CameleoEventUser pEventUser, int pEventUserCount, int pAcceptedEventUserCount)
        {
            Id = pEventUser.Id;
            EventId = pEventUser.EventId;
            UserName = pEventUser.UserName;
            Password = pEventUser.Password;
            LastName = pEventUser.LastName;
            FirstName = pEventUser.FirstName;
            Email = pEventUser.Email;
            UniqueId = pEventUser.UniqueId;
            Group = pEventUser.Group;
            SuperiorName = pEventUser.SuperiorName;
            isStaff = pEventUser.isStaff;
            CreatedOnUtc = pEventUser.CreatedOnUtc;
            EventUserCount = pEventUserCount;
            AcceptedEventUserCount = pAcceptedEventUserCount;
        }
        #endregion

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.EventId")]
        public int EventId { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.UserName")]
        public string UserName { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.Password")]
        public string Password { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.LastName")]
        public string LastName 
        {
            get
            {
                if (string.IsNullOrEmpty(_lastName))
                {
                    return "";
                }
                else if (_lastName.Contains("STAFF") || _lastName.Contains("VIDE"))
                {
                    return "";
                }
                return _lastName;
            }
            set
            {
                _lastName = value;
            }
        }

        public string LastNameFull
        {
            get
            {
                if (string.IsNullOrEmpty(_lastName))
                {
                    return "";
                }
                return _lastName;
            }
            set
            {                
                _lastName = value;
            }
        }


        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.FirstName")]
        public string FirstName { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.Email")]
        public string Email { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.UniqueId")]
        public string UniqueId { get; set; }
        
        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.Group")]
        public string Group { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.SuperiorName")]
        public string SuperiorName { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.isStaff")]
        public bool isStaff { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.CreatedOnUtc")]
        public DateTime CreatedOnUtc { get; set; }

        //accepted Users
        public int EventUserCount { get; set; }
        public int AcceptedEventUserCount { get; set; }
        public int AcceptPercentage
        {
            get
            {
                return CameleoUtilities.AcceptPercentage(EventUserCount, AcceptedEventUserCount);
            }
        }

        public bool isNameEmpty()
        {
            bool isEmpty = false;

            if (string.IsNullOrEmpty(FirstName) || string.IsNullOrEmpty(LastName) || string.IsNullOrEmpty(Group) || LastName.Contains("STAFF") || LastName.Contains("VIDE"))
            {
                // Firstname, lastname or group is empty
                isEmpty = true;
            }

            return isEmpty;
        }
    }
}