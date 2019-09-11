using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using Nop.Core;
using Nop.Core.Plugins;
using Nop.Core.Domain.Catalog;
using Nop.Core.Domain.Customers;
using Nop.Services.Catalog;
using Nop.Plugin.Cameleo.CameleoEvents.Services;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Security;
using Nop.Web.Framework.Controllers;
using Nop.Web.Controllers;

namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class EventUserController : BasePublicController
    {
        #region Fields
        private readonly ICameleoEventUserService _eventUserService;
        private readonly IWorkContext _workContext;
        private readonly IPermissionService _permissionService;
        #endregion

        #region ctor
        public EventUserController(IWorkContext workContext, ICameleoEventUserService eventUserService, IPermissionService permissionService)
        {
            _workContext = workContext;
            _eventUserService = eventUserService;
            _permissionService = permissionService;
        }
        #endregion
       
    }
}
