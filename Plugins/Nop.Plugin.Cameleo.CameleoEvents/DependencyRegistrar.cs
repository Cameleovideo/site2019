using Autofac;
using Autofac.Core;
using Autofac.Integration.Mvc;
using Nop.Core.Data;
using Nop.Core.Infrastructure;
using Nop.Core.Infrastructure.DependencyManagement;
using Nop.Data;
using Nop.Plugin.Cameleo.CameleoEvents.Data;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.Services;

namespace Nop.Plugin.Cameleo.CameleoEvents
{
    public class DependencyRegistrar : IDependencyRegistrar
    {
        public virtual void Register(ContainerBuilder builder, ITypeFinder typeFinder)
        {
            builder.RegisterType<CameleoEventService>().As<ICameleoEventService>().InstancePerLifetimeScope();
            builder.RegisterType<CameleoEventUserService>().As<ICameleoEventUserService>().InstancePerLifetimeScope();
            builder.RegisterType<CameleoCustomerEventService>().As<ICameleoCustomerEventService>().InstancePerLifetimeScope();
            builder.RegisterType<CameleoWorkflowMessageService>().As<ICameleoWorkflowMessageService>().InstancePerLifetimeScope();
            builder.RegisterType<CameleoProjectService>().As<ICameleoProjectService>().InstancePerLifetimeScope();
            builder.RegisterType<CameleoProjectCategoryService>().As<ICameleoProjectCategoryService>().InstancePerLifetimeScope();
            builder.RegisterType<CameleoProjectSubCategoryService>().As<ICameleoProjectSubCategoryService>().InstancePerLifetimeScope();

            //data layer
            var dataSettingsManager = new DataSettingsManager();
            var dataProviderSettings = dataSettingsManager.LoadSettings();

            if (dataProviderSettings != null && dataProviderSettings.IsValid())
            {
                //register CameleoEvent
                builder.Register<IDbContext>(c => new CameleoEventsObjectContext(dataProviderSettings.DataConnectionString))
                    .Named<IDbContext>("nop_object_context_cameleo_events")
                    .InstancePerLifetimeScope();

                builder.Register<CameleoEventsObjectContext>(c => new CameleoEventsObjectContext(dataProviderSettings.DataConnectionString))
                    .InstancePerLifetimeScope();
            }
            else
            {
                //register CameleoEvent
                builder.Register<IDbContext>(c => new CameleoEventsObjectContext(c.Resolve<DataSettings>().DataConnectionString))
                    .Named<IDbContext>("nop_object_context_cameleo_events")
                    .InstancePerLifetimeScope();

                builder.Register<CameleoEventsObjectContext>(c => new CameleoEventsObjectContext(c.Resolve<DataSettings>().DataConnectionString))
                    .InstancePerLifetimeScope();
            }

            //override required repository with our custom context
            builder.RegisterType<EfRepository<CameleoEvent>>()
                .As<IRepository<CameleoEvent>>()
                .WithParameter(ResolvedParameter.ForNamed<IDbContext>("nop_object_context_cameleo_events"))
                .InstancePerLifetimeScope();

            builder.RegisterType<EfRepository<CameleoEventUser>>()
               .As<IRepository<CameleoEventUser>>()
               .WithParameter(ResolvedParameter.ForNamed<IDbContext>("nop_object_context_cameleo_events"))
               .InstancePerLifetimeScope();

            builder.RegisterType<EfRepository<CameleoCustomerEvent>>()
               .As<IRepository<CameleoCustomerEvent>>()
               .WithParameter(ResolvedParameter.ForNamed<IDbContext>("nop_object_context_cameleo_events"))
               .InstancePerLifetimeScope();

            builder.RegisterType<EfRepository<CameleoProject>>()
               .As<IRepository<CameleoProject>>()
               .WithParameter(ResolvedParameter.ForNamed<IDbContext>("nop_object_context_cameleo_events"))
               .InstancePerLifetimeScope();

            builder.RegisterType<EfRepository<CameleoProjectCategory>>()
              .As<IRepository<CameleoProjectCategory>>()
              .WithParameter(ResolvedParameter.ForNamed<IDbContext>("nop_object_context_cameleo_events"))
              .InstancePerLifetimeScope();

            builder.RegisterType<EfRepository<CameleoProjectSubCategory>>()
              .As<IRepository<CameleoProjectSubCategory>>()
              .WithParameter(ResolvedParameter.ForNamed<IDbContext>("nop_object_context_cameleo_events"))
              .InstancePerLifetimeScope();
        }

        public int Order
        {
            get { return 1; }
        }
    }
}
