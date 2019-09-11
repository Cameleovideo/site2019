using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using FluentValidation.Attributes;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;

using Nop.Plugin.Cameleo.CameleoEvents.Validators;
namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    [Validator(typeof(AddCustomerEventAdminValidator))]
    public class AddCustomerEventViewModel : BaseNopEntityModel
    {
        public AddCustomerEventViewModel()
        {
            CameleoEventUserList = new CameleoEventUserListViewModel();
            AddedAcceptedStatus = (int)AcceptedStatus.ToBeCompleted;
            AddedAcceptedImageUse = false;
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.Add")]
        public int AddedEventUserId { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.CustomerEventUserName")]
        public string AddedCustomerEventUserName { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedStatus")]
        public int AddedAcceptedStatus { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.AcceptedImageUse")]
        public bool AddedAcceptedImageUse { get; set; }
        
        public CameleoEventUserListViewModel CameleoEventUserList { get; set; }
        public CameleoCustomerEventListViewModel CameleoCustomerEventList { get; set; }
        public CameleoEventViewModel CameleoEvent { get; set; }
        public string GroupName { get; set; }
        public IList<SelectListItem> CameleoEventUserListForDropDown 
        {
            get 
            {
                var tmpList = new List<SelectListItem>();
                tmpList.Add(new SelectListItem() { Text = "", Value = "" });
                foreach (var tmpEventUser in CameleoEventUserList.CameleoEventUserList)
                { 
                    //Already in customer events?                    
                    bool found = false;
                    foreach (var tmpCustomerEvent in CameleoCustomerEventList.CameleoCustomerEventList)
                    {
                        if (tmpEventUser.Id == tmpCustomerEvent.EventUserId)
                        {
                            //Found
                            found = true;

                            //Stop searching
                            break;
                        } 
                    }

                    string tmpTitle = tmpEventUser.LastNameFull + ", " + tmpEventUser.FirstName;
                    if (found)
                    {
                        tmpTitle = tmpEventUser.LastNameFull + ", " + tmpEventUser.FirstName + " (**EXISTS**)";
                    }
                    tmpList.Add(new SelectListItem() { Text = tmpTitle, Value = tmpEventUser.Id.ToString() });
                }
                return tmpList;
            }
        }
    }
}