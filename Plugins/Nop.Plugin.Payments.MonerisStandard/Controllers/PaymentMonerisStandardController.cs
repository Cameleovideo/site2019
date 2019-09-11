using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Nop.Core;
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Payments;
using Nop.Plugin.Payments.MonerisStandard.Models;
using Nop.Services.Configuration;
using Nop.Services.Logging;
using Nop.Services.Orders;
using Nop.Services.Payments;
using Nop.Services.Stores;
using Nop.Web.Framework.Controllers;

namespace Nop.Plugin.Payments.MonerisStandard.Controllers
{
    public class PaymentMonerisStandardController : BasePaymentController
    {
        #region Fields
        private readonly IWorkContext _workContext;
        private readonly IStoreService _storeService;
        private readonly ISettingService _settingService;
        private readonly IPaymentService _paymentService;
        private readonly IOrderService _orderService;
        private readonly IOrderProcessingService _orderProcessingService;
        private readonly IStoreContext _storeContext;
        private readonly ILogger _logger;
        private readonly IWebHelper _webHelper;
        private readonly PaymentSettings _paymentSettings;
        private readonly MonerisStandardPaymentSettings _monerisStandardPaymentSettings;
        #endregion

        #region Ctor
        public PaymentMonerisStandardController(IWorkContext workContext, IStoreService storeService, ISettingService settingService, IPaymentService paymentService, 
            IOrderService orderService, IOrderProcessingService orderProcessingService, IStoreContext storeContext,ILogger logger, IWebHelper webHelper,
            PaymentSettings paymentSettings, MonerisStandardPaymentSettings monerisStandardPaymentSettings)
        {
            this._workContext = workContext;
            this._storeService = storeService;
            this._settingService = settingService;
            this._paymentService = paymentService;
            this._orderService = orderService;
            this._orderProcessingService = orderProcessingService;
            this._storeContext = storeContext;
            this._logger = logger;
            this._webHelper = webHelper;
            this._paymentSettings = paymentSettings;
            this._monerisStandardPaymentSettings = monerisStandardPaymentSettings;
        }
        #endregion

        #region Utilities
        [NonAction]
        public override IList<string> ValidatePaymentForm(FormCollection form)
        {
            var warnings = new List<string>();
            return warnings;
        }

        [NonAction]
        public override ProcessPaymentRequest GetPaymentInfo(FormCollection form)
        {
            var paymentInfo = new ProcessPaymentRequest();
            return paymentInfo;
        }
        #endregion

        #region Configure
        [AdminAuthorize]
        [ChildActionOnly]
        public ActionResult Configure()
        {
            //load settings for a chosen store scope
            var storeScope = this.GetActiveStoreScopeConfiguration(_storeService, _workContext);
            var monerisStandardPaymentSettings = _settingService.LoadSetting<MonerisStandardPaymentSettings>(storeScope);

            var model = new ConfigurationModel();
            model.UseSandbox = monerisStandardPaymentSettings.UseSandbox;
            model.StoreId = monerisStandardPaymentSettings.StoreId;
            model.PdtToken = monerisStandardPaymentSettings.PdtToken;
            model.PdtValidateOrderTotal = monerisStandardPaymentSettings.PdtValidateOrderTotal;            
            model.PassProductNamesAndTotals = monerisStandardPaymentSettings.PassProductNamesAndTotals;            
            model.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage = monerisStandardPaymentSettings.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage;

            model.ActiveStoreScopeConfiguration = storeScope;
            if (storeScope > 0)
            {
                model.UseSandbox_OverrideForStore = _settingService.SettingExists(monerisStandardPaymentSettings, x => x.UseSandbox, storeScope);
                model.StoreId_OverrideForStore = _settingService.SettingExists(monerisStandardPaymentSettings, x => x.StoreId, storeScope);
                model.PdtToken_OverrideForStore = _settingService.SettingExists(monerisStandardPaymentSettings, x => x.PdtToken, storeScope);
                model.PdtValidateOrderTotal_OverrideForStore = _settingService.SettingExists(monerisStandardPaymentSettings, x => x.PdtValidateOrderTotal, storeScope);                
                model.PassProductNamesAndTotals_OverrideForStore = _settingService.SettingExists(monerisStandardPaymentSettings, x => x.PassProductNamesAndTotals, storeScope);                
                model.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage_OverrideForStore = _settingService.SettingExists(monerisStandardPaymentSettings, x => x.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage, storeScope);
            }

            return View("~/Plugins/Payments.MonerisStandard/Views/PaymentMonerisStandard/Configure.cshtml", model);
        }

