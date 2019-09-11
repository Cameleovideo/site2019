using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nop.Core;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public class CameleoEventUser: BaseEntity
    {        
        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoEventUser()
        {            
        }

        public int EventId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
        public string UniqueId { get; set; }
        public string Group { get; set; }
        public string SuperiorName { get; set; }
        public bool isStaff { get; set; }
        public DateTime CreatedOnUtc { get; set; }
    }
}
