using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework.Themes;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewEngines
{
    public class CustomViewEngine : ThemeableRazorViewEngine
    {
        public CustomViewEngine()
        {
            PartialViewLocationFormats = new[]{
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/CameleoEvents/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/Admin/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/Admin/Event/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/Admin/EventUser/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Home/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Customer/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Common/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Catalog/{0}.cshtml"
            };

            ViewLocationFormats = new[]{
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/CameleoEvents/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/Admin/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/Admin/Event/{0}.cshtml",
                "~/Plugins/Nop.Plugin.Cameleo.CameleoEvents/Views/Admin/EventUser/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Home/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Customer/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Common/{0}.cshtml",
                "~/Themes/CameleoVideoTheme/Views/Catalog/{0}.cshtml"
            };
        }
    }
}