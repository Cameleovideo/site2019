using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.ModelConfiguration;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;

namespace Nop.Plugin.Cameleo.CameleoEvents.Data
{
    public class CameleoEventMap : EntityTypeConfiguration<CameleoEvent>
    {
        public static string myTableName = "CAMELEO_Event";        

        public CameleoEventMap()
        {
            this.ToTable(myTableName);
            this.HasKey(a => a.Id);

            this.Property(u => u.EventCode).HasMaxLength(255);
            this.Property(u => u.EventName).HasMaxLength(255);
            this.Property(u => u.ClientName).HasMaxLength(255);

            this.Property(u => u.CreatedOnUtc).IsRequired();
            this.Property(u => u.ShootedOnUtc).IsOptional();
            this.Property(u => u.AcceptReminderDateUtc).IsOptional();
            this.Property(u => u.AcceptReminderDelay).IsRequired();
            this.Property(u => u.AcceptMinimumPercentage).IsRequired();
            this.Property(u => u.PayReminderDateUtc).IsOptional();
            this.Property(u => u.PayReminderDelay).IsRequired();
            this.Property(u => u.PayMinimumPercentage).IsRequired();

            this.Property(u => u.Status).IsRequired();  
        
            this.Property(u => u.ClientLogo).IsOptional();
            this.Property(u => u.IntroLogo).IsOptional();            
            this.Property(u => u.ParticipationFee).IsOptional();            
        }
    }
}
