using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;


namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class PendingOrderListViewModel : BaseNopModel
    {
        public PendingOrderListViewModel()
        {
            PendingOrderList = new List<OrderViewModel>();
        }

        public IList<OrderViewModel> PendingOrderList { get; set; }        
    }
}