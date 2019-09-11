using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Nop.Web.Themes.CameleoVideoTheme.ViewModels
{
    public class CameleoVideoIndexViewModel
    {
        public CameleoVideoIndexViewModel()
        {
            Topic = "HomePageText";
        }

        public string Topic { get; set; } 
    }
}