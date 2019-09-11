using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class CameleoEventListViewModel : BaseNopModel
    {
        public CameleoEventListViewModel()
        {            
            CameleoEventList = new List<CameleoEventViewModel>();
        }

        public IList<CameleoEventViewModel> CameleoEventList { get; set; }        
    }
}