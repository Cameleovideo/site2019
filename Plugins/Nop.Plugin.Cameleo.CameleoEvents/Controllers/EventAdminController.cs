using System;
using System.Drawing;
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
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Payments;
using Nop.Core.Domain.Shipping;
using Nop.Core.Domain.Directory;
using Nop.Admin.Models.Orders;
using Nop.Services.Catalog;
using Nop.Services.Common;
using Nop.Services.Customers;
using Nop.Services.Stores;
using Nop.Services.Vendors;
using Nop.Services.Orders;
using Nop.Services.Localization;
using Nop.Services.Helpers;
using Nop.Services.Directory;
using Nop.Plugin.Cameleo.CameleoEvents.Services;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Security;
using Nop.Web.Models.Customer;
using Nop.Web.Framework;
using Nop.Web.Framework.Controllers;
using Nop.Web.Framework.Security;
using Nop.Web.Themes.CameleoVideoTheme.ViewModels;
using Nop.Web.Framework.UI.Captcha;
using Rotativa;
using Nop.Admin.Controllers;
using Nop.Web.Framework.Kendoui;
using Nop.Web.Framework.Mvc;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class EventAdminController : BaseAdminController
    {
        #region Fields
        private readonly ICameleoEventService _eventService;
        private readonly ICameleoEventUserService _eventUserService;
        private readonly ICameleoCustomerEventService _customerEventService;
        private readonly IWorkContext _workContext;
        private readonly IPermissionService _permissionService;
        private readonly ICustomerService _customerService;
        private readonly CustomerSettings _customerSettings;
        private readonly CaptchaSettings _captchaSettings;
        private readonly ILocalizationService _localizationService;
        private readonly IStoreService _storeService;
        private readonly IVendorService _vendorService;
        private readonly IOrderService _orderService;
        private readonly IPriceFormatter _priceFormatter;
        private readonly IDateTimeHelper _dateTimeHelper;
        private readonly IOrderProcessingService _orderProcessingService;
        private readonly IOrderReportService _orderReportService;
        private readonly ICustomerRegistrationService _customerRegistrationService;
        private readonly IGenericAttributeService _genericAttributeService;
        private readonly ICurrencyService _currencyService;
        private readonly CurrencySettings _currencySettings;
        private readonly IShoppingCartService _shoppingCartService;
        private readonly ICameleoWorkflowMessageService _cameleoWorkflowMessageService;
        #endregion

        #region Ctor
        public EventAdminController(IWorkContext workContext, ICameleoEventService eventService, ICameleoEventUserService eventUserService, IPermissionService permissionService,
                CaptchaSettings captchaSettings, CustomerSettings customerSettings, ILocalizationService localizationService, ICameleoCustomerEventService customerEventService,
                ICustomerService customerService, IStoreService storeService, IVendorService vendorService, IOrderService orderService, IPriceFormatter priceFormatter,
                IDateTimeHelper dateTimeHelper, IOrderProcessingService orderProcessingService, ICustomerRegistrationService customerRegistrationService,
                IGenericAttributeService genericAttributeService, IOrderReportService orderReportService, ICurrencyService currencyService, CurrencySettings currencySettings,
                IShoppingCartService shoppingCartService, ICameleoWorkflowMessageService cameleoWorkflowMessageService)
        {
            _workContext = workContext;            
            _eventService = eventService;
            _eventUserService = eventUserService;
            _permissionService = permissionService;
            _captchaSettings = captchaSettings;
            _customerSettings = customerSettings;
            _localizationService = localizationService;
            _customerEventService = customerEventService;
            _customerService = customerService;
            _storeService = storeService;
            _vendorService = vendorService;
            _orderService = orderService;
            _priceFormatter = priceFormatter;
            _dateTimeHelper = dateTimeHelper;
            _orderProcessingService = orderProcessingService;
            _customerRegistrationService = customerRegistrationService;
            _genericAttributeService = genericAttributeService;
            _orderReportService = orderReportService;
            _currencyService = currencyService;
            _currencySettings = currencySettings;
            _shoppingCartService = shoppingCartService;
            _cameleoWorkflowMessageService = cameleoWorkflowMessageService;
        }
        #endregion

        #region Utilities

        CameleoEventFinalReportViewModel GetCameleoEventFinalReportViewModel(int eventId)
        {
            //Get details for this event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(eventId);
            CameleoEventFinalReportViewModel model = new CameleoEventFinalReportViewModel();
            model.CameleoEvent = eventViewModel;

            // Get customer events details for this event
            //For each group
            foreach (var tmpGroup in eventViewModel.Groups)
            {
                //Get customer event users for this group
                CameleoCustomerEventListViewModel customerEventListViewModel = _customerEventService.GetCustomerEventListViewModel(eventId, tmpGroup.Text);
                foreach (var tmpCustomerEvent in customerEventListViewModel.CameleoCustomerEventList)
                {
                    model.CameleoCustomerEventList.Add(tmpCustomerEvent);
                }

                //Get remaining event users that did not answer
                var noAnswerEventUsers = _eventUserService.GetNoAnswerEventUsers(eventViewModel.Id, tmpGroup.Text);
                foreach (var tmpEventUser in noAnswerEventUsers)
                {
                    CameleoCustomerEventViewModel tmpCustomerEvent = new CameleoCustomerEventViewModel();

                    tmpCustomerEvent.Id = -1;
                    tmpCustomerEvent.EventUserId = tmpEventUser.Id;
                    tmpCustomerEvent.CustomerId = -1;
                    tmpCustomerEvent.CustomerUserName = "";
                    tmpCustomerEvent.Paid = false;
                    tmpCustomerEvent.Accepted = false;
                    tmpCustomerEvent.AcceptedStatus = (int)AcceptedStatus.ToBeCompleted;
                    tmpCustomerEvent.AcceptedStatusString = _localizationService.GetResource(AcceptedStatusStrings.LocalizedStringValues[tmpCustomerEvent.AcceptedStatus]);
                    tmpCustomerEvent.AcceptedImageUse = false;
                    tmpCustomerEvent.CameleoEvent = eventViewModel;
                    tmpCustomerEvent.CameleoEventUser = new CameleoEventUserViewModel(tmpEventUser, 0, 0);
                    model.CameleoCustomerEventList.Add(tmpCustomerEvent);
                }
            }

            return model;
        }

        NotPaidReportViewModel GetNotPaidReportViewModel(int eventId)
        {
            //Get details for this event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(eventId);
            NotPaidReportViewModel model = new NotPaidReportViewModel();
            model.CameleoEvent = eventViewModel;
            
            // Get customer events details for this event
            //For each group
            foreach (var tmpGroup in eventViewModel.Groups)
            {
                //Get customer event users for this group
                CameleoCustomerEventListViewModel customerEventListViewModel = _customerEventService.GetCustomerEventListViewModel(eventId, tmpGroup.Text);
                foreach (CameleoCustomerEventViewModel tmpNotPaidCustomerUser in customerEventListViewModel.CameleoCustomerEventList)
                {
                    NotPaidUserViewModel tmpNotPaidUser = new NotPaidUserViewModel(tmpNotPaidCustomerUser);                    
                    //Paid ?
                    if (!tmpNotPaidUser.Paid)
                    {
                        //No

                        //Skip users who refused or do not whish to pay or did not answer
                        if (tmpNotPaidCustomerUser.AcceptedStatus == (int)AcceptedStatus.AcceptedPaid)
                        {
                            //Get customer
                            var tmpCustomer = _customerService.GetCustomerById(tmpNotPaidUser.CustomerId);

                            //Check cart for this customer?                        
                            foreach (var cartItem in tmpCustomer.ShoppingCartItems)
                            {
                                // Get customer events if any
                                var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromShoppingCart(tmpCustomer.ShoppingCartItems, cartItem.Id);
                                foreach (var tmpCustomerEvent in tmpCustomerEvents)
                                {
                                    //Current user?
                                    if (tmpCustomerEvent.Id == tmpNotPaidUser.CustomerEventId)
                                    {
                                        //Yes, 
                                        tmpNotPaidUser.CartId = cartItem.Id;
                                        break;
                                    }
                                }
                            }

                            //Check pending orders orders for this customer
                            var tmpOrders = _orderService.GetAllOrderItems(null, tmpNotPaidUser.CustomerId, null, null, OrderStatus.Pending, PaymentStatus.Pending, null);
                            foreach (var tmpOrder in tmpOrders)
                            {
                                // Get customer events if any
                                var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromOrder(tmpOrder.OrderId);
                                foreach (var tmpCustomerEvent in tmpCustomerEvents)
                                {
                                    //Current user?
                                    if (tmpCustomerEvent.Id == tmpNotPaidUser.CustomerEventId)
                                    {
                                        //Yes, 
                                        tmpNotPaidUser.OrderId = tmpOrder.OrderId;
                                        break;
                                    }
                                }
                            }

                            //Add in list
                            model.NotPaidUserList.Add(tmpNotPaidUser);
                        }
                    }                    
                }
            }

            return model;
        }
        #endregion

        #region configure
        [AdminAuthorize]
        public ActionResult Configure()
        {
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Configure.cshtml");
        }

        [AdminAuthorize]
        public ActionResult ConfigureEvents()
        {            
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/ConfigureEvents.cshtml");
        }

        [HttpPost, AdminAuthorize]
        public ActionResult EventList(DataSourceRequest command)
        {           
            var eventModel = _eventService.GetEventListViewModel();

            var gridModel = new DataSourceResult
            {
                Data = eventModel.CameleoEventList,
                Total = eventModel.CameleoEventList.Count
            };

            return Json(gridModel);
        }
        #endregion

        #region EventDetails

        [AdminAuthorize]
        public ActionResult EventDetails(int eventId)
        {
            //Get details for this event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(eventId);

            //Return view            
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Event/CameleoEventDetails.cshtml", eventViewModel);
        }

        [HttpPost, AdminAuthorize]
        public ActionResult EventDetails(CameleoEventViewModel model)
        {
            //Get details for this event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(model.Id);


            //Find group to show details
            foreach (var tmpGroup in eventViewModel.Groups)
            {
                if (tmpGroup.Text == model.DetailedGroupName)
                {
                    eventViewModel.GroupDetails = tmpGroup;
                }
            }
            eventViewModel.DetailedGroupName = model.DetailedGroupName;
            eventViewModel.ShowGroupDetails = true;

            //Return view            
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Event/CameleoEventDetails.cshtml", eventViewModel);
        }

        //[HttpPost, AdminAuthorize]
        //public ActionResult EventDetailsJson(DataSourceRequest command, int eventId)
        //{
        //    CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(eventId);

        //    var gridModel = new DataSourceResult
        //    {
        //        Data = new List<CameleoEventViewModel>() { eventViewModel },
        //        Total = 1
        //    };

        //    return Json(gridModel);
        //}
        #endregion

        #region UpdateEvent

        [AdminAuthorize]        
        public ActionResult EventUpdate(CameleoEventViewModel model)
        {            
            //Get event
            var tmpEvent = _eventService.GetEventById(model.Id);
            if (tmpEvent == null)
            {
                //Event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoEvent.NotFound"));
            }

            //Update event
            tmpEvent.ClientName = model.ClientName;
            tmpEvent.EventCode = model.EventCode;
            tmpEvent.EventName = model.EventName;            
            tmpEvent.ShootedOnUtc = model.ShootedOnUtc;
            tmpEvent.AcceptReminderDateUtc = model.AcceptReminderDateUtc;
            tmpEvent.AcceptReminderDelay = model.AcceptReminderDelay;
            tmpEvent.AcceptMinimumPercentage = model.AcceptMinimumPercentage;
            tmpEvent.Status = model.Status;
            tmpEvent.ClientLogo = model.ClientLogo;
            tmpEvent.IntroLogo = model.IntroLogo;
            tmpEvent.ParticipationFee = model.ParticipationFee;
            _eventService.UpdateEvent(tmpEvent);
            
            //Return view                        
            return new NullJsonResult();
        }
        #endregion

        #region InsertEvent

        [AdminAuthorize]        
        public ActionResult EventInsert(CameleoEventViewModel model)
        {  
            //Insert event
            var tmpEvent = new CameleoEvent();
            tmpEvent.ClientName = model.ClientName;
            tmpEvent.EventCode = model.EventCode;
            tmpEvent.EventName = model.EventName;
            tmpEvent.ShootedOnUtc = model.ShootedOnUtc;
            tmpEvent.AcceptReminderDateUtc = model.AcceptReminderDateUtc;
            tmpEvent.AcceptReminderDelay = model.AcceptReminderDelay;
            tmpEvent.AcceptMinimumPercentage = model.AcceptMinimumPercentage;
            tmpEvent.Status = model.Status;
            tmpEvent.ClientLogo = model.ClientLogo;
            tmpEvent.IntroLogo = model.IntroLogo;
            tmpEvent.ParticipationFee = model.ParticipationFee;
            _eventService.InsertEvent(tmpEvent);

            //Create customer user with event name
            string newUserName = tmpEvent.EventCode;
            string newEmail = tmpEvent.EventCode + "@cameleovideo.com";
            var customer = new Customer()
            {
                CustomerGuid = Guid.NewGuid(),
                Email = newEmail,
                Username = newUserName,
                VendorId = 0,
                AdminComment = "CameleoEvent creation",
                IsTaxExempt = false,
                Active = true,
                CreatedOnUtc = DateTime.UtcNow,
                LastActivityDateUtc = DateTime.UtcNow,
            };            
            _customerService.InsertCustomer(customer);

            //Last name
            _genericAttributeService.SaveAttribute(customer, SystemCustomerAttributeNames.LastName, newUserName);

            //Set password            
            var changePassRequest = new ChangePasswordRequest(newEmail, false, _customerSettings.DefaultPasswordFormat, "Vnet7272");
            var changePassResult = _customerRegistrationService.ChangePassword(changePassRequest);                  

            //Registered role
            CustomerRole tmpRole = _customerService.GetCustomerRoleBySystemName("Registered");
            customer.CustomerRoles.Add(tmpRole);
            _customerService.UpdateCustomer(customer);

            //Return view                        
            //return Configure(command);
            return new NullJsonResult();
        }
        #endregion       

        #region FinalReport

        [AdminAuthorize]
        public ActionResult FinalReport(int eventId)
        {
            CameleoEventFinalReportViewModel model = GetCameleoEventFinalReportViewModel(eventId);
            model.AsPDF = false;
            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/FinalReport/FinalReport.cshtml", model);
        }

        [AdminAuthorize, HttpPost]
        public ActionResult FinalReportPDF(int EventId)
        {
            CameleoEventFinalReportViewModel model = GetCameleoEventFinalReportViewModel(EventId);
            model.AsPDF = true;


            //Return view as PDF            
            return new ViewAsPdf("~/Plugins/Cameleo.CameleoEvents/Views/Admin/FinalReport/FinalReport.cshtml", model)
            {
                PageSize = Rotativa.Options.Size.Letter
            };
        }

        [AdminAuthorize]
        public ActionResult ExportExcelFinalReport(int eventId)
        {
            try
            {
                CameleoEventFinalReportViewModel model = GetCameleoEventFinalReportViewModel(eventId);

                byte[] bytes = null;
                using (var stream = new MemoryStream())
                {
                    ExportFinalReportToXlsx(stream, model.CameleoCustomerEventList);
                    bytes = stream.ToArray();
                }
                return File(bytes, "text/xls", "finalreport.xlsx");
            }
            catch (Exception exc)
            {
                ErrorNotification(exc);
                return RedirectToAction("List");
            }
        }

        protected virtual void ExportFinalReportToXlsx(Stream stream, IList<CameleoCustomerEventViewModel> customerEvents)
        {
            if (stream == null)
            {
                throw new ArgumentNullException("stream");
            }

            // ok, we can run the real code of the sample now
            using (var xlPackage = new ExcelPackage(stream))
            {
                // uncomment this line if you want the XML written out to the outputDir
                //xlPackage.DebugMode = true; 

                // get handle to the existing worksheet
                var worksheet = xlPackage.Workbook.Worksheets.Add("FinalReport");

                //Create Headers and format them
                var properties = new string[]
                    {
                        //properties
                        "SubjectGroup",
                        "SubjectLastName",
                        "SubjectFirstName",
                        "UserName",
                        "Password",
                        "CustomerUserName",   
                        "Accepted",
                        "AcceptedStatus",
                        "AcceptedImageUse",
                        "IsStaff",
                        "Paid"
                    };
                for (int i = 0; i < properties.Length; i++)
                {
                    worksheet.Cells[1, i + 1].Value = properties[i];
                    worksheet.Cells[1, i + 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
                    worksheet.Cells[1, i + 1].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(184, 204, 228));
                    worksheet.Cells[1, i + 1].Style.Font.Bold = true;
                }


                int row = 2;
                foreach (var tmpCustomerEvent in customerEvents)
                {
                    int col = 1;

                    //properties
                    worksheet.Cells[row, col].Value = tmpCustomerEvent.Group;
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.LastName;
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.FirstName;
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.UserName;
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.Password;
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.CustomerUserName;
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.Accepted.ToString();
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.AcceptedStatusString;
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.AcceptedImageUse.ToString();
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.isStaff.ToString();
                    col++;

                    worksheet.Cells[row, col].Value = tmpCustomerEvent.Paid.ToString();
                    col++;
                    
                    //next row
                    row++;
                }

                // save the new spreadsheet
                xlPackage.Save();
            }
        }
        #endregion

        #region NotPaidReport

        [AdminAuthorize]
        public ActionResult NotPaidReport(int eventId)
        {
            //Event
            var eventModel = _eventService.GetEventViewModel(eventId);            

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/NotPaidReport/NotPaidReport.cshtml", eventModel);
        }

        [HttpPost, AdminAuthorize]
        public ActionResult NotPaidReportJson(int eventId, DataSourceRequest command)
        {
            NotPaidReportViewModel model = GetNotPaidReportViewModel(eventId);

            var gridModel = new DataSourceResult
            {
                Data = model.NotPaidUserList,
                Total = model.NotPaidUserList.Count
            };

            return Json(gridModel);
        }

        [AdminAuthorize]
        public ActionResult ExportExcelNotPaid(int eventId)
        {
            try
            {
                NotPaidReportViewModel model = GetNotPaidReportViewModel(eventId);

                byte[] bytes = null;
                using (var stream = new MemoryStream())
                {
                    ExportNotPaidUsersToXlsx(stream, model.NotPaidUserList);
                    bytes = stream.ToArray();
                }
                return File(bytes, "text/xls", "notpaidusers.xlsx");
            }
            catch (Exception exc)
            {
                ErrorNotification(exc);
                return RedirectToAction("List");
            }
        }

        protected virtual void ExportNotPaidUsersToXlsx(Stream stream, IList<NotPaidUserViewModel> notPaidUsers)
        {
            if (stream == null)
            {
                throw new ArgumentNullException("stream");
            }

            // ok, we can run the real code of the sample now
            using (var xlPackage = new ExcelPackage(stream))
            {
                // uncomment this line if you want the XML written out to the outputDir
                //xlPackage.DebugMode = true; 

                // get handle to the existing worksheet
                var worksheet = xlPackage.Workbook.Worksheets.Add("NotPaidUsers");

                //Create Headers and format them
                var properties = new string[]
                    {
                        //order properties
                        "CustomerEventId",
                        "IsInCart",
                        "CartId",
                        "IsInOrder",
                        "OrderId",                        
                        "CustomerId",
                        "CustomerUserName", 
                        "EventUserId",
                        "SubjectLastName",
                        "SubjectFirstName",
                        "SubjectGroup",
                        "IsStaff",
                    };
                for (int i = 0; i < properties.Length; i++)
                {
                    worksheet.Cells[1, i + 1].Value = properties[i];
                    worksheet.Cells[1, i + 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
                    worksheet.Cells[1, i + 1].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(184, 204, 228));
                    worksheet.Cells[1, i + 1].Style.Font.Bold = true;
                }


                int row = 2;
                foreach (var tmpNotPaidUser in notPaidUsers)
                {
                    int col = 1;

                    //order properties
                    worksheet.Cells[row, col].Value = tmpNotPaidUser.CustomerEventId;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.IsInCart.ToString();
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.CartId;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.IsInOrder.ToString();
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.OrderId;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.CustomerId;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.CustomerUserName;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.EventUserId;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.LastNameFull;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.FirstName;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.Group;
                    col++;

                    worksheet.Cells[row, col].Value = tmpNotPaidUser.isStaff.ToString();
                    col++;                   

                    //next row
                    row++;
                }

                // save the new spreadsheet
                xlPackage.Save();
            }
        }

        #endregion

        #region IntroLetter
        [AdminAuthorize, HttpPost]
        public ActionResult IntroLetter(int Id)
        {
            var model = new IntroLetterListViewModel();

            //Get event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(Id);
                        
            //Event Id 
            model.EventId = Id;            

            //Reminder date
            model.ReminderDate = ((DateTime)eventViewModel.AcceptReminderDateUtc).ToString("yyyy-MM-dd");

            //Participation fee
            model.ParticipationFee = (decimal)eventViewModel.ParticipationFee;

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/IntroLetter/IntroLetter.cshtml", model);
        }

        public ActionResult IntroLettersPDF(IntroLetterListViewModel model)
        {
            //Get event
            var tmpEvent = _eventService.GetEventById(model.EventId);            
            
            //Replace default intro letter logo if configured
            string tmppath = _localizationService.GetResource("plugins.cameleo.cameleocustomerevents.introletter.logo.path");
            if (!string.IsNullOrEmpty(tmpEvent.IntroLogo))
            {
                tmppath = tmppath.Replace("introletter-logo", tmpEvent.IntroLogo);
            }
            model.LogoPath = Server.MapPath(tmppath);

            // Steps images
            model.Step1Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step1.path"));
            model.Step2Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step2.path"));
            model.Step3Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step3.path"));
            model.Step4Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step4.path"));

            //Get all event users
            var eventUsers = _eventUserService.GetAllEventUsers(model.EventId, 0, int.MaxValue);

            //for each event user
            foreach (var tmpEventUser in eventUsers)
            {
                model.CameleoEventUserList.Add(new CameleoEventUserViewModel(tmpEventUser, 0, 0));
                if (!model.SelectedEventUserList.ContainsKey(tmpEventUser.Id))
                {
                    model.SelectedEventUserList.Add(tmpEventUser.Id, true);
                }
            }

            //Return view as pdf
            model.showAllIntroLetters = true;
            return new ViewAsPdf("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/IntroLetter/IntroLetterPDF.cshtml", model)
            {
                PageSize = model.PageSize
            };
        }

        [AdminAuthorize, HttpPost, ActionName("IntroLettersPDF")]
        [FormValueRequired("generatewithcoupon")]
        public ActionResult IntroLettersPDFWithCoupon(IntroLetterListViewModel model)
        {
            model.TopicToUse = "CameleoIntroLetterWithCoupon";
            model.PageSize = Rotativa.Options.Size.Legal;
            return IntroLettersPDF(model);
        }

        [AdminAuthorize, HttpPost, ActionName("IntroLettersPDF")]
        [FormValueRequired("generatewithoutcoupon")]
        public ActionResult IntroLettersPDFWithoutCoupon(IntroLetterListViewModel model)
        {
            model.TopicToUse = "CameleoIntroLetterWithoutCoupon";
            model.PageSize = Rotativa.Options.Size.Letter;
            return IntroLettersPDF(model);
        }
        #endregion

        #region NotPaidReminder
        [AdminAuthorize]
        public ActionResult NotPaidReminder(int eventId)
        {
            var model = new NotPaidReminderListViewModel();

            //Get event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(eventId);

            //Fee
            model.ParticipationFee = (decimal)eventViewModel.ParticipationFee;

            //Event Id 
            model.EventId = eventId;            
           
            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/NotPaidReminder/NotPaidReminder.cshtml", model);
        }

        public ActionResult NotPaidReminderPDF(NotPaidReminderListViewModel model)
        {
            //Get event
            var tmpEvent = _eventService.GetEventById(model.EventId);

            model.LogoPath = Server.MapPath(_localizationService.GetResource("Plugins.Cameleo.CameleoEvents.Admin.NotPaidReport.Logo.Path"));

            // Get list of not paid users
            NotPaidReportViewModel notPaidUsers = GetNotPaidReportViewModel(model.EventId);

            //for each user
            foreach (var tmpNotPaidUser in notPaidUsers.NotPaidUserList)
            {
                // Only users with no email
                if (!model.showAll)
                {
                    //Yes

                    //Check if user with email
                    if (!tmpNotPaidUser.HasEmail)
                    {
                        //No, add it
                        model.NotPaidUserList.Add(tmpNotPaidUser);
                    }
                }
                else
                {
                    //Else, add all
                    model.NotPaidUserList.Add(tmpNotPaidUser);
                }            
            }

            //Return view as pdf            
            return new ViewAsPdf("~/Plugins/Cameleo.CameleoEvents/Views/Admin/NotPaidReminder/NotPaidReminderPDF.cshtml", model)
            {
                PageSize = model.PageSize
            };
        }

        [AdminAuthorize, HttpPost, ActionName("NotPaidReminderPDF")]
        [FormValueRequired("noemail")]
        public ActionResult NotPaidReminderNoEmailPDF(NotPaidReminderListViewModel model)
        {
            model.showAll = false;
            model.PageSize = Rotativa.Options.Size.Letter;
            model.TopicToUse = "CameleoNotPaidReminder";
            return NotPaidReminderPDF(model);
        }

        [AdminAuthorize, HttpPost, ActionName("NotPaidReminderPDF")]
        [FormValueRequired("all")]
        public ActionResult NotPaidReminderAllPDF(NotPaidReminderListViewModel model)
        {
            model.showAll = true;
            model.PageSize = Rotativa.Options.Size.Letter;
            model.TopicToUse = "CameleoNotPaidReminder";
            return NotPaidReminderPDF(model);
        }

        [AdminAuthorize, HttpPost, ActionName("NotPaidReminderPDF")]
        [FormValueRequired("noemail2")]
        public ActionResult NotPaidReminderNoEmail2PDF(NotPaidReminderListViewModel model)
        {
            model.showAll = false;
            model.PageSize = Rotativa.Options.Size.Letter;
            model.TopicToUse = "CameleoNotPaidReminder2";
            return NotPaidReminderPDF(model);
        }

        [AdminAuthorize, HttpPost, ActionName("NotPaidReminderPDF")]
        [FormValueRequired("all2")]
        public ActionResult NotPaidReminderAll2PDF(NotPaidReminderListViewModel model)
        {
            model.showAll = true;
            model.PageSize = Rotativa.Options.Size.Letter;
            model.TopicToUse = "CameleoNotPaidReminder2";
            return NotPaidReminderPDF(model);
        }

        #endregion

        #region NotPaidReminderEmail
        [AdminAuthorize]
        public ActionResult NotPaidReminderEmail(int eventId)
        {
            var model = new NotPaidReminderEmailListViewModel();

            //Get event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(eventId);

            //Fee
            model.ParticipationFee = (decimal)eventViewModel.ParticipationFee;

            //Event Id 
            model.EventId = eventId;

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/NotPaidReminder/NotPaidReminderEmail.cshtml", model);
        }

        [AdminAuthorize, HttpPost, ActionName("NotPaidReminderEmail")]
        [FormValueRequired("sendtest")]
        public ActionResult NotPaidReminderEmailSendTest(NotPaidReminderEmailListViewModel model)
        {
            //Send the message
            try
            {
                _cameleoWorkflowMessageService.SendNotPaidReminderMessage(_workContext.WorkingLanguage.Id, model.ParticipationFee, _workContext.CurrentCustomer.Email);

                //model.Result = model.Result + _localizationService.GetResource("ShareInfo.YourEnquiryHasBeenSent") + " : (" + tmpEmail + ")<br/>";
            }
            catch (Exception)
            {
                //model.Result = model.Result + _localizationService.GetResource("ShareInfo.Error") + " : (" + tmpEmail + ")<br/>";
            }

            return NotPaidReminderEmail(model.EventId);
        }
        #endregion

        #region Reminders
        [AdminAuthorize]
        public ActionResult EventReminder(int Id)
        {
            var model = new CustomerEventReminderListViewModel();

            //Get event
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(Id);

            //Fee
            model.ParticipationFee = (decimal)eventViewModel.ParticipationFee;

            //Event Id 
            model.EventId = Id;

            //Shoot date
            model.ShootDate = ((DateTime)eventViewModel.ShootedOnUtc).ToString("yyyy-MM-dd");            

            //Reminder date
            model.ReminderDate = ((DateTime)eventViewModel.AcceptReminderDateUtc).ToString("yyyy-MM-dd");            

            //Participation fee
            model.ParticipationFee = (decimal)eventViewModel.ParticipationFee;

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/EventReminder/EventReminder.cshtml", model);
        }

        public ActionResult AllRemindersPDF(CustomerEventReminderListViewModel model)
        {            
            //Get client logo
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(model.EventId);
            model.Logo = eventViewModel.ClientLogo;
            

            //Replace default client logo if configured
            string tmppath = _localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.defaultlogo.path");
            if (!string.IsNullOrEmpty(model.Logo))
            {
                tmppath = tmppath.Replace("default-reminder-logo", model.Logo);
            }
            model.LogoPath = Server.MapPath(tmppath);

            // Steps images
            model.Step1Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step1.path"));
            model.Step2Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step2.path"));
            model.Step3Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step3.path"));
            model.Step4Path = Server.MapPath(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.reminders.step4.path"));

            //For each group
            foreach (var tmpGroup in eventViewModel.Groups)
            {
                //Get customer events that did not answer
                var noAnswerCustomerEvents = _customerEventService.GetAllNoAnswerCustomerEventsForGroup(model.EventId, tmpGroup.Text);
                foreach (var tmpCustomerEvent in noAnswerCustomerEvents)
                {
                    model.CameleoEventUserList.Add(new CameleoEventUserViewModel(_eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId), 0, 0));
                    if (!model.SelectedEventUserList.ContainsKey(tmpCustomerEvent.EventUserId))
                    {
                        model.SelectedEventUserList.Add(tmpCustomerEvent.EventUserId, true);
                    }
                }

                //Get remaining event users that did not answer
                var noAnswerEventUsers = _eventUserService.GetNoAnswerEventUsers(model.EventId, tmpGroup.Text);
                foreach (var tmpEventUser in noAnswerEventUsers)
                {
                    if ((!string.IsNullOrEmpty(tmpEventUser.FirstName) && !(tmpEventUser.FirstName.ToLower().Contains("vide") || tmpEventUser.FirstName.ToLower().Contains("staff"))) || (!string.IsNullOrEmpty(tmpEventUser.LastName) && !(tmpEventUser.LastName.ToLower().Contains("vide") || tmpEventUser.LastName.ToLower().Contains("staff"))))
                    {
                        model.CameleoEventUserList.Add(new CameleoEventUserViewModel(tmpEventUser, 0, 0));
                        if (!model.SelectedEventUserList.ContainsKey(tmpEventUser.Id))
                        {
                            model.SelectedEventUserList.Add(tmpEventUser.Id, true);
                        }
                    }
                }
            }

            //Return view as pdf
            model.showAllReminders = true;
            return new ViewAsPdf("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventReminder/EventReminderPDF.cshtml", model)
            {
                PageSize = model.PageSize
            };
        }

        [AdminAuthorize, HttpPost, ActionName("AllRemindersPDF")]
        [FormValueRequired("generatewithcoupon")]
        public ActionResult AllRemindersPDFWithCoupon(CustomerEventReminderListViewModel model)
        {
            model.TopicToUse = "CameleoEventReminderWithCoupon";
            model.PageSize = Rotativa.Options.Size.Legal;
            return AllRemindersPDF(model);
        }

        [AdminAuthorize, HttpPost, ActionName("AllRemindersPDF")]
        [FormValueRequired("generatewithoutcoupon")]
        public ActionResult AllRemindersPDFWithoutCoupon(CustomerEventReminderListViewModel model)
        {
            model.TopicToUse = "CameleoEventReminderWithoutCoupon";
            model.PageSize = Rotativa.Options.Size.Letter;
            return AllRemindersPDF(model);
        }
        #endregion

        #region PendingOrders
        [AdminAuthorize]
        public ActionResult PendingOrders()
        {           
            //load pending orders
            var orders = _orderService.SearchOrders(0, 0, 0, 0, 0, 0, null, null, OrderStatus.Pending, PaymentStatus.Pending, null, null, null);
            var model = new PendingOrderListViewModel()
            {
                PendingOrderList = orders.Select(x =>
                {
                    var store = _storeService.GetStoreById(x.StoreId);

                    //cameleo events 
                    string eventIds = "";
                    string eventCodes = "";
                    string clientNames = "";

                    var customerEvents = _customerEventService.GetCustomerEventsFromOrder(x.Id);
                    foreach (var tmpCustomerEvent in customerEvents)
                    {
                        var tmpEvent = _eventService.GetEventByEventUserId(tmpCustomerEvent.EventUserId);
                        if (!(tmpEvent == null))
                        {
                            eventIds += tmpEvent.Id.ToString() + ",";
                            eventCodes += tmpEvent.EventCode + ",";
                            clientNames += tmpEvent.ClientName + ",";
                        }
                    }

                    //Remove trailing ,
                    if (eventIds.Length > 0)
                    {
                        eventIds = eventIds.Remove(eventIds.Length - 1);
                        eventCodes = eventCodes.Remove(eventCodes.Length - 1);
                        clientNames = clientNames.Remove(clientNames.Length - 1);
                    }

                    return new OrderViewModel()
                    {
                        Id = x.Id,
                        StoreName = store != null ? store.Name : "Unknown",
                        OrderTotal = _priceFormatter.FormatPrice(x.OrderTotal, true, false),
                        OrderStatus = x.OrderStatus.GetLocalizedEnum(_localizationService, _workContext),
                        OrderStatusId = x.OrderStatusId,
                        PaymentStatus = x.PaymentStatus.GetLocalizedEnum(_localizationService, _workContext),
                        PaymentStatusId = x.PaymentStatusId,
                        ShippingStatus = x.ShippingStatus.GetLocalizedEnum(_localizationService, _workContext),
                        CustomerEmail = x.BillingAddress.Email,
                        CustomerFullName = string.Format("{0} {1}", x.BillingAddress.FirstName, x.BillingAddress.LastName),
                        CustomerId = x.CustomerId,
                        CreatedOn = _dateTimeHelper.ConvertToUserTime(x.CreatedOnUtc, DateTimeKind.Utc),
                        CanEditOrder = _workContext.CurrentCustomer.IsAdmin(),
                        EventIds = eventIds,
                        EventCodes = eventCodes,
                        ClientNames = clientNames
                    };
                }).ToList()                
            };

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/PendingOrders/PendingOrders.cshtml", model);
        }

        [AdminAuthorize]
        public ActionResult PendigOrderPaid(int orderId)
        {
            //Get order
            var order = _orderService.GetOrderById(orderId);
            if (order != null)
            {                
                //Order found

                //Mark as paid
                _orderProcessingService.MarkOrderAsPaid(order);                

                //Get customer events related to order if any
                var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromOrder(orderId);

                //For each event user
                foreach (var tmpCustomerEvent in tmpCustomerEvents)
                {
                    //Set status to paid
                    tmpCustomerEvent.Paid = true;
                    _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);
                }
            }

            return RedirectToAction("PendingOrders");
        }
        #endregion

        #region Orders
        [AdminAuthorize]
        public ActionResult Orders()
        {
            //order statuses
            var model = new OrderListViewModel();
            model.AvailableOrderStatuses = OrderStatus.Pending.ToSelectList(false).ToList();
            model.AvailableOrderStatuses.Insert(0, new SelectListItem() { Text = _localizationService.GetResource("Admin.Common.All"), Value = "0" });

            //payment statuses
            model.AvailablePaymentStatuses = PaymentStatus.Pending.ToSelectList(false).ToList();
            model.AvailablePaymentStatuses.Insert(0, new SelectListItem() { Text = _localizationService.GetResource("Admin.Common.All"), Value = "0" });

            //shipping statuses
            model.AvailableShippingStatuses = ShippingStatus.NotYetShipped.ToSelectList(false).ToList();
            model.AvailableShippingStatuses.Insert(0, new SelectListItem() { Text = _localizationService.GetResource("Admin.Common.All"), Value = "0" });            

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Orders/Orders.cshtml", model);
        }

        [AdminAuthorize, HttpPost]
        public ActionResult OrderList(DataSourceRequest command, OrderListViewModel model)
        {   
            DateTime? startDateValue = (model.StartDate == null) ? null : (DateTime?)_dateTimeHelper.ConvertToUtcTime(model.StartDate.Value, _dateTimeHelper.CurrentTimeZone);
            DateTime? endDateValue = (model.EndDate == null) ? null : (DateTime?)_dateTimeHelper.ConvertToUtcTime(model.EndDate.Value, _dateTimeHelper.CurrentTimeZone).AddDays(1);
            OrderStatus? orderStatus = model.OrderStatusId > 0 ? (OrderStatus?)(model.OrderStatusId) : null;
            PaymentStatus? paymentStatus = model.PaymentStatusId > 0 ? (PaymentStatus?)(model.PaymentStatusId) : null;
            ShippingStatus? shippingStatus = model.ShippingStatusId > 0 ? (ShippingStatus?)(model.ShippingStatusId) : null;

            //load orders
            var orders = _orderService.SearchOrders(0, 0, 0, 0, 0, 0, startDateValue, endDateValue, orderStatus, paymentStatus, shippingStatus, model.CustomerEmail, null, command.Page - 1, command.PageSize);
            var gridModel = new DataSourceResult
            {
                Data = orders.Select(x =>
                {
                    //store
                    var store = _storeService.GetStoreById(x.StoreId);

                    //cameleo events 
                    string eventIds = "";
                    string eventCodes = "";
                    string clientNames = "";

                    var customerEvents = _customerEventService.GetCustomerEventsFromOrder(x.Id);                    
                    foreach (var tmpCustomerEvent in customerEvents)
                    {
                        var tmpEvent = _eventService.GetEventByEventUserId(tmpCustomerEvent.EventUserId);
                        if (!(tmpEvent==null))
                        {
                            eventIds += tmpEvent.Id.ToString() + ",";
                            eventCodes += tmpEvent.EventCode + ",";
                            clientNames += tmpEvent.ClientName + ",";
                        }
                    }

                    //Remove trailing ,
                    if (eventIds.Length > 0)
                    {
                        eventIds = eventIds.Remove(eventIds.Length - 1);
                        eventCodes = eventCodes.Remove(eventCodes.Length - 1);
                        clientNames = clientNames.Remove(clientNames.Length - 1);
                    }

                    return new OrderViewModel()
                    {
                        Id = x.Id,
                        StoreName = store != null ? store.Name : "Unknown",
                        OrderTotal = _priceFormatter.FormatPrice(x.OrderTotal, true, false),
                        OrderStatusId = x.OrderStatusId,
                        OrderStatus = x.OrderStatus.GetLocalizedEnum(_localizationService, _workContext),
                        PaymentStatus = x.PaymentStatus.GetLocalizedEnum(_localizationService, _workContext),
                        PaymentStatusId = x.PaymentStatusId,
                        ShippingStatus = x.ShippingStatus.GetLocalizedEnum(_localizationService, _workContext),
                        CustomerEmail = x.BillingAddress.Email,
                        CustomerId = x.CustomerId,
                        CustomerFullName = string.Format("{0} {1}", x.BillingAddress.FirstName, x.BillingAddress.LastName),
                        CreatedOn = _dateTimeHelper.ConvertToUserTime(x.CreatedOnUtc, DateTimeKind.Utc),
                        CanEditOrder = _workContext.CurrentCustomer.IsAdmin(),
                        EventIds = eventIds,
                        EventCodes = eventCodes,
                        ClientNames = clientNames
                    };
                }),
                Total = orders.TotalCount
            };

            return new JsonResult
            {
                Data = gridModel
            };
        }

        [AdminAuthorize]
        public ActionResult RefundOrder(int orderId)
        {
            //Get order
            var order = _orderService.GetOrderById(orderId);
            if (order != null)
            {
                //Order found

                //Mark as refunded
                _orderProcessingService.RefundOffline(order);

                //Get customer events related to order if any
                var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromOrder(orderId);

                //For each event user
                foreach (var tmpCustomerEvent in tmpCustomerEvents)
                {
                    //Set status to not paid
                    tmpCustomerEvent.Paid = false;
                    _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);
                }
            }

            return new NullJsonResult();
        }

        [AdminAuthorize]
        public ActionResult CancelOrder(int orderId)
        {
            //Get order
            var order = _orderService.GetOrderById(orderId);
            if (order != null)
            {
                //Order found

                //Mark as canceled
                _orderProcessingService.CancelOrder(order, false);
            }

            return new NullJsonResult();
        }

        [AdminAuthorize]
        public ActionResult PaidOrder(int orderId)
        {
            //Get order
            var order = _orderService.GetOrderById(orderId);
            if (order != null)
            {
                //Order found

                //Mark as paid
                _orderProcessingService.MarkOrderAsPaid(order);

                //Get customer events related to order if any
                var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromOrder(orderId);

                //For each event user
                foreach (var tmpCustomerEvent in tmpCustomerEvents)
                {
                    //Set status to paid
                    tmpCustomerEvent.Paid = true;
                    _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);
                }
            }

            return new NullJsonResult();
        }

        [AdminAuthorize]
        public ActionResult ExportExcelAll()
        {                     
            try
            {
                var orders = _orderService.SearchOrders();

                byte[] bytes = null;
                using (var stream = new MemoryStream())
                {
                    ExportOrdersToXlsx(stream, orders);
                    bytes = stream.ToArray();
                }
                return File(bytes, "text/xls", "orders.xlsx");
            }
            catch (Exception exc)
            {
                ErrorNotification(exc);
                return RedirectToAction("List");
            }
        }

        [AdminAuthorize]
        public ActionResult ExportExcelSelected(string selectedIds)
        {            

            var orders = new List<Order>();
            if (selectedIds != null)
            {
                var ids = selectedIds
                    .Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                    .Select(x => Convert.ToInt32(x))
                    .ToArray();
                orders.AddRange(_orderService.GetOrdersByIds(ids));
            }

            byte[] bytes = null;
            using (var stream = new MemoryStream())
            {
                ExportOrdersToXlsx(stream, orders);
                bytes = stream.ToArray();
            }
            return File(bytes, "text/xls", "orders.xlsx");
        }

        protected virtual void ExportOrdersToXlsx(Stream stream, IList<Order> orders)
        {
            if (stream == null)
            {
                throw new ArgumentNullException("stream");
            }

            // ok, we can run the real code of the sample now
            using (var xlPackage = new ExcelPackage(stream))
            {
                // uncomment this line if you want the XML written out to the outputDir
                //xlPackage.DebugMode = true; 

                // get handle to the existing worksheet
                var worksheet = xlPackage.Workbook.Worksheets.Add("Orders");

                //Create Headers and format them
                var properties = new string[]
                    {
                        //order properties
                        "OrderId",
                        "StoreId",
                        "OrderGuid",
                        "CustomerId",
                        "CustomerName",
                        "CustomerEmail",
                        "OrderStatusId",
                        "OrderStatus",
                        "PaymentStatusId",
                        "PaymentStatus",
                        "ShippingStatusId",
                        "ShippingStatus",
                        //Cameleo
                        "CameleoSubjectLastName",
                        "CameleoSubjectFirstName",
                        "CameleoSubjectGroup",
                        "CameleoEventId",
                        "CameleoEventCode",
                        "CameleoClientName",
                        "OrderSubtotalInclTax",
                        "OrderSubtotalExclTax",
                        "OrderSubTotalDiscountInclTax",
                        "OrderSubTotalDiscountExclTax",
                        "OrderShippingInclTax",
                        "OrderShippingExclTax",
                        "PaymentMethodAdditionalFeeInclTax",
                        "PaymentMethodAdditionalFeeExclTax",
                        "TaxRates",
                        "OrderTax",
                        "OrderTotal",
                        "RefundedAmount",
                        "OrderDiscount",
                        "CurrencyRate",
                        "CustomerCurrencyCode",
                        "AffiliateId",
                        "PaymentMethodSystemName",
                        "PurchaseOrderNumber",
                        "ShippingMethod",
                        "ShippingRateComputationMethodSystemName",
                        "CustomValuesXml",
                        "VatNumber",
                        "CreatedOnUtc",
                        //billing address
                        "BillingFirstName",
                        "BillingLastName",
                        "BillingEmail",
                        "BillingCompany",
                        "BillingCountry",
                        "BillingStateProvince",
                        "BillingCity",
                        "BillingAddress1",
                        "BillingAddress2",
                        "BillingZipPostalCode",
                        "BillingPhoneNumber",
                        "BillingFaxNumber",
                        //shipping address
                        "ShippingFirstName",
                        "ShippingLastName",
                        "ShippingEmail",
                        "ShippingCompany",
                        "ShippingCountry",
                        "ShippingStateProvince",
                        "ShippingCity",
                        "ShippingAddress1",
                        "ShippingAddress2",
                        "ShippingZipPostalCode",
                        "ShippingPhoneNumber",
                        "ShippingFaxNumber",
                    };
                for (int i = 0; i < properties.Length; i++)
                {
                    worksheet.Cells[1, i + 1].Value = properties[i];
                    worksheet.Cells[1, i + 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
                    worksheet.Cells[1, i + 1].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(184, 204, 228));
                    worksheet.Cells[1, i + 1].Style.Font.Bold = true;
                }


                int row = 2;
                foreach (var order in orders)
                {
                    int col = 1;

                    //order properties
                    worksheet.Cells[row, col].Value = order.Id;
                    col++;

                    worksheet.Cells[row, col].Value = order.StoreId;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderGuid;
                    col++;

                    worksheet.Cells[row, col].Value = order.CustomerId;
                    col++;

                    worksheet.Cells[row, col].Value = order.Customer.FormatUserName();
                    col++;

                    worksheet.Cells[row, col].Value = order.Customer.Email;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderStatusId;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderStatus.ToString();
                    col++;

                    worksheet.Cells[row, col].Value = order.PaymentStatusId;
                    col++;

                    worksheet.Cells[row, col].Value = order.PaymentStatus.ToString();
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingStatusId;
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingStatus.ToString();
                    col++;

                    //cameleo events 
                    string subjectFirstNames = "";
                    string subjectLastNames = "";
                    string subjectGroups = "";
                    string eventIds = "";
                    string eventCodes = "";
                    string clientNames = "";

                    var customerEvents = _customerEventService.GetCustomerEventsFromOrder(order.Id);
                    foreach (var tmpCustomerEvent in customerEvents)
                    {
                        var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
                        if (!(tmpEventUser == null))
                        {
                            subjectFirstNames += tmpEventUser.FirstName + "-";
                            subjectLastNames += tmpEventUser.LastName + "-";
                            subjectGroups += tmpEventUser.Group + "-";
                        }

                        var tmpEvent = _eventService.GetEventByEventUserId(tmpCustomerEvent.EventUserId);
                        if (!(tmpEvent == null))
                        {                            
                            eventIds += tmpEvent.Id.ToString() + "-";
                            eventCodes += tmpEvent.EventCode + "-";
                            clientNames += tmpEvent.ClientName + "-";
                        }
                    }

                    //Remove trailing -
                    if (subjectLastNames.Length > 0)
                    {
                        subjectFirstNames = subjectFirstNames.Remove(subjectFirstNames.Length - 1);
                        subjectLastNames = subjectLastNames.Remove(subjectLastNames.Length - 1);
                        subjectGroups = subjectGroups.Remove(subjectGroups.Length - 1);
                    }

                    if (eventIds.Length > 0)
                    {
                        eventIds = eventIds.Remove(eventIds.Length - 1);
                        eventCodes = eventCodes.Remove(eventCodes.Length - 1);
                        clientNames = clientNames.Remove(clientNames.Length - 1);
                    }

                    worksheet.Cells[row, col].Value = subjectLastNames;
                    col++;

                    worksheet.Cells[row, col].Value = subjectFirstNames;
                    col++;

                    worksheet.Cells[row, col].Value = subjectGroups;
                    col++;

                    worksheet.Cells[row, col].Value = eventIds;
                    col++;

                    worksheet.Cells[row, col].Value = eventCodes;
                    col++;

                    worksheet.Cells[row, col].Value = clientNames;
                    col++;
                    
                    worksheet.Cells[row, col].Value = order.OrderSubtotalInclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderSubtotalExclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderSubTotalDiscountInclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderSubTotalDiscountExclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderShippingInclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderShippingExclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.PaymentMethodAdditionalFeeInclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.PaymentMethodAdditionalFeeExclTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.TaxRates;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderTax;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderTotal;
                    col++;

                    worksheet.Cells[row, col].Value = order.RefundedAmount;
                    col++;

                    worksheet.Cells[row, col].Value = order.OrderDiscount;
                    col++;

                    worksheet.Cells[row, col].Value = order.CurrencyRate;
                    col++;

                    worksheet.Cells[row, col].Value = order.CustomerCurrencyCode;
                    col++;

                    worksheet.Cells[row, col].Value = order.AffiliateId;
                    col++;

                    worksheet.Cells[row, col].Value = order.PaymentMethodSystemName;
                    col++;

                    worksheet.Cells[row, col].Value = order.PurchaseOrderNumber;
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingMethod;
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingRateComputationMethodSystemName;
                    col++;

                    worksheet.Cells[row, col].Value = order.CustomValuesXml;
                    col++;

                    worksheet.Cells[row, col].Value = order.VatNumber;
                    col++;

                    worksheet.Cells[row, col].Value = _dateTimeHelper.ConvertToUserTime(order.CreatedOnUtc, DateTimeKind.Utc).ToString("G");
                    col++;


                    //billing address
                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.FirstName : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.LastName : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.Email : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.Company : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null && order.BillingAddress.Country != null ? order.BillingAddress.Country.Name : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null && order.BillingAddress.StateProvince != null ? order.BillingAddress.StateProvince.Name : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.City : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.Address1 : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.Address2 : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.ZipPostalCode : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.PhoneNumber : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.BillingAddress != null ? order.BillingAddress.FaxNumber : "";
                    col++;

                    //shipping address
                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.FirstName : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.LastName : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.Email : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.Company : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null && order.ShippingAddress.Country != null ? order.ShippingAddress.Country.Name : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null && order.ShippingAddress.StateProvince != null ? order.ShippingAddress.StateProvince.Name : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.City : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.Address1 : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.Address2 : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.ZipPostalCode : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.PhoneNumber : "";
                    col++;

                    worksheet.Cells[row, col].Value = order.ShippingAddress != null ? order.ShippingAddress.FaxNumber : "";
                    col++;

                    //next row
                    row++;
                }

                // save the new spreadsheet
                xlPackage.Save();
            }
        }

        #endregion

    }
}
