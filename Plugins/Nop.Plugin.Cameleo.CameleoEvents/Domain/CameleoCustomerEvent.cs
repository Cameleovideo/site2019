using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Core;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public class CameleoCustomerEvent : BaseEntity
    {
        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoCustomerEvent()
        {            
        }

        public int EventUserId { get; set; }
        public int CustomerId { get; set; }
        public bool Accepted { get; set; }
        public int AcceptedStatus { get; set; }
        public bool AcceptedImageUse { get; set; }
        public bool Paid { get; set; }
        public DateTime CreatedOnUtc { get; set; }
    }
}