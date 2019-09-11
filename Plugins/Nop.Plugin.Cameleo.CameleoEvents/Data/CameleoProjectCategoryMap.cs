using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.ModelConfiguration;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;

namespace Nop.Plugin.Cameleo.CameleoEvents.Data
{
    public class CameleoProjectCategoryMap : EntityTypeConfiguration<CameleoProjectCategory>
    {
        public static string myTableName = "CAMELEO_ProjectCategory";

        public CameleoProjectCategoryMap()
        {
            this.ToTable(myTableName);
            this.HasKey(a => a.Id);
            
            this.Property(u => u.Name).HasMaxLength(255);
            this.Property(u => u.Description).HasMaxLength(1024);
            this.Property(u => u.CreatedOnUtc).IsRequired();
        }
    }
}