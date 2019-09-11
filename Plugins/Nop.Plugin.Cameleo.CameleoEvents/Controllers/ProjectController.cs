using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nop.Services.Logging;
using Nop.Core;
using Nop.Core.Data;
using Nop.Web.Framework.Controllers;
using Nop.Services.Localization;
using Nop.Services.Security;
using Nop.Plugin.Cameleo.CameleoEvents.Services;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Web.Controllers;

namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class ProjectController : BasePublicController
    {
        #region Fields
        private readonly ICameleoEventService _eventService;
        private readonly ICameleoEventUserService _eventUserService;
        private readonly ICameleoCustomerEventService _customerEventService;
        private readonly IWorkContext _workContext;
        private readonly IPermissionService _permissionService;
        private readonly ILocalizationService _localizationService;        
        private readonly IStoreContext _storeContext;        
        private readonly ILogger _logger;

        #endregion

        #region Ctor
        public ProjectController(IWorkContext workContext, ICameleoCustomerEventService customerEventService, ILogger logger,
            ICameleoEventService eventService, ICameleoEventUserService eventUserService, IPermissionService permissionService,
            ILocalizationService localizationService, IStoreContext storeContext)
        {
            _workContext = workContext;
            _customerEventService = customerEventService;
            _eventService = eventService;
            _eventUserService = eventUserService;
            _permissionService = permissionService;
            _localizationService = localizationService;
            _storeContext = storeContext;
            _logger = logger;
        }
        #endregion        

        #region Utilities

       
        #endregion       

        #region Projects

        [Authorize]
        public ActionResult ClassProjects(int customerEventId)
        {
            //var model = BuildCustomerEventReminderListViewModel(customerEventId);
            //ViewBag.CustomerEventId = customerEventId;

            //Return view
            //return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/Project/ClassProjects.cshtml", model);
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/Project/ClassProjects.cshtml");
        }

        public ActionResult SaveUploadedFile()
        {
            bool isSavedSuccessfully = true;
            string fName = "";
            string returnMessage = "";
            foreach (string fileName in Request.Files)
            {
                try 
	            {	        
		            HttpPostedFileBase file = Request.Files[fileName];
                    //Save file content goes here
                    fName = file.FileName;
                    if (file != null && file.ContentLength > 0)
                    {

                        string path = Server.MapPath("~/Content/Images/CameleoProjects");
                        string fullPath = Path.Combine(path, "(" + DateTime.Now.ToString("yyyyMMddHHmm:ss") + ")"+ fName);

                        bool pathExists = System.IO.Directory.Exists(path);

                        if (!pathExists)
                        {
                            System.IO.Directory.CreateDirectory(path);
                        }

                        file.SaveAs(fullPath);
                    }
	            }
	            catch (Exception)
	            {
		            isSavedSuccessfully = false;
                    returnMessage = returnMessage + "erreur: "+ fName + "\n";
	            }                
            }
            

            if (isSavedSuccessfully)
            {
                return Json(new { Message = "OK" });
            }
            else
            {
                return Json(new { Message = returnMessage });
            }
        }



        #endregion
    }
}