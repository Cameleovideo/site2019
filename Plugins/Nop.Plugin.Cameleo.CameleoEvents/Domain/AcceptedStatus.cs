using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public enum AcceptedStatus : int
    {
        ToBeCompleted = 0,      // User did nothing yet
        AcceptedPaid = 1,       // User accepted to participate and to pay
        AcceptedNotPaid = 2,    // User accepted to participate but doesn't want to pay
        Refused = 3             // User refused to participate
    }

    public static class AcceptedStatusStrings
    {
        public static List<string> LocalizedStringValues = new List<string>() { 
            "Plugins.Cameleo.CameleoCustomerEvents.AcceptedStatus.ToBeCompleted",
            "Plugins.Cameleo.CameleoCustomerEvents.AcceptedStatus.AcceptedPaid",
            "Plugins.Cameleo.CameleoCustomerEvents.AcceptedStatus.AcceptedNotPaid",
            "Plugins.Cameleo.CameleoCustomerEvents.AcceptedStatus.Refused"};
    }
}