        [HttpPost]
        [AdminAuthorize]
        [ChildActionOnly]
        public ActionResult Configure(ConfigurationModel model)
        {
            if (!ModelState.IsValid)
                return Configure();

            //load settings for a chosen store scope
            var storeScope = this.GetActiveStoreScopeConfiguration(_storeService, _workContext);
            var monerisStandardPaymentSettings = _settingService.LoadSetting<MonerisStandardPaymentSettings>(storeScope);

            //save settings
            monerisStandardPaymentSettings.UseSandbox = model.UseSandbox;
            monerisStandardPaymentSettings.StoreId = model.StoreId;
            monerisStandardPaymentSettings.PdtToken = model.PdtToken;
            monerisStandardPaymentSettings.PdtValidateOrderTotal = model.PdtValidateOrderTotal;            
            monerisStandardPaymentSettings.PassProductNamesAndTotals = model.PassProductNamesAndTotals;            
            monerisStandardPaymentSettings.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage = model.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage;

            /* We do not clear cache after each setting update.
             * This behavior can increase performance because cached settings will not be cleared 
             * and loaded from database after each update */
            if (model.UseSandbox_OverrideForStore || storeScope == 0)
                _settingService.SaveSetting(monerisStandardPaymentSettings, x => x.UseSandbox, storeScope, false);
            else if (storeScope > 0)
                _settingService.DeleteSetting(monerisStandardPaymentSettings, x => x.UseSandbox, storeScope);

            if (model.StoreId_OverrideForStore || storeScope == 0)
                _settingService.SaveSetting(monerisStandardPaymentSettings, x => x.StoreId, storeScope, false);
            else if (storeScope > 0)
                _settingService.DeleteSetting(monerisStandardPaymentSettings, x => x.StoreId, storeScope);

            if (model.PdtToken_OverrideForStore || storeScope == 0)
                _settingService.SaveSetting(monerisStandardPaymentSettings, x => x.PdtToken, storeScope, false);
            else if (storeScope > 0)
                _settingService.DeleteSetting(monerisStandardPaymentSettings, x => x.PdtToken, storeScope);

            if (model.PdtValidateOrderTotal_OverrideForStore || storeScope == 0)
                _settingService.SaveSetting(monerisStandardPaymentSettings, x => x.PdtValidateOrderTotal, storeScope, false);
            else if (storeScope > 0)
                _settingService.DeleteSetting(monerisStandardPaymentSettings, x => x.PdtValidateOrderTotal, storeScope);

            if (model.PassProductNamesAndTotals_OverrideForStore || storeScope == 0)
                _settingService.SaveSetting(monerisStandardPaymentSettings, x => x.PassProductNamesAndTotals, storeScope, false);
            else if (storeScope > 0)
                _settingService.DeleteSetting(monerisStandardPaymentSettings, x => x.PassProductNamesAndTotals, storeScope);
                        
            if (model.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage_OverrideForStore || storeScope == 0)
                _settingService.SaveSetting(monerisStandardPaymentSettings, x => x.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage, storeScope, false);
            else if (storeScope > 0)
                _settingService.DeleteSetting(monerisStandardPaymentSettings, x => x.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage, storeScope);

            //now clear settings cache
            _settingService.ClearCache();

            return Configure();
        }
        #endregion

        #region PaymentInfo
        [ChildActionOnly]
        public ActionResult PaymentInfo()
        {
            return View("~/Plugins/Payments.MonerisStandard/Views/PaymentMonerisStandard/PaymentInfo.cshtml");
        }
        #endregion

