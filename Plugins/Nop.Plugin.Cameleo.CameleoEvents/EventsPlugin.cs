using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Routing;
using Nop.Web.Framework.Menu;
using Nop.Web.Framework.Web;
using Nop.Core.Plugins;
using Nop.Services.Common;
using Nop.Plugin.Cameleo.CameleoEvents.Data;

namespace Nop.Plugin.Cameleo.CameleoEvents
{
    public class EventsPlugin : BasePlugin, IMiscPlugin, IAdminMenuPlugin
    {
        private readonly CameleoEventsObjectContext _eventsContext;        

        public EventsPlugin(CameleoEventsObjectContext eventsContext)
        {
            this._eventsContext = eventsContext;            
        }

        public override void Install()
        {
            _eventsContext.Install();            
            base.Install();
        }

        public override void Uninstall()
        {
            _eventsContext.Uninstall();            
            base.Uninstall();
        }

        public void GetConfigurationRoute(out string actionName, out string controllerName, out RouteValueDictionary routeValues)
        {
            actionName = "Configure";
            controllerName = "EventAdmin";
            routeValues = new RouteValueDictionary()
            {
                { "Namespaces", "Nop.Plugin.Cameleo.CameleoEvents.Controllers" }, 
                { "area", null }
            };
        }
        
        public void GetPublicInfoRoute(out string actionName, out string controllerName, out RouteValueDictionary routeValues)
        {
            actionName = "Configure";
            controllerName = "EventAdmin";
            routeValues = new RouteValueDictionary() 
            { 
                { "Namespaces", "Nop.Plugin.Cameleo.CameleoEvents.Controllers" }, 
                { "area", null } 
            };
        }

        public SiteMapNode BuildMenuItem() 
        {
            var node = new SiteMapNode();
            node.Title = "Cameleo-Video";
            node.Url = "~/Admin/Plugins/Cameleo/CameleoEvents/Configure";                        
            node.Visible = true;
            return node;
        }

        public bool Authenticate() 
        {
            return true; 
        }

    }
}
