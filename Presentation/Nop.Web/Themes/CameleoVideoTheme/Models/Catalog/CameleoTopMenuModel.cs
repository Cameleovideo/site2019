using System.Collections.Generic;
using Nop.Web.Framework.Mvc;
using Nop.Web.Models.Catalog;

namespace Nop.Web.Models.Catalog
{
    public partial class CameleoTopMenuModel : TopMenuModel
    {        
        public bool MyGroupEnabled { get; set; }
        public int? CustomerEventId { get; set; }
    }
}