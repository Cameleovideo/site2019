using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Admin.Models.Orders;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class RecentRegistrationListViewModel : BaseNopModel
    {
        public RecentRegistrationListViewModel()
        {
            RecentRegistrationList = new List<CameleoCustomerEventViewModel>();
        }

        public IList<CameleoCustomerEventViewModel> RecentRegistrationList { get; set; }
        public int TotalCount { get; set; }        
    }
}