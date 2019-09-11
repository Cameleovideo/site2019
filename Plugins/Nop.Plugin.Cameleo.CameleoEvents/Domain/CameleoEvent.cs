using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Nop.Core;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public class CameleoEvent : BaseEntity
    {
        /// <summary>
        /// Ctor
        /// </summary>
        public CameleoEvent()
        {            
            this.Status = (int)CameleoEventStatus.Opened;            
        }

        public string EventName { get; set; }
        public string EventCode { get; set; }
        public string ClientName { get; set; }
        public DateTime CreatedOnUtc { get; set; }
        public DateTime? ShootedOnUtc { get; set; }
        public DateTime? AcceptReminderDateUtc { get; set; }
        public int AcceptReminderDelay { get; set; }
        public int AcceptMinimumPercentage { get; set; }
        public DateTime? PayReminderDateUtc { get; set; }
        public int PayReminderDelay { get; set; }
        public int PayMinimumPercentage { get; set; }
        public int Status { get; set; }
        public string ClientLogo { get; set; }
        public string IntroLogo { get; set; }
        public decimal? ParticipationFee { get; set; }
    }
}
