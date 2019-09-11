using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.ModelConfiguration;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;

namespace Nop.Plugin.Cameleo.CameleoEvents.Data
{
    public class CameleoProjectMap : EntityTypeConfiguration<CameleoProject>
    {
        public static string myTableName = "CAMELEO_Project";

        public CameleoProjectMap()
        {
            this.ToTable(myTableName);
            this.HasKey(a => a.Id);

            this.Property(u => u.ProjectSubCategoryId).IsRequired();
            this.Property(u => u.Name).HasMaxLength(255);
            this.Property(u => u.Description).HasMaxLength(1024);
            this.Property(u => u.CreatedOnUtc).IsRequired();
            this.Property(u => u.EventId).IsRequired();
            this.Property(u => u.CustomerEventId).IsRequired();
        }
    }
}