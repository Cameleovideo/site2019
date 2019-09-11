using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Services.Messages;
using Nop.Core.Domain.Customers;

namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public interface ICameleoWorkflowMessageService
    {
        int SendShareInfoMessage(Customer customer, int languageId, string customerEmail, string customerName, string friendsEmail, string personalMessage);

        int SendNotPaidReminderMessage(int languageId, decimal participationFee, string destinationEmail);
    }
}