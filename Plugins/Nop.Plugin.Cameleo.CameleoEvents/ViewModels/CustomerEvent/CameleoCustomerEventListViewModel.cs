using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using System.ComponentModel.DataAnnotations;
using Nop.Plugin.Cameleo.CameleoEvents.Validators;
using FluentValidation.Attributes;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    [Validator(typeof(AddCustomerEventValidator))]
    public class CameleoCustomerEventListViewModel : BaseNopModel
    {
        public CameleoCustomerEventListViewModel()
        {            
            CameleoCustomerEventList = new List<CameleoCustomerEventViewModel>();
            ForSameGroup = false;
        }

        //***********************When adding a new customer event
        [AllowHtml]        
        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.NewCustomerEvent")]
        public string NewCustomerEvent { get; set; }

        [AllowHtml]
        [DataType(DataType.Password)]
        [NopResourceDisplayName("Plugins.Cameleo.CameleoCustomerEvents.Fields.Password")]
        public string Password { get; set; }

        public string Result { get; set; }



        //***********************Customer event list
        public IList<CameleoCustomerEventViewModel> CameleoCustomerEventList { get; set; }  



        //***********************Use when all customer events are for the same group and same event
        public bool ForSameGroup { get; set; }
        public string GroupName { get; set; }
        public int EventId { get; set; }        
    }
}