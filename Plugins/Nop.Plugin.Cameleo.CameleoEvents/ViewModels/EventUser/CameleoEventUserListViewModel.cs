using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class CameleoEventUserListViewModel : BaseNopModel
    {
        public CameleoEventUserListViewModel()
        {            
            CameleoEventUserList = new List<CameleoEventUserViewModel>();
        }

        public IList<CameleoEventUserViewModel> CameleoEventUserList { get; set; }        
    }
}