using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class NotPaidReportViewModel : BaseNopEntityModel
    {
        public NotPaidReportViewModel()
        {
            NotPaidUserList = new List<NotPaidUserViewModel>();            
        }
        
        public CameleoEventViewModel CameleoEvent { get; set; }
        public IList<NotPaidUserViewModel> NotPaidUserList { get; set; }
    }
}