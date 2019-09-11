using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public enum CameleoEventStatus : int
    {        
        Opened = 0,
        Accepted = 1,           // Minimum of required participants accepted
        CancelledAccepted = 2,  // Cancelled because not enough participants accepted
        Paid = 3,               // Minimum of required participants paid        
        CancelledPaid = 4,      // Cancelled because not enough participants paid
        Completed = 5           // Completed
    }

    public static class CameleoEventStatusStrings
    {
        public static string[] LocalizedStringValues = {"Plugins.Cameleo.CameleoEvents.Status.Opened", 
                                                        "Plugins.Cameleo.CameleoEvents.Status.Accepted",
                                                        "Plugins.Cameleo.CameleoEvents.Status.CancelledAccepted",
                                                        "Plugins.Cameleo.CameleoEvents.Status.Paid",
                                                        "Plugins.Cameleo.CameleoEvents.Status.CancelledPaid",
                                                        "Plugins.Cameleo.CameleoEvents.Status.Completed"
                                                       };
    }
}
