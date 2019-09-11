using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class CameleoEventFinalReportViewModel : BaseNopEntityModel
    {
        public CameleoEventFinalReportViewModel()
        { 
            CameleoCustomerEventList = new List<CameleoCustomerEventViewModel>();
            AsPDF = false;
        }

        public bool AsPDF { get; set; }
        public CameleoEventViewModel CameleoEvent { get; set; }
        public IList<CameleoCustomerEventViewModel> CameleoCustomerEventList { get; set; }

        public int EventId
        {
            get 
            {
                if (CameleoEvent == null)
                {
                    return -1;
                }
                else
                {
                    return CameleoEvent.Id;
                }
            }
        }
    }
}