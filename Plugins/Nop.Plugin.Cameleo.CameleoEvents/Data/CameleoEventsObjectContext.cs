using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Nop.Data;
using Nop.Core;

namespace Nop.Plugin.Cameleo.CameleoEvents.Data
{
    public class CameleoEventsObjectContext : DbContext, IDbContext
    {
        public CameleoEventsObjectContext(string nameOrConnectionString) : base(nameOrConnectionString) 
        {            
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CameleoEventMap());
            modelBuilder.Configurations.Add(new CameleoEventUserMap());
            modelBuilder.Configurations.Add(new CameleoCustomerEventMap());
            modelBuilder.Configurations.Add(new CameleoProjectMap());
            modelBuilder.Configurations.Add(new CameleoProjectCategoryMap());
            modelBuilder.Configurations.Add(new CameleoProjectSubCategoryMap());
            base.OnModelCreating(modelBuilder);
        }

        public string CreateDatabaseInstallationScript()
        {
            return ((IObjectContextAdapter)this).ObjectContext.CreateDatabaseScript();
        }

        public void Install()
        {            
            /*Database.ExecuteSqlCommand(CreateDatabaseInstallationScript());
            SaveChanges();*/
        }

        public void Uninstall()
        {
            /*
            // Rename old tables instead of deleting them
            Database.SetInitializer<CameleoEventsObjectContext>(null);
            string tableName = CameleoEventUserMap.myTableName;
            if (Database.SqlQuery<int>("SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = {0}", tableName).Any<int>())
            {
                var dbScript = "SP_RENAME '" + tableName + "','" + tableName + "_UNINSTALLED_" + DateTime.Now.ToString() + "'";
                Database.ExecuteSqlCommand(dbScript);
            }
            
            tableName = CameleoEventMap.myTableName;
            if (Database.SqlQuery<int>("SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = {0}", tableName).Any<int>())
            {
                var dbScript = "SP_RENAME '" + tableName + "','" + tableName + "_UNINSTALLED_" + DateTime.Now.ToString() + "'";
                Database.ExecuteSqlCommand(dbScript);
            }

            tableName = CameleoCustomerEventMap.myTableName;
            if (Database.SqlQuery<int>("SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = {0}", tableName).Any<int>())
            {
                var dbScript = "SP_RENAME '" + tableName + "','" + tableName + "_UNINSTALLED_" + DateTime.Now.ToString() + "'";
                Database.ExecuteSqlCommand(dbScript);
            }
              
            tableName = CameleoProjectMap.myTableName;
            if (Database.SqlQuery<int>("SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = {0}", tableName).Any<int>())
            {
                var dbScript = "SP_RENAME '" + tableName + "','" + tableName + "_UNINSTALLED_" + DateTime.Now.ToString() + "'";
                Database.ExecuteSqlCommand(dbScript);
            }
              
            tableName = CameleoProjectCategoryMap.myTableName;
            if (Database.SqlQuery<int>("SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = {0}", tableName).Any<int>())
            {
                var dbScript = "SP_RENAME '" + tableName + "','" + tableName + "_UNINSTALLED_" + DateTime.Now.ToString() + "'";
                Database.ExecuteSqlCommand(dbScript);
            } 

            tableName = CameleoProjectSubCategoryMap.myTableName;
            if (Database.SqlQuery<int>("SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = {0}", tableName).Any<int>())
            {
                var dbScript = "SP_RENAME '" + tableName + "','" + tableName + "_UNINSTALLED_" + DateTime.Now.ToString() + "'";
                Database.ExecuteSqlCommand(dbScript);
            } 
            
            SaveChanges();

            */
        }

        public new IDbSet<TEntity> Set<TEntity>() where TEntity : BaseEntity
        {
            return base.Set<TEntity>();
        }

        public System.Collections.Generic.IList<TEntity> ExecuteStoredProcedureList<TEntity>(string commandText, params object[] parameters) where TEntity : BaseEntity, new()
        {
            throw new System.NotImplementedException();
        }

        public System.Collections.Generic.IEnumerable<TElement> SqlQuery<TElement>(string sql, params object[] parameters)
        {
            throw new System.NotImplementedException();
        }

        public int ExecuteSqlCommand(string sql, bool doNotEnsureTransaction = false, int? timeout = null, params object[] parameters)
        {
            throw new System.NotImplementedException();
        }
    }
}