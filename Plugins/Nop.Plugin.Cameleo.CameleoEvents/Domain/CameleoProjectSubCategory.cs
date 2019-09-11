using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Core;
using Nop.Core.Domain.Localization;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public class CameleoProjectSubCategory : BaseEntity, ILocalizedEntity
    {

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoProjectSubCategory()
        {                        
        }

        public int ProjectCategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime CreatedOnUtc { get; set; }        
    }
}