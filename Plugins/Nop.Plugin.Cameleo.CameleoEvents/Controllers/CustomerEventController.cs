using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nop.Services.Logging;
using Nop.Core;
using Nop.Core.Data;
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Common;
using Nop.Web.Framework.Controllers;
using Nop.Services.Localization;
using Nop.Web.Themes.CameleoVideoTheme.Domain;
using Nop.Services.Security;
using Nop.Services.Customers;
using Nop.Services.Catalog;
using Nop.Services.Orders;
using Nop.Services.Common;
using Nop.Plugin.Cameleo.CameleoEvents.Services;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Rotativa;
using Nop.Web.Controllers;

namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class CustomerEventController : BasePublicController
    {
        #region Fields
        private readonly ICameleoEventService _eventService;
        private readonly ICameleoEventUserService _eventUserService;
        private readonly ICameleoCustomerEventService _customerEventService;
        private readonly IWorkContext _workContext;
        private readonly IPermissionService _permissionService;
        private readonly ILocalizationService _localizationService;
        private readonly ICustomerService _customerService;
        private readonly IShoppingCartService _shoppingCartService;
        private readonly IProductService _productService;
        private readonly IStoreContext _storeContext;
        private readonly IGenericAttributeService _genericAttributeService;
        private readonly IOrderService _orderService;
        IRepository<GenericAttribute> _genericAttributeRepository;
        private readonly ILogger _logger;

        #endregion

        #region Ctor
        public CustomerEventController(IWorkContext workContext, ICameleoCustomerEventService customerEventService, ILogger logger,
            ICameleoEventService eventService, ICameleoEventUserService eventUserService, IPermissionService permissionService,
            ILocalizationService localizationService, ICustomerService customerService, IShoppingCartService shoppingCartService,
            IProductService productService, IStoreContext storeContext, IGenericAttributeService genericAttributeService,
            IOrderService orderService, IRepository<GenericAttribute> genericAttributeRepository)
        {
            _workContext = workContext;
            _customerEventService = customerEventService;
            _eventService = eventService;
            _eventUserService = eventUserService;
            _permissionService = permissionService;
            _localizationService = localizationService;
            _customerService = customerService;
            _shoppingCartService = shoppingCartService;
            _productService = productService;
            _storeContext = storeContext;
            _genericAttributeService = genericAttributeService;
            _orderService = orderService;
            _genericAttributeRepository = genericAttributeRepository;
            _logger = logger;
        }
        #endregion        

        #region Utilities

        CustomerEventReminderListViewModel BuildCustomerEventReminderListViewModel(int customerEventId)
        {
            var model = new CustomerEventReminderListViewModel();
            model.StaffCustomerEventId = customerEventId;            
            var tmpStaffCustomerEvent = _customerEventService.GetCustomerEventById(customerEventId);
            var tmpStaffEventUser = _eventUserService.GetEventUserById(tmpStaffCustomerEvent.EventUserId);

            //Group
            model.GroupName = tmpStaffEventUser.Group;

            //Get event
            var tmpEvent = _eventService.GetEventByEventUserId(tmpStaffCustomerEvent.EventUserId);
            model.EventId = tmpEvent.Id;

            //Participation fee
            model.ParticipationFee = (decimal)tmpEvent.ParticipationFee;

            //Get client logo            
            model.Logo = tmpEvent.ClientLogo;            

            //Replace default logo if configured
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

            //Shoot date
            model.ShootDate = ((DateTime)tmpEvent.ShootedOnUtc).ToString("yyyy-MM-dd");             

            //Reminder date
            model.ReminderDate = ((DateTime)tmpEvent.AcceptReminderDateUtc).ToString("yyyy-MM-dd"); 

            //Sender name
            model.SenderName = tmpStaffEventUser.FirstName + " " + tmpStaffEventUser.LastName;

            //Get customer events that did not answer
            var noAnswerCustomerEvents = _customerEventService.GetAllNoAnswerCustomerEventsForGroup(tmpEvent.Id, tmpStaffEventUser.Group);
            foreach (var tmpCustomerEvent in noAnswerCustomerEvents.Reverse())
            {
                model.CameleoEventUserList.Insert(0, new CameleoEventUserViewModel(_eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId), 0, 0));
            }

            //Get remaining event users that did not answer
            var noAnswerEventUsers = _eventUserService.GetNoAnswerEventUsers(tmpEvent.Id, tmpStaffEventUser.Group);
            foreach (var tmpEventUser in noAnswerEventUsers.Reverse())
            {
                model.CameleoEventUserList.Insert(0, new CameleoEventUserViewModel(tmpEventUser, 0, 0));
            }

            return model;
        }

        IDictionary<int, bool> GetSelectedEventUsers(FormCollection formCollection, bool forPreview)
        {
            var tmpSelectedList = new Dictionary<int, bool>();
            //Get selected subjects list
            var keys = formCollection.AllKeys.Where(c => c.StartsWith("checkBox_")).Select(c => c.Substring(9));

            //For preview?
            if (forPreview)
            {
                //Yes, take only one
                if (keys.Count() > 0)
                {
                    //At least one, keep first
                    int id;
                    if (Int32.TryParse(keys.First(), out id))
                    {
                        //Keep if checked or not
                        tmpSelectedList.Add(id, true);
                    }
                }
            }
            else
            {
                //Else, keep all selected
                foreach (var key in keys)
                {
                    int id;
                    if (Int32.TryParse(key, out id))
                    {
                        //Keep if checked or not
                        tmpSelectedList.Add(id, formCollection["checkBox_" + key].Equals("false") ? false : true);
                    }
                }
            }
            
            return tmpSelectedList;
        }

        #endregion

        #region EventList
        
        [Authorize]
        public ActionResult EventList()
        {
            //Get all events for this customer user 
            CameleoCustomerEventListViewModel customerEventListViewModel = _customerEventService.GetCustomerEventListViewModel(_workContext.CurrentCustomer.Id);

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CameleoEvents.cshtml", customerEventListViewModel);
        }       

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public ActionResult EventList(CameleoCustomerEventListViewModel model)
        {
            String Result = "";

            if (ModelState.IsValid)
            {
                //Find event user
                var tmpEventUser = _eventUserService.GetEventUserByUserName(model.NewCustomerEvent);
                if (tmpEventUser == null)
                {
                    //Not found
                    Result = _localizationService.GetResource("Plugins.Cameleo.CameleoEventUsers.NotFound");
                }
                else
                {
                    //Else found

                    //Check password
                    if (tmpEventUser.Password == model.Password)
                    {
                        //Password ok

                        //Check if already added
                        var tmpCustomerEvent = _customerEventService.GetCustomerEvent(tmpEventUser.Id, _workContext.CurrentCustomer.Id);
                        if (tmpCustomerEvent != null)
                        {
                            //Customer event already present
                            Result = _localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Exists");
                        }
                        else
                        {
                            // Else try to add it
                            try
                            {
                                _customerEventService.InsertCustomerEvent(tmpEventUser.Id, _workContext.CurrentCustomer.Id);                                

                                //Go to details
                                var tmpUser = _customerEventService.GetCustomerEvent(tmpEventUser.Id, _workContext.CurrentCustomer.Id);
                                if (tmpUser != null)
                                {
                                    Result = _localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.InsertSuccess");                                    
                                    return RedirectToRoute("CameleoEventDetails", new { customerEventId = tmpUser.Id });
                                }
                                else
                                {
                                    Result = _localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.InsertError");
                                }
                                
                            }
                            catch (Exception)
                            {
                                Result = _localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.InsertError");
                            }                            
                        }                        
                    }
                    else
                    {
                        //Else wrong password
                        Result = _localizationService.GetResource("Plugins.Cameleo.CameleoEventUsers.WrongPassword"); ;
                    }                    
                }
            }

            //Get all events for this customer user 
            CameleoCustomerEventListViewModel customerEventListViewModel = _customerEventService.GetCustomerEventListViewModel(_workContext.CurrentCustomer.Id);
            customerEventListViewModel.Result = Result;

            //Redisplay form
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CameleoEvents.cshtml", customerEventListViewModel);
        }
        #endregion        

        #region EventDetails

        [Authorize]
        public ActionResult EventDetails(int customerEventId)
        {
            //Get details for this customer event user 
            CameleoCustomerEventViewModel customerEventViewModel = _customerEventService.GetCustomerEventViewModel(customerEventId);
            ViewBag.CustomerEventId = customerEventId;

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CameleoEventDetails.cshtml", customerEventViewModel);            
        }

        [Authorize]
        public ActionResult PaymentInfo(int customerEventId)
        {
            //Get details for this customer event user 
            CameleoCustomerEventViewModel customerEventViewModel = _customerEventService.GetCustomerEventViewModel(customerEventId);            
            ViewBag.CustomerEventId = customerEventViewModel.Id;

            //Staff
            var tmpEventUser = _eventUserService.GetEventUserById(customerEventViewModel.EventUserId);            
            if (!(tmpEventUser == null))
            {
                if (tmpEventUser.isStaff)
                {
                    //Yes
                    //Go to event details
                    return EventDetails(customerEventId);
                }
            }
           
            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/PaymentInfo/PaymentInfo.cshtml", customerEventViewModel);
        }

        [Authorize]
        [ValidateAntiForgeryToken]        
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("accept")]
        public ActionResult Accept(CameleoCustomerEventViewModel model)
        {
            //Get customer event
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(model.Id);

            //Accept
            tmpCustomerEvent.Accepted = true;
            tmpCustomerEvent.AcceptedStatus = (int)AcceptedStatus.AcceptedPaid;

            //Staff user?
            var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
            bool isStaff = false;
            if (!(tmpEventUser == null))
            {
                if (tmpEventUser.isStaff)
                {
                    //Yes
                    //Don't make him pay
                    isStaff = true;
                    tmpCustomerEvent.Paid = true; 
                }
            }

            //Update customer event
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            //Model
            CameleoCustomerEventViewModel customerEventViewModel = _customerEventService.GetCustomerEventViewModel(model.Id);                           

            //Online payment and not staff?
            if (!isStaff && customerEventViewModel.CameleoEvent.OnlinePaymentEnabled)
            {
                //Add product to cart
                var product = _productService.GetProductBySku(CameleoEventProducts.PRODUCT_VIDEO_PROJECT);
                if (product == null)
                {
                    //Product not found
                    customerEventViewModel.Result = _localizationService.GetResource("plugins.cameleo.cameleocustomerevents.videoprojectproduct.notfound");
                }
                else
                {
                    //Add to cart
                    decimal configuredPrice = customerEventViewModel.CameleoEvent.ParticipationFee.HasValue ? customerEventViewModel.CameleoEvent.ParticipationFee.Value : product.Price;

                    var warnings = _shoppingCartService.AddToCart(_workContext.CurrentCustomer, product, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id, string.Empty, configuredPrice,  1, true);
                    if (warnings.Count == 0)
                    {
                        //Get last added cart item
                        var cart = _workContext.CurrentCustomer.ShoppingCartItems
                            .Where(sci => sci.ShoppingCartType == ShoppingCartType.ShoppingCart)
                            .Where(sci => sci.StoreId == _storeContext.CurrentStore.Id)
                            .OrderByDescending(sci => sci.CreatedOnUtc)
                            .ToList();
                        if (cart.Count > 0)
                        {
                            var tmpCartItem = cart[0];

                            //Keep customer event id
                            _genericAttributeService.SaveAttribute<int>(tmpCartItem, CameleoGenericAttributeNames.CameleoCustomerEvent + tmpCustomerEvent.Id, tmpCustomerEvent.Id, _storeContext.CurrentStore.Id);
                        }
                    }
                    else
                    {
                        //Error adding to cart
                        customerEventViewModel.Result = _localizationService.GetResource("plugins.cameleo.cameleocustomerevents.videoprojectproduct.adderror");
                        _logger.Error(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.videoprojectproduct.adderror") + " " + warnings.ToString());
                    }
                }

                if (string.IsNullOrEmpty(customerEventViewModel.Result))
                {
                    //No errors

                    //Redirect                    
                    return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/ImageUse.cshtml", customerEventViewModel); 
                }                
            }            

            //Else show payment page
            ViewBag.CustomerEventId = tmpCustomerEvent.Id;
            ViewBag.CustomerId = tmpCustomerEvent.CustomerId;

            if (isStaff)
            {
                //Yes  
                //Go to event details
                return EventDetails(tmpCustomerEvent.Id);
            }

            //Return view                     
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/PaymentInfo/PaymentInfo.cshtml", customerEventViewModel); 
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("refuse")]
        public ActionResult Refuse(CameleoCustomerEventViewModel model)
        {
            //Get customer event
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(model.Id);

            //Accept
            tmpCustomerEvent.Accepted = false;
            tmpCustomerEvent.AcceptedStatus = (int)AcceptedStatus.Refused;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            ViewBag.CustomerEventId = tmpCustomerEvent.Id;
            ViewBag.CustomerId = tmpCustomerEvent.CustomerId;

            //Return view
            CameleoCustomerEventViewModel customerEventViewModel = _customerEventService.GetCustomerEventViewModel(model.Id);
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CameleoEventDetails.cshtml", customerEventViewModel);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("acceptimageuse")]
        public ActionResult AcceptImageUse(CameleoCustomerEventViewModel model)
        {
            //Get customer event
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(model.Id);

            //Accept image use
            tmpCustomerEvent.AcceptedImageUse = true;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            ViewBag.CustomerEventId = tmpCustomerEvent.Id;
            ViewBag.CustomerId = tmpCustomerEvent.CustomerId;

            //Return view
            CameleoCustomerEventViewModel customerEventViewModel = _customerEventService.GetCustomerEventViewModel(model.Id);
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CameleoEventDetails.cshtml", customerEventViewModel);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("refuseimageuse")]
        public ActionResult RefuseImageUse(CameleoCustomerEventViewModel model)
        {
            //Get customer event
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(model.Id);

            //Refuse image use
            tmpCustomerEvent.AcceptedImageUse = false;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            ViewBag.CustomerEventId = tmpCustomerEvent.Id;
            ViewBag.CustomerId = tmpCustomerEvent.CustomerId;

            //Return view
            CameleoCustomerEventViewModel customerEventViewModel = _customerEventService.GetCustomerEventViewModel(model.Id);
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CameleoEventDetails.cshtml", customerEventViewModel);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("addnewevent")]
        public ActionResult AddNewEvent(CameleoCustomerEventViewModel model)
        {            
            //Return to event list            
            return RedirectToAction("EventList");
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("addname")]
        public ActionResult AddName(CameleoCustomerEventViewModel model)
        {
            //Get event user
            var tmpEventUser = _eventUserService.GetEventUserById(model.CameleoEventUser.Id);

            //Update first name last name and group
            tmpEventUser.FirstName = model.CameleoEventUser.FirstName;
            tmpEventUser.LastName = model.CameleoEventUser.LastName;
            tmpEventUser.Group = model.CameleoEventUser.Group;
            _eventUserService.UpdateEventUser(tmpEventUser);  

            //Return view
            CameleoCustomerEventViewModel customerEventViewModel = _customerEventService.GetCustomerEventViewModel(model.Id);

            ViewBag.CustomerEventId = customerEventViewModel.Id;
            ViewBag.CustomerId = customerEventViewModel.CustomerId;

            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CameleoEventDetails.cshtml", customerEventViewModel);
        }

        #endregion

        #region GroupDetails
        [Authorize]
        public ActionResult GroupDetails(int customerEventId)
        {           
            //Get details for this event
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(customerEventId);
            var tmpEvent = _eventService.GetEventByEventUserId(tmpCustomerEvent.EventUserId);
            var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
            CameleoEventViewModel eventViewModel = new CameleoEventViewModel(tmpEvent, _eventService.GetAllGroupsForEvent(tmpEvent.Id), _localizationService.GetResource(CameleoEventStatusStrings.LocalizedStringValues[tmpEvent.Status]));                
            
            //Find group to show details
            foreach (var tmpGroup in eventViewModel.Groups)
            {
                if (tmpGroup.Text == tmpEventUser.Group)
                {
                    eventViewModel.GroupDetails = tmpGroup;
                }
            }
            eventViewModel.DetailedGroupName = tmpEventUser.Group;
            eventViewModel.ShowGroupDetails = true;

            eventViewModel.CustomerEventId = customerEventId;
            ViewBag.CustomerEventId = customerEventId;
            ViewBag.CustomerId = tmpCustomerEvent.CustomerId;

            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/GroupDetails/GroupDetails.cshtml", eventViewModel);
        }
        #endregion

        #region CustomerEventList

        [Authorize]
        [ChildActionOnly]
        public ActionResult CustomerEventList(int eventId, string groupName)
        {
            //Get all customer events for this group and event
            CameleoCustomerEventListViewModel customerEventListViewModel = _customerEventService.GetCustomerEventListViewModel(eventId, groupName);
            CameleoEventViewModel eventViewModel = _eventService.GetEventViewModel(eventId);

            //Get remaining event users that did not answer
            var noAnswerEventUsers = _eventUserService.GetNoAnswerEventUsers(eventId, groupName);
            foreach (var tmpEventUser in noAnswerEventUsers.Reverse())
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
                customerEventListViewModel.CameleoCustomerEventList.Insert(0, tmpCustomerEvent);
            }

            //Return view
            return PartialView("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/GroupDetails/CustomerEventList.cshtml", customerEventListViewModel);
        }
        #endregion

        #region Reminders

        [Authorize]
        public ActionResult CreateReminder(int customerEventId)
        {           
            var model = BuildCustomerEventReminderListViewModel(customerEventId);           
            ViewBag.CustomerEventId = customerEventId;            
            
            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventReminder/EventReminder.cshtml", model);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("CreateReminder")]
        [FormValueRequired("preview")]
        public ActionResult ReminderPreview(CustomerEventReminderListViewModel model, FormCollection formCollection)
        {
            var tmpModel = BuildCustomerEventReminderListViewModel(model.StaffCustomerEventId);

            //Get selected subjects list
            tmpModel.SelectedEventUserList = GetSelectedEventUsers(formCollection, true);            
            
            //Shoot date as modified by user
            tmpModel.ShootDate = model.ShootDate;

            //Reminder date  as modified by user
            tmpModel.ReminderDate = model.ReminderDate;

            //Sender name  as modified by user
            tmpModel.SenderName = model.SenderName;

            //Sender role  as modified by user
            tmpModel.SenderRole = model.SenderRole;

            //Topic
            tmpModel.TopicToUse = "CameleoEventReminderWithoutCoupon";

            //Page size
            tmpModel.PageSize = Rotativa.Options.Size.Letter;

            //Return view as pdf
            tmpModel.showPreview = true;
            ViewBag.CustomerEventId = model.StaffCustomerEventId;
            return new ViewAsPdf("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventReminder/EventReminderPDF.cshtml", tmpModel) 
            {
                PageSize = tmpModel.PageSize                
            };            
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("CreateReminder")]
        [FormValueRequired("generate")]
        public ActionResult ReminderAll(CustomerEventReminderListViewModel model, FormCollection formCollection)
        {
            var tmpModel = BuildCustomerEventReminderListViewModel(model.StaffCustomerEventId);

            //Get selected subjects list
            tmpModel.SelectedEventUserList = GetSelectedEventUsers(formCollection, false);

            //Shoot date as modified by user
            tmpModel.ShootDate = model.ShootDate;

            //Reminder date  as modified by user
            tmpModel.ReminderDate = model.ReminderDate;

            //Sender name  as modified by user
            tmpModel.SenderName = model.SenderName;

            //Sender role  as modified by user
            tmpModel.SenderRole = model.SenderRole;

            //Topic
            tmpModel.TopicToUse = "CameleoEventReminderWithoutCoupon";

            //Page size
            tmpModel.PageSize = Rotativa.Options.Size.Letter;

            //Return view as pdf
            tmpModel.showAllReminders = true;
            ViewBag.CustomerEventId = model.StaffCustomerEventId;
            return new ViewAsPdf("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventReminder/EventReminderPDF.cshtml", tmpModel)
            {
                PageSize = tmpModel.PageSize
            };
        }

        #endregion

        #region ReOrder
        [Authorize]
        public ActionResult ReOrder(int orderId)
        {
            var order = _orderService.GetOrderById(orderId);
            if (order == null || order.Deleted || _workContext.CurrentCustomer.Id != order.CustomerId)
            {
                return new HttpUnauthorizedResult();
            }

            //For each item in order
            foreach (var orderItem in order.OrderItems)
            {
                //Add to cart
                _shoppingCartService.AddToCart(orderItem.Order.Customer, orderItem.Product,
                    ShoppingCartType.ShoppingCart, orderItem.Order.StoreId, orderItem.AttributesXml,
                    orderItem.UnitPriceExclTax, orderItem.Quantity, false);

                //Video participation product ?
                if (orderItem.Product.Sku == CameleoEventProducts.PRODUCT_VIDEO_PROJECT)
                {
                    //Yes
                    //Get last added cart item
                    var cart = _workContext.CurrentCustomer.ShoppingCartItems
                        .Where(sci => sci.ShoppingCartType == ShoppingCartType.ShoppingCart)
                        .Where(sci => sci.StoreId == _storeContext.CurrentStore.Id)
                        .OrderByDescending(sci => sci.CreatedOnUtc)
                        .ToList();
                    if (cart.Count > 0)
                    {
                        var tmpCartItem = cart[0];

                        //Keep customer event id
                        var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromOrder(order.Id);
                        foreach (var tmpCustomerEvent in tmpCustomerEvents)
                        {
                            _genericAttributeService.SaveAttribute<int>(tmpCartItem, CameleoGenericAttributeNames.CameleoCustomerEvent + tmpCustomerEvent.Id, tmpCustomerEvent.Id, _storeContext.CurrentStore.Id);    
                        }                        
                    }
                }                
            }

            return RedirectToRoute("ShoppingCart");
        }
        #endregion

        #region ImageUse
        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("acceptimageuse2")]
        public ActionResult AcceptImageUse2(CameleoCustomerEventViewModel model)
        {
            //Get customer event
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(model.Id);

            //Accept image use
            tmpCustomerEvent.AcceptedImageUse = true;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            //Redirect to cart
            return RedirectToRoute("ShoppingCart");
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [HttpPost, ActionName("EventDetails")]
        [FormValueRequired("refuseimageuse2")]
        public ActionResult RefuseImageUse2(CameleoCustomerEventViewModel model)
        {
            //Get customer event
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(model.Id);

            //Refuse image use
            tmpCustomerEvent.AcceptedImageUse = false;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            //Redirect to cart
            return RedirectToRoute("ShoppingCart");
        }
        #endregion

        #region Misc
        [Authorize]
        public ActionResult CustomerEventSubjectNameForCart(int shoppingCartId)
        {
            CustomerEventSubjectNameListViewModel customerEventSubjectNameListViewModel = new CustomerEventSubjectNameListViewModel();

            //Get customer events related to shopping cart if any
            var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromShoppingCart(_workContext.CurrentCustomer.ShoppingCartItems, shoppingCartId);

            //For each event user
            foreach (var tmpCustomerEvent in tmpCustomerEvents)
            {
                //Customer event found

                //Get event user
                var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
                var tmpModel = new CustomerEventSubjectNameViewModel();
                tmpModel.FirstName = tmpEventUser.FirstName;
                tmpModel.LastName = tmpEventUser.LastName;
                tmpModel.Group = tmpEventUser.Group;
                customerEventSubjectNameListViewModel.CameleoEventSubjectNameList.Add(tmpModel);
            }            
            
            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CustomerEventSubjectName.cshtml", customerEventSubjectNameListViewModel);
        }

        [Authorize]
        public ActionResult CustomerEventSubjectNameForOrder(int orderId)
        {
            //Model
            CustomerEventSubjectNameListViewModel customerEventSubjectNameListViewModel = new CustomerEventSubjectNameListViewModel();

            //Get customer events related to order if any
            var tmpCustomerEvents = _customerEventService.GetCustomerEventsFromOrder(orderId);

            //For each event user
            foreach (var tmpCustomerEvent in tmpCustomerEvents)
            {
                //Customer event found

                //Get event user
                var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
                var tmpModel = new CustomerEventSubjectNameViewModel();
                tmpModel.FirstName = tmpEventUser.FirstName;
                tmpModel.LastName = tmpEventUser.LastName;
                tmpModel.Group = tmpEventUser.Group;
                customerEventSubjectNameListViewModel.CameleoEventSubjectNameList.Add(tmpModel);
            }

            //Return view
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/CustomerEvent/CustomerEventSubjectName.cshtml", customerEventSubjectNameListViewModel);
        }
        #endregion
    }
}