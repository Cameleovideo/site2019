using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class EventUserListForEventViewModel : BaseNopModel
    {
        public EventUserListForEventViewModel()
        {
            CameleoEvent = new CameleoEventViewModel();
            CameleoEventUserList = new CameleoEventUserListViewModel();
        }

        public CameleoEventViewModel CameleoEvent { get; set; }        
        public CameleoEventUserListViewModel CameleoEventUserList { get; set; }        
    }
}