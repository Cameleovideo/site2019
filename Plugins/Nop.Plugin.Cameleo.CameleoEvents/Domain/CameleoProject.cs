using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Core;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public class CameleoProject : BaseEntity
    {

        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoProject()
        {                        
        }

        public int ProjectSubCategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime CreatedOnUtc { get; set; }
        public int EventId { get; set; }
        public int CustomerEventId { get; set; }
    }
}