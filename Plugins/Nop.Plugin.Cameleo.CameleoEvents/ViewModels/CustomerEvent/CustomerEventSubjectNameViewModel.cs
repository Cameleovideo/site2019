using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class CustomerEventSubjectNameViewModel : BaseNopEntityModel
    {
        public CustomerEventSubjectNameViewModel()
        {         
   
        }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.LastName")]
        public string LastName { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.FirstName")]
        public string FirstName { get; set; }        

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEventUsers.Fields.Group")]
        public string Group { get; set; }
    }
}