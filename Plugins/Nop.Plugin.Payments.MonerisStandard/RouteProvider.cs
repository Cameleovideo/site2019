using System.Web.Mvc;
using System.Web.Routing;
using Nop.Web.Framework.Mvc.Routes;

namespace Nop.Plugin.Payments.MonerisStandard
{
    public partial class RouteProvider : IRouteProvider
    {
        public void RegisterRoutes(RouteCollection routes)
        {
            //PDT
            routes.MapRoute("PDTHandler",
                 "PDTHandler",
                 new { controller = "PaymentMonerisStandard", action = "PDTHandler" },
                 new[] { "Nop.Plugin.Payments.MonerisStandard.Controllers" }
            );
           
            //Cancel
            routes.MapRoute("CancelOrder",
                 "CancelOrder",
                 new { controller = "PaymentMonerisStandard", action = "CancelOrder" },
                 new[] { "Nop.Plugin.Payments.MonerisStandard.Controllers" }
            );
        }
        public int Priority
        {
            get
            {
                return 0;
            }
        }
    }
}
