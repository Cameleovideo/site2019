using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Routing;
using Nop.Web.Framework.Mvc.Routes;
using Nop.Web.Framework.Localization;
using Nop.Plugin.Cameleo.CameleoEvents.ViewEngines;

namespace Nop.Plugin.Cameleo.CameleoEvents
{
    class RouteProvider : IRouteProvider
    {
        public void RegisterRoutes(RouteCollection routes)
        {
            System.Web.Mvc.ViewEngines.Engines.Add(new CustomViewEngine());

            #region Customer

            routes.MapRoute("CameleoEvents",
                           "cameleoevents",
                           new { controller = "CustomerEvent", action = "EventList" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("ShareInfo",
                          "shareinfo",
                          new { controller = "Event", action = "ShareInfo" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("CameleoEventDetails",
                           "cameleoeventdetails/{customerEventId}",
                           new { controller = "CustomerEvent", action = "EventDetails" },
                           new { customerEventId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("GroupDetails",
                           "groupdetails/{customerEventId}",
                           new { controller = "CustomerEvent", action = "GroupDetails" },
                           new { customerEventId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("CreateReminder",
                           "createreminder/{customerEventId}",
                           new { controller = "CustomerEvent", action = "CreateReminder" },
                           new { customerEventId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("ClassProjects",
                           "ClassProjects/{customerEventId}",
                           new { controller = "Project", action = "ClassProjects" },
                           new { customerEventId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("PaymentInfo",
                           "paymentinfo/{customerEventId}",
                           new { controller = "CustomerEvent", action = "PaymentInfo" },
                           new { customerEventId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("CustomerEventSubjectNameForCart",
                           "customereventsubjectnameforcart/{shoppingCartId}",
                           new { controller = "CustomerEvent", action = "CustomerEventSubjectNameForCart" },
                           new { customerEventId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("CustomerEventSubjectNameForOrder",
                           "customereventsubjectnamefororder/{shoppingCartId}",
                           new { controller = "CustomerEvent", action = "CustomerEventSubjectNameForOrder" },
                           new { customerEventId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("scolaire",
                           "scolaire",
                           new { controller = "Event", action = "Index2" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("school",
                           "school",
                           new { controller = "Event", action = "Index2" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("secondaire",
                           "secondaire",
                           new { controller = "Event", action = "Index3" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("highschool",
                           "highschool",
                           new { controller = "Event", action = "Index3" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("CameleoLogin",
                           "cameleologin",
                           new { controller = "Event", action = "CameleoLogin" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapLocalizedRoute("RequestInfo",
                           "requestinfo/{sourceMessageId}",
                           new { controller = "Event", action = "RequestInfo" },
                           new { sourceMessageId = @"\d+" },
                           new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            //eventcoderecovery
            routes.MapRoute("EventCodeRecovery",
                            "eventcoderecovery",
                            new { controller = "Event", action = "EventCodeRecovery" },
                            new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });
            //ReOrder
            routes.MapRoute("CameleoReOrder",
                            "cameleoreorder/{orderId}",
                            new { controller = "CustomerEvent", action = "ReOrder" },
                            new { orderId = @"\d+" },
                            new[] { "Nop.Web.Controllers" });

            #endregion

            #region Admin

            //ADMIN
            routes.MapRoute("Admin/CameleoEventDetails",
                          "admin/plugin/cameleoevents/cameleoeventdetails/{eventId}",
                          new { controller = "EventAdmin", action = "EventDetails" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/FinalReport",
                          "admin/plugin/cameleoevents/cameleoeventdetails/finalreport/{eventId}",
                          new { controller = "EventAdmin", action = "FinalReport" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/NotPaidReport",
                          "admin/plugin/cameleoevents/cameleoeventdetails/notpaidreport/{eventId}",
                          new { controller = "EventAdmin", action = "NotPaidReport" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/EventUserList",
                          "admin/plugin/cameleoevents/cameleoeventdetails/eventuserlist/{eventId}",
                          new { controller = "EventUserAdmin", action = "EventUserList" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/PendingOrders",
                          "admin/plugin/cameleoevents/cameleoeventdetails/pendingorders",
                          new { controller = "EventAdmin", action = "PendingOrders" },                          
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/Orders",
                          "admin/plugin/cameleoevents/cameleoeventdetails/orders",
                          new { controller = "EventAdmin", action = "Orders" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/ProjectCategories/List",
                          "admin/plugin/cameleoevents/ProjectCategories/list",
                          new { controller = "ProjectAdmin", action = "List" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/RecentRegistrations",
                          "admin/plugin/cameleoevents/cameleoeventdetails/recentregistrations",
                          new { controller = "CustomerEventAdmin", action = "RecentRegistrations" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/EventReminder",
                          "admin/plugin/cameleoevents/cameleoeventdetails/eventreminder/{eventId}",
                          new { controller = "EventAdmin", action = "EventReminder" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/IntroLetter",
                          "admin/plugin/cameleoevents/cameleoeventdetails/introletter/{eventId}",
                          new { controller = "EventAdmin", action = "IntroLetter" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/NotPaidReminder",
                          "admin/plugin/cameleoevents/cameleoeventdetails/notpaidreminder/{eventId}",
                          new { controller = "EventAdmin", action = "NotPaidReminder" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            routes.MapRoute("Admin/CameleoEventDetails/NotPaidReminderEmail",
                          "admin/plugin/cameleoevents/cameleoeventdetails/notpaidreminderemail/{eventId}",
                          new { controller = "EventAdmin", action = "NotPaidReminderEmail" },
                          new { eventId = @"\d+" },
                          new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" }); 

            routes.MapRoute("Abc.Plugin.Cameleo.Configure", "Admin/Plugins/Cameleo/CameleoEvents/Configure",
                new { controller = "EventAdmin", action = "ConfigureEvents" },
                new[] { "Nop.Plugin.Cameleo.CameleoEvents.Controllers" });

            #endregion


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
