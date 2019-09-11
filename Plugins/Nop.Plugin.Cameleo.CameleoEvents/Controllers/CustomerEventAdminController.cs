using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nop.Core;
using Nop.Core.Domain.Orders;
using Nop.Web.Framework.Controllers;
using Nop.Services.Localization;
using Nop.Services.Security;
using Nop.Services.Customers;
using Nop.Services.Orders;
using Nop.Services.Catalog;
using Nop.Services.Logging;
using Nop.Services.Common;
using Nop.Plugin.Cameleo.CameleoEvents.Services;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Admin.Controllers;
using Nop.Web.Framework.Kendoui;
using Nop.Web.Framework.Mvc;
using Nop.Web.Themes.CameleoVideoTheme.Domain;

namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class CustomerEventAdminController : BaseAdminController
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
        private readonly ILogger _logger;
        private readonly IGenericAttributeService _genericAttributeService;
        #endregion

        #region Ctor
        public CustomerEventAdminController(IWorkContext workContext, ICameleoCustomerEventService customerEventService, ICameleoEventService eventService,
                ICameleoEventUserService eventUserService, IPermissionService permissionService, ILocalizationService localizationService,
                ICustomerService customerService, IShoppingCartService shoppingCartService, IProductService productService, IStoreContext storeContext,
                ILogger logger, IGenericAttributeService genericAttributeService)
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
            _logger = logger;
            _genericAttributeService = genericAttributeService;
        }
        #endregion   

        #region Utilities
       
        

        #endregion

        #region CustomerEventList

        [AdminAuthorize, ChildActionOnly]
        public ActionResult CustomerEventList(int eventId, string groupName)
        {            
            ViewBag.EventId = eventId;
            ViewBag.GroupName = groupName;

            //Return view         
            return PartialView("~/Plugins/Cameleo.CameleoEvents/Views/Admin/CustomerEvent/CustomerEventList.cshtml");

        }

        [HttpPost, AdminAuthorize]        
        public ActionResult CustomerEventListJson(int eventId, string groupName, DataSourceRequest command)
        {
            CameleoCustomerEventListViewModel customerEventListViewModel = _customerEventService.GetCustomerEventListViewModel(eventId, groupName);

            var model = new DataSourceResult
            {
                Data = customerEventListViewModel.CameleoCustomerEventList,
                Total = customerEventListViewModel.CameleoCustomerEventList.Count
            };

            return Json(model);
        }        

        #endregion

        #region AddNewCustomerEvent
        
        [AdminAuthorize]
        public ActionResult AddCustomerEventPopup(int eventId, string groupName)
        {
            var model = new AddCustomerEventViewModel();

            //Event            
            model.CameleoEvent = _eventService.GetEventViewModel(eventId);

            //Get user events for this group            
            model.CameleoEventUserList = _eventUserService.GetEventUserListViewModel(eventId, groupName);

            //Get customer events for this group            
            model.CameleoCustomerEventList = _customerEventService.GetCustomerEventListViewModel(eventId, groupName);

            //Group name
            model.GroupName = groupName;

            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/CustomerEvent/AddCustomerEventPopup.cshtml", model);
        }

        [AdminAuthorize]
        [HttpPost]
        public ActionResult AddCustomerEventPopup(string btnId, string formId, AddCustomerEventViewModel model)
        {
            //Event            
            model.CameleoEvent = _eventService.GetEventViewModel(model.CameleoEvent.Id);

            //Get user events for this group            
            model.CameleoEventUserList = _eventUserService.GetEventUserListViewModel(model.CameleoEvent.Id, model.GroupName);

            //Get customer events for this group            
            model.CameleoCustomerEventList = _customerEventService.GetCustomerEventListViewModel(model.CameleoEvent.Id, model.GroupName);

            ModelState.Clear();

            var tmpCustomer = _customerService.GetCustomerByUsername(model.AddedCustomerEventUserName);
            if (tmpCustomer == null)
            { 
                //No customer found with the specified username                
                ModelState.AddModelError("", _localizationService.GetResource("Nop.Plugin.Cameleo.CameleoEvents.Views.Admin.AddCustomerEventPopup.UnknownCustomer"));
            }

            if (ModelState.IsValid)
            {
                //Event user already there for this customer?
                if (_customerEventService.GetCustomerEvent(model.AddedEventUserId, tmpCustomer.Id) != null)
                {
                    //Yes,display message
                    ModelState.AddModelError("", _localizationService.GetResource("Nop.Plugin.Cameleo.CameleoEvents.Views.Admin.AddCustomerEventPopup.CustomerEventExists"));                    
                }                               
            }

            if (ModelState.IsValid)
            {                
                //Everything is fine
                //Add the customer event
                _customerEventService.InsertCustomerEvent(model.AddedEventUserId, tmpCustomer.Id, model.AddedAcceptedStatus, model.AddedAcceptedImageUse);

                //Close popup and refresh list
                ViewBag.RefreshPage = true;
                ViewBag.btnId = btnId;
                ViewBag.formId = formId;
                return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/CustomerEvent/AddCustomerEventPopup.cshtml", model);
            }

            //If we got this far, something failed, redisplay form
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/CustomerEvent/AddCustomerEventPopup.cshtml", model);
        }
        #endregion

        #region AddAllCustomerEvents

        [AdminAuthorize]
        public ActionResult AddAllCustomerEventsPopup(int eventId, string groupName)
        {
            var model = new AddCustomerEventViewModel();

            //Event            
            model.CameleoEvent = _eventService.GetEventViewModel(eventId);

            ////Get event users for this group            
            //model.CameleoEventUserList = _eventUserService.GetEventUserListViewModel(eventId, groupName);

            ////Get customer events for this group            
            //model.CameleoCustomerEventList = _customerEventService.GetCustomerEventListViewModel(eventId, groupName);

            //Group name
            model.GroupName = groupName;

            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/CustomerEvent/AddAllCustomerEventsPopup.cshtml", model);
        }

        [AdminAuthorize]
        [HttpPost]
        public ActionResult AddAllCustomerEventsPopup(string btnId, string formId, AddCustomerEventViewModel model)
        {
            //Event            
            model.CameleoEvent = _eventService.GetEventViewModel(model.CameleoEvent.Id);

            //Get event users for this group            
            model.CameleoEventUserList = _eventUserService.GetEventUserListViewModel(model.CameleoEvent.Id, model.GroupName);

            //Get customer events for this group            
            model.CameleoCustomerEventList = _customerEventService.GetCustomerEventListViewModel(model.CameleoEvent.Id, model.GroupName);

            ModelState.Clear();

            var tmpCustomer = _customerService.GetCustomerByUsername(model.CameleoEvent.EventCode);
            if (tmpCustomer == null)
            {
                //No customer found with the specified username                
                ModelState.AddModelError("", _localizationService.GetResource("Nop.Plugin.Cameleo.CameleoEvents.Views.Admin.AddCustomerEventPopup.UnknownCustomer"));
            }

            if (ModelState.IsValid)
            {
                //for all event users
                foreach (var tmpEventUser  in model.CameleoEventUserList.CameleoEventUserList)
                {
                    //Event user already there for this customer?
                    if (_customerEventService.GetCustomerEvent(tmpEventUser.Id, tmpCustomer.Id) == null)
                    {
                        //No, add it                        
                        _customerEventService.InsertCustomerEvent(tmpEventUser.Id, tmpCustomer.Id, (int)AcceptedStatus.AcceptedPaid, false, true);
                    }
                }                
            }

            if (ModelState.IsValid)
            {
                //Close popup and refresh list
                ViewBag.RefreshPage = true;
                ViewBag.btnId = btnId;
                ViewBag.formId = formId;
                return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/CustomerEvent/AddAllCustomerEventsPopup.cshtml", model);
            }

            //If we got this far, something failed, redisplay form
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/CustomerEvent/AddAllCustomerEventsPopup.cshtml", model);
        }
        #endregion
        
        #region DeleteCustomerEvent

        [AdminAuthorize]        
        public ActionResult CustomerEventDelete(int Id)
        {
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(Id);            
            if (tmpCustomerEvent == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Delete.NotFound"));
            }

            var tmpEvent = _eventService.GetEventByEventUserId(tmpCustomerEvent.EventUserId);
            var tmpEvenTuser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);

            //Delete Customer event            
            _customerEventService.DeleteCustomerEvent(tmpCustomerEvent);

            // Refresh view
            return new NullJsonResult();
        }
        #endregion

        #region ClearShoppingCart
        [AdminAuthorize]        
        public ActionResult ClearShoppingCart(int customerEventId)
        {
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(customerEventId);
            if (tmpCustomerEvent == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Delete.NotFound"));
            }

            var tmpCustomer = _customerService.GetCustomerById(tmpCustomerEvent.CustomerId);
            if (tmpCustomer == null)
            {
                //Customer not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.ClearShoppingCart.NotFound"));
            }

            //clear cart
            foreach (var sci in tmpCustomer.ShoppingCartItems.ToList())
            {
                _shoppingCartService.DeleteShoppingCartItem(sci);
            }

            // Refresh view
            return new NullJsonResult();      
        }
        #endregion

        #region UpdateCustomerEvent

        [AdminAuthorize]        
        public ActionResult CustomerEventUpdate(CameleoCustomerEventViewModel model)
        {
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(model.Id);
            if (tmpCustomerEvent == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Delete.NotFound"));
            }

            //Update Customer event            
            if (model.AcceptedStatus == (int)AcceptedStatus.ToBeCompleted || model.AcceptedStatus == (int)AcceptedStatus.Refused)
            {
                tmpCustomerEvent.Accepted = false;
            }
            else
            {
                tmpCustomerEvent.Accepted = true;
            }
            tmpCustomerEvent.AcceptedStatus = model.AcceptedStatus;
            tmpCustomerEvent.AcceptedImageUse = model.AcceptedImageUse;
            tmpCustomerEvent.Paid = model.Paid;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            //Update EventUser
            var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
            tmpEventUser.isStaff = model.CameleoEventUser.isStaff;
            _eventUserService.UpdateEventUser(tmpEventUser);
            
            // Refresh view
            return new NullJsonResult();
        }

        [AdminAuthorize]
        public ActionResult SetPaid(int customerEventId)
        {
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(customerEventId);
            if (tmpCustomerEvent == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Delete.NotFound"));
            }
            
            //Set customer event to paid
            tmpCustomerEvent.Paid = true;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            // Refresh view
            return new NullJsonResult();
        }

        [AdminAuthorize]
        public ActionResult SetUnpaid(int customerEventId)
        {
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(customerEventId);
            if (tmpCustomerEvent == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Delete.NotFound"));
            }

            //Set customer event to unpaid
            tmpCustomerEvent.Paid = false;
            _customerEventService.UpdateCustomerEvent(tmpCustomerEvent);

            // Refresh view
            return new NullJsonResult();
        }

        [AdminAuthorize]
        public ActionResult AddShoppingCartItem(int customerEventId)
        {
            var tmpCustomerEvent = _customerEventService.GetCustomerEventById(customerEventId);
            if (tmpCustomerEvent == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Delete.NotFound"));
            }

            var tmpEvenUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);
            if (tmpEvenUser == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.EventUser.NotFound"));
            }

            var tmpEvent = _eventService.GetEventById(tmpEvenUser.EventId);
            if (tmpEvent == null)
            {
                //Customer event not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.Event.NotFound"));
            }

            var tmpCustomer = _customerService.GetCustomerById(tmpCustomerEvent.CustomerId);
            if (tmpCustomer == null)
            {
                //Customer not found
                throw new ArgumentException(_localizationService.GetResource("Plugins.Cameleo.CameleoCustomerEvents.AddShoppingCartItem.NotFound"));
            }

            //Add product to cart
            var product = _productService.GetProductBySku(CameleoEventProducts.PRODUCT_VIDEO_PROJECT);
            if (product == null)
            {
                //Product not found
                throw new ArgumentException(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.videoprojectproduct.notfound"));                
            }

            //Add to cart
            decimal configuredPrice = tmpEvent.ParticipationFee.HasValue ? tmpEvent.ParticipationFee.Value : product.Price;

            var warnings = _shoppingCartService.AddToCart(tmpCustomer, product, ShoppingCartType.ShoppingCart, _storeContext.CurrentStore.Id, string.Empty, configuredPrice, 1, true);
            if (warnings.Count == 0)
            {
                //Get last added cart item
                var cart = tmpCustomer.ShoppingCartItems
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
                _logger.Error(_localizationService.GetResource("plugins.cameleo.cameleocustomerevents.videoprojectproduct.adderror") + " " + warnings.ToString());
            }

            // Refresh view
            return new NullJsonResult();
        }
        #endregion

        #region RecentRegistrations
        [AdminAuthorize]
        public ActionResult RecentRegistrations()
        {            
            ////Return view            
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/RecentRegistrations/RecentRegistrations.cshtml");            
        }

        [HttpPost, AdminAuthorize]
        public ActionResult RecentRegistrationsJson(DataSourceRequest command)
        {
            var eventModel = _customerEventService.GetRecentRegistrationListViewModel(command.Page-1, command.PageSize);

            var gridModel = new DataSourceResult
            {
                Data = eventModel.RecentRegistrationList,
                Total = eventModel.TotalCount
            };

            return Json(gridModel);
        }
        #endregion
    }
}