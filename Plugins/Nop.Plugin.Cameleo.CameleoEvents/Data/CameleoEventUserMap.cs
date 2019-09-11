using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.ModelConfiguration;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;

namespace Nop.Plugin.Cameleo.CameleoEvents.Data
{
    public class CameleoEventUserMap : EntityTypeConfiguration<CameleoEventUser>
    {
        public static string myTableName = "CAMELEO_EventUser";

        public CameleoEventUserMap()
        {
            this.ToTable(myTableName);
            this.HasKey(a => a.Id);            
            this.Property(a => a.UserName).HasMaxLength(255);
            this.Property(a => a.Password).HasMaxLength(255);
            this.Property(a => a.LastName).HasMaxLength(255);
            this.Property(a => a.FirstName).HasMaxLength(255);
            this.Property(a => a.Email).HasMaxLength(255);
            this.Property(a => a.Group).HasMaxLength(255);
            this.Property(a => a.SuperiorName).HasMaxLength(255);
            this.Property(a => a.isStaff).IsRequired();
            this.Property(a => a.CreatedOnUtc).IsRequired();            
        }
    }
}
