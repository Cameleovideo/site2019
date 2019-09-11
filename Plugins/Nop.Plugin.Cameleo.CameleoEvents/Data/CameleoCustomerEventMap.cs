using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.ModelConfiguration;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;

namespace Nop.Plugin.Cameleo.CameleoEvents.Data
{
    public class CameleoCustomerEventMap : EntityTypeConfiguration<CameleoCustomerEvent>
    {
        public static string myTableName = "CAMELEO_CustomerEvent";

        public CameleoCustomerEventMap()
        {
            this.ToTable(myTableName);
            this.HasKey(a => a.Id);
            this.Property(a => a.EventUserId);
            this.Property(a => a.CustomerId);
            this.Property(a => a.Accepted);
            this.Property(a => a.AcceptedStatus);            
            this.Property(a => a.AcceptedImageUse);
            this.Property(a => a.Paid);
            this.Property(a => a.CreatedOnUtc).IsRequired();            
        }
    }
}