        #region PDTHandler
        [Authorize]
        [ValidateInput(false)]
        public ActionResult PDTHandler(FormCollection form)
        {
            //TODO
            /*string tx = _webHelper.QueryString<string>("tx");
            Dictionary<string, string> values;
            string response;

            var processor = _paymentService.LoadPaymentMethodBySystemName("Payments.MonerisStandard") as MonerisStandardPaymentProcessor;
            if (processor == null ||
                !processor.IsPaymentMethodActive(_paymentSettings) || !processor.PluginDescriptor.Installed)
                throw new NopException("Moneris Standard module cannot be loaded");

            if (processor.GetPDTDetails(tx, out values, out response))
            {
                string orderNumber = string.Empty;
                values.TryGetValue("custom", out orderNumber);
                Guid orderNumberGuid = Guid.Empty;
                try
                {
                    orderNumberGuid = new Guid(orderNumber);
                }
                catch { }
                Order order = _orderService.GetOrderByGuid(orderNumberGuid);
                if (order != null)
                {
                    decimal total = decimal.Zero;
                    try
                    {
                        total = decimal.Parse(values["mc_gross"], new CultureInfo("en-US"));
                    }
                    catch (Exception exc)
                    {
                        _logger.Error("Moneris PDT. Error getting mc_gross", exc);
                    }

                    string payer_status = string.Empty;
                    values.TryGetValue("payer_status", out payer_status);
                    string payment_status = string.Empty;
                    values.TryGetValue("payment_status", out payment_status);
                    string pending_reason = string.Empty;
                    values.TryGetValue("pending_reason", out pending_reason);
                    string mc_currency = string.Empty;
                    values.TryGetValue("mc_currency", out mc_currency);
                    string txn_id = string.Empty;
                    values.TryGetValue("txn_id", out txn_id);
                    string payment_type = string.Empty;
                    values.TryGetValue("payment_type", out payment_type);
                    string payer_id = string.Empty;
                    values.TryGetValue("payer_id", out payer_id);
                    string receiver_id = string.Empty;
                    values.TryGetValue("receiver_id", out receiver_id);
                    string invoice = string.Empty;
                    values.TryGetValue("invoice", out invoice);
                    string payment_fee = string.Empty;
                    values.TryGetValue("payment_fee", out payment_fee);

                    var sb = new StringBuilder();
                    sb.AppendLine("Moneris PDT:");
                    sb.AppendLine("total: " + total);
                    sb.AppendLine("Payer status: " + payer_status);
                    sb.AppendLine("Payment status: " + payment_status);
                    sb.AppendLine("Pending reason: " + pending_reason);
                    sb.AppendLine("mc_currency: " + mc_currency);
                    sb.AppendLine("txn_id: " + txn_id);
                    sb.AppendLine("payment_type: " + payment_type);
                    sb.AppendLine("payer_id: " + payer_id);
                    sb.AppendLine("receiver_id: " + receiver_id);
                    sb.AppendLine("invoice: " + invoice);
                    sb.AppendLine("payment_fee: " + payment_fee);


                    //order note
                    order.OrderNotes.Add(new OrderNote()
                    {
                        Note = sb.ToString(),
                        DisplayToCustomer = false,
                        CreatedOnUtc = DateTime.UtcNow
                    });
                    _orderService.UpdateOrder(order);

                    //load settings for a chosen store scope
                    var storeScope = this.GetActiveStoreScopeConfiguration(_storeService, _workContext);
                    var monerisStandardPaymentSettings = _settingService.LoadSetting<MonerisStandardPaymentSettings>(storeScope);

                    //validate order total
                    if (monerisStandardPaymentSettings.PdtValidateOrderTotal && !Math.Round(total, 2).Equals(Math.Round(order.OrderTotal, 2)))
                    {
                        string errorStr = string.Format("Moneris PDT. Returned order total {0} doesn't equal order total {1}", total, order.OrderTotal);
                        _logger.Error(errorStr);

                        return RedirectToAction("Index", "Home", new { area = "" });
                    }

                    //mark order as paid
                    if (_orderProcessingService.CanMarkOrderAsPaid(order))
                    {
                        order.AuthorizationTransactionId = txn_id;
                        _orderService.UpdateOrder(order);

                        _orderProcessingService.MarkOrderAsPaid(order);
                    }
                }

                return RedirectToRoute("CheckoutCompleted", new { orderId = order.Id});
            }
            else
            {
                string orderNumber = string.Empty;
                values.TryGetValue("custom", out orderNumber);
                Guid orderNumberGuid = Guid.Empty;
                try
                {
                    orderNumberGuid = new Guid(orderNumber);
                }
                catch { }
                Order order = _orderService.GetOrderByGuid(orderNumberGuid);
                if (order != null)
                {
                    //order note
                    order.OrderNotes.Add(new OrderNote()
                    {
                        Note = "Moneris PDT failed. " + response,
                        DisplayToCustomer = false,
                        CreatedOnUtc = DateTime.UtcNow
                    });
                    _orderService.UpdateOrder(order);
                }
                return RedirectToAction("Index", "Home", new { area = "" });
            }*/

            if (_monerisStandardPaymentSettings.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage)
            {
                var order = _orderService.SearchOrders(storeId: _storeContext.CurrentStore.Id,
                    customerId: _workContext.CurrentCustomer.Id, pageSize: 1)
                    .FirstOrDefault();
                if (order != null)
                {
                    //TODO
                    //_orderProcessingService.MarkOrderAsPaid(order);
                    return RedirectToRoute("OrderDetails", new { orderId = order.Id });
                }
            }

            return RedirectToAction("Index", "Home", new { area = "" });
        }
        #endregion

        #region CancelOrder
        [Authorize]
        public ActionResult CancelOrder(FormCollection form)
        {
            if (_monerisStandardPaymentSettings.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage)
            {
                var order = _orderService.SearchOrders(storeId: _storeContext.CurrentStore.Id,
                    customerId: _workContext.CurrentCustomer.Id, pageSize: 1)
                    .FirstOrDefault();
                if (order != null)
                {
                    _orderProcessingService.CancelOrder(order, false);
                    return RedirectToRoute("OrderDetails", new { orderId = order.Id });
                }
            }

            return RedirectToAction("Index", "Home", new { area = "" });
        }
        #endregion
    }
}