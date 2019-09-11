using System;
using System.IO;
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
using Nop.Admin.Controllers;
using Nop.Services.Localization;
using OfficeOpenXml;
using Nop.Web.Framework.Kendoui;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class EventUserAdminController : BaseAdminController
    {
        #region Fields
        private readonly ICameleoEventUserService _eventUserService;
        private readonly ICameleoEventService _eventService;
        private readonly IWorkContext _workContext;
        private readonly IPermissionService _permissionService;
        private readonly ILocalizationService _localizationService;        
        
        #endregion

        #region ctor
        public EventUserAdminController(IWorkContext workContext, ICameleoEventUserService eventUserService, IPermissionService permissionService, ICameleoEventService eventService,
                ILocalizationService localizationService)
        {
            _workContext = workContext;
            _eventUserService = eventUserService;
            _permissionService = permissionService;
            _eventService = eventService;
            _localizationService = localizationService;
        }
        #endregion

        #region Utilities
        public int GetColumnIndex(string[] properties, string columnName)
        {
            if (properties == null)
                throw new ArgumentNullException("properties");

            if (columnName == null)
                throw new ArgumentNullException("columnName");

            for (int i = 0; i < properties.Length; i++)
                if (properties[i].Equals(columnName, StringComparison.InvariantCultureIgnoreCase))
                    return i + 1; //excel indexes start from 1
            return 0;
        }
        #endregion

        #region EventUserList

        [AdminAuthorize]
        public ActionResult EventUserList(int eventId)
        {
            //Event model
            CameleoEventViewModel model = _eventService.GetEventViewModel(eventId);

            //Groups for editor
            ViewData["groups"] = model.Groups.ToList();

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/EventUser/EventUserList.cshtml", model);
        }

        [HttpPost, AdminAuthorize]
        public ActionResult EventUserList(DataSourceRequest command, int eventId)
        {
            CameleoEventUserListViewModel eventUserListViewModel = _eventUserService.GetEventUserListViewModel(eventId);

            var gridModel = new DataSourceResult
            {
                Data = eventUserListViewModel.CameleoEventUserList,
                Total = eventUserListViewModel.CameleoEventUserList.Count
            };

            return Json(gridModel);
        }
        #endregion

        #region EventUserImport       

        [AdminAuthorize, ValidateAntiForgeryToken, HttpPost]
        public ActionResult ImportExcel(CameleoEventViewModel model)
        {            
            try
            {
                var file = Request.Files["importexcelfile"];
                if (file != null && file.ContentLength > 0)
                {
                    //Import
                    ImportEventUsersFromXlsx(file.InputStream, model.Id);                    
                }
                else
                {
                    ErrorNotification(_localizationService.GetResource("Admin.Common.UploadFile"));
                    return EventUserList(model.Id);
                }
                SuccessNotification(_localizationService.GetResource("Plugins.Cameleo.CameleoEventUSers.Admin.EventUserImport.Imported"));
                return EventUserList(model.Id);
            }
            catch (Exception exc)
            {
                ErrorNotification(exc);
                return EventUserList(model.Id);
            }

        }

        public virtual void ImportEventUsersFromXlsx(Stream stream, int eventId)
        {
                        
            using (var xlPackage = new ExcelPackage(stream))
            {
                // get the first worksheet in the workbook
                var worksheet = xlPackage.Workbook.Worksheets.FirstOrDefault();
                if (worksheet == null) 
                {
                    //Worksheet not found
                    throw new NopException("No worksheet found");
                }

                //the columns
                var properties = new string[]
                {
                    "UserName",
                    "Password",
                    "LastName",
                    "FirstName",
                    "Email",
                    "ClientUniqueId",
                    "ClientGroup",
                    "SuperiorName",
                    "IsStaff",                    
                };

                int iRow = 2;
                while (true)
                {
                    //Get column values
                    bool allColumnsAreEmpty = true;
                    for (var i = 1; i <= properties.Length; i++)
                    {
                        if (worksheet.Cells[iRow, i].Value != null && !String.IsNullOrEmpty(worksheet.Cells[iRow, i].Value.ToString()))
                        {
                            allColumnsAreEmpty = false;
                            break;
                        }
                    }
                    if (allColumnsAreEmpty)
                    {
                        //Empty file
                        break;
                    }
                    
                    //Get info from file
                    string userName = worksheet.Cells[iRow, GetColumnIndex(properties, "UserName")].Value.ToString();
                    string password = worksheet.Cells[iRow, GetColumnIndex(properties, "Password")].Value.ToString();
                    string lastName = worksheet.Cells[iRow, GetColumnIndex(properties, "LastName")].Value == null ? null : worksheet.Cells[iRow, GetColumnIndex(properties, "LastName")].Value.ToString();
                    string firstName = worksheet.Cells[iRow, GetColumnIndex(properties, "FirstName")].Value == null ? null : worksheet.Cells[iRow, GetColumnIndex(properties, "FirstName")].Value.ToString();
                    string email = worksheet.Cells[iRow, GetColumnIndex(properties, "Email")].Value == null ? null : worksheet.Cells[iRow, GetColumnIndex(properties, "Email")].Value.ToString();
                    string clientUniqueId = worksheet.Cells[iRow, GetColumnIndex(properties, "ClientUniqueId")].Value == null ? null : worksheet.Cells[iRow, GetColumnIndex(properties, "ClientUniqueId")].Value.ToString();
                    string clientGroup = worksheet.Cells[iRow, GetColumnIndex(properties, "ClientGroup")].Value == null ? null : worksheet.Cells[iRow, GetColumnIndex(properties, "ClientGroup")].Value.ToString();
                    string superiorName = worksheet.Cells[iRow, GetColumnIndex(properties, "SuperiorName")].Value == null ? null : worksheet.Cells[iRow, GetColumnIndex(properties, "SuperiorName")].Value.ToString();
                    bool isStaff = Convert.ToBoolean(worksheet.Cells[iRow, GetColumnIndex(properties, "IsStaff")].Value);
                    
                    //Event user exists?
                    var eventUser = _eventUserService.GetEventUserByUserName(userName);
                    bool newEventUser = false;
                    if (eventUser == null)
                    {
                        //No, new event user
                        eventUser = new CameleoEventUser();
                        newEventUser = true;
                    }

                    //Fill event user
                    eventUser.UserName = userName;
                    eventUser.Password = password;
                    eventUser.LastName = lastName;
                    eventUser.FirstName = firstName;
                    eventUser.Email = email;
                    eventUser.UniqueId = clientUniqueId;
                    eventUser.Group = clientGroup;
                    eventUser.SuperiorName = superiorName;
                    eventUser.isStaff = isStaff;

                    //EventId
                    eventUser.EventId = eventId;

                    //Create date
                    eventUser.CreatedOnUtc = DateTime.Now;
                    
                    //New?
                    if (newEventUser)
                    {
                        //Yes
                        //Insert
                        _eventUserService.InsertEventUser(eventUser);                        
                    }
                    else
                    {
                        //Else update
                        _eventUserService.UpdateEventUser(eventUser);                        
                    }                    

                    //next product
                    iRow++;
                }
            }             
        }
        #endregion

        #region EventUserUpdate
        [AdminAuthorize]        
        public ActionResult EventUserUpdate(CameleoEventUserViewModel model)
        {
            var tmpEventUser = _eventUserService.GetEventUserById(model.Id);
            if (tmpEventUser == null)
            {
                //Event user not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoEventUsers.Update.NotFound"));
            }

            //Update event user
            tmpEventUser.Password = model.Password;
            tmpEventUser.LastName = model.LastNameFull;
            tmpEventUser.FirstName = model.FirstName;
            tmpEventUser.Email = model.Email;
            tmpEventUser.UniqueId = model.UniqueId;
            tmpEventUser.Group = model.Group;
            tmpEventUser.SuperiorName = model.SuperiorName;
            tmpEventUser.isStaff = model.isStaff;
            _eventUserService.UpdateEventUser(tmpEventUser);

            // Refresh view
            return new NullJsonResult();
        }
        #endregion
    }
}