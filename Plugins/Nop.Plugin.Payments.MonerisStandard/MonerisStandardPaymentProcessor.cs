using System;
using System.Linq;
using System.Threading;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Routing;
using Nop.Core;
using Nop.Core.Domain.Directory;
using Nop.Core.Domain.Orders;
using Nop.Core.Domain.Payments;
using Nop.Core.Domain.Shipping;
using Nop.Core.Domain.Customers;
using Nop.Core.Plugins;
using Nop.Plugin.Payments.MonerisStandard.Controllers;
using Nop.Services.Configuration;
using Nop.Services.Common;
using Nop.Services.Directory;
using Nop.Services.Localization;
using Nop.Services.Orders;
using Nop.Services.Payments;
using Nop.Services.Tax;
using Nop.Web.Themes.CameleoVideoTheme.Domain;


namespace Nop.Plugin.Payments.MonerisStandard
{
    /// <summary>
    /// MonerisStandard payment processor
    /// </summary>
    public class MonerisStandardPaymentProcessor : BasePlugin, IPaymentMethod
    {
        #region Fields

        private readonly MonerisStandardPaymentSettings _monerisStandardPaymentSettings;
        private readonly ISettingService _settingService;
        private readonly ICurrencyService _currencyService;
        private readonly CurrencySettings _currencySettings;
        private readonly IWebHelper _webHelper;
        private readonly ICheckoutAttributeParser _checkoutAttributeParser;
        private readonly ITaxService _taxService;
        private readonly IOrderTotalCalculationService _orderTotalCalculationService;
        private readonly HttpContextBase _httpContext;
        private readonly IShoppingCartService _shoppingCartService;
        private readonly IWorkContext _workContext;
        private readonly IStoreContext _storeContext;
        private readonly IGenericAttributeService _genericAttributeService;

        public static string STORE_URL_QA = "https://esqa.moneris.com/HPPDP/index.php";
        public static string STORE_URL_PROD = "https://www3.moneris.com/HPPDP/index.php";
        #endregion

        #region Ctor

        public MonerisStandardPaymentProcessor(MonerisStandardPaymentSettings monerisStandardPaymentSettings,
            ISettingService settingService, ICurrencyService currencyService, IShoppingCartService shoppingCartService,
            CurrencySettings currencySettings, IWebHelper webHelper, IWorkContext workContext, IStoreContext storeContext,
            ICheckoutAttributeParser checkoutAttributeParser, ITaxService taxService, IGenericAttributeService genericAttributeService,
            IOrderTotalCalculationService orderTotalCalculationService, HttpContextBase httpContext)
        {
            this._monerisStandardPaymentSettings = monerisStandardPaymentSettings;
            this._settingService = settingService;
            this._currencyService = currencyService;
            this._currencySettings = currencySettings;
            this._webHelper = webHelper;
            this._checkoutAttributeParser = checkoutAttributeParser;
            this._taxService = taxService;
            this._orderTotalCalculationService = orderTotalCalculationService;
            this._httpContext = httpContext;
            this._shoppingCartService = shoppingCartService;
            _workContext = workContext;
            _storeContext = storeContext;
            _genericAttributeService = genericAttributeService;
        }

        #endregion

        #region Utilities

        /// <summary>
        /// Gets Moneris URL
        /// </summary>
        /// <returns></returns>
        private string GetMonerisUrl()
        {
            //TODO
            return _monerisStandardPaymentSettings.UseSandbox ? STORE_URL_QA : STORE_URL_PROD;
        }

        /// <summary>
        /// Gets PDT details
        /// </summary>
        /// <param name="tx">TX</param>
        /// <param name="values">Values</param>
        /// <param name="response">Response</param>
        /// <returns>Result</returns>
        public bool GetPDTDetails(string tx, out Dictionary<string, string> values, out string response)
        {
            var req = (HttpWebRequest)WebRequest.Create(GetMonerisUrl());
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";

            string formContent = string.Format("cmd=_notify-synch&at={0}&tx={1}", _monerisStandardPaymentSettings.PdtToken, tx);
            req.ContentLength = formContent.Length;

            using (var sw = new StreamWriter(req.GetRequestStream(), Encoding.ASCII))
                sw.Write(formContent);

            response = null;
            using (var sr = new StreamReader(req.GetResponse().GetResponseStream()))
                response = HttpUtility.UrlDecode(sr.ReadToEnd());

            values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            bool firstLine = true, success = false;
            foreach (string l in response.Split('\n'))
            {
                string line = l.Trim();
                if (firstLine)
                {
                    success = line.Equals("SUCCESS", StringComparison.OrdinalIgnoreCase);
                    firstLine = false;
                }
                else
                {
                    int equalPox = line.IndexOf('=');
                    if (equalPox >= 0)
                        values.Add(line.Substring(0, equalPox), line.Substring(equalPox + 1));
                }
            }

            return success;
        }        
        #endregion       

        #region Methods

        /// <summary>
        /// Process a payment
        /// </summary>
        /// <param name="processPaymentRequest">Payment info required for an order processing</param>
        /// <returns>Process payment result</returns>
        public ProcessPaymentResult ProcessPayment(ProcessPaymentRequest processPaymentRequest)
        {
            //Get first cart item
            var cartitem = _workContext.CurrentCustomer.ShoppingCartItems
                .Where(sci => sci.ShoppingCartType == ShoppingCartType.ShoppingCart)
                .Where(sci => sci.StoreId == _storeContext.CurrentStore.Id)
                .First();

            if (!(cartitem == null))
            {
                //At least one

                //Save Order GUID as attribute
                _genericAttributeService.SaveAttribute<Guid>(cartitem, CameleoGenericAttributeNames.OrderGUID, processPaymentRequest.OrderGuid, _storeContext.CurrentStore.Id);                         
            }
            
            //Put order in pending status
            var result = new ProcessPaymentResult();
            result.NewPaymentStatus = PaymentStatus.Pending;
            return result;
        }

        /// <summary>
        /// Post process payment (used by payment gateways that require redirecting to a third-party URL)
        /// </summary>
        /// <param name="postProcessPaymentRequest">Payment info required for an order processing</param>
        public void PostProcessPayment(PostProcessPaymentRequest postProcessPaymentRequest)
        {
            //Base URL
            var builder = new StringBuilder();
            builder.Append(GetMonerisUrl());            

            //Store Id and security token
            builder.AppendFormat("?ps_store_id={0}&hpp_key={1}", HttpUtility.UrlEncode(_monerisStandardPaymentSettings.StoreId), HttpUtility.UrlEncode(_monerisStandardPaymentSettings.PdtToken));

            //OrderId
            builder.AppendFormat("&order_id={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.Id.ToString()));

            //Email
            builder.AppendFormat("&email={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.Customer.Email));

            //UserName
            builder.AppendFormat("&cust_id={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.Customer.Username));

            //Language
            string lang = Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName;
            if (lang.Contains("fr"))
            {
                lang = "fr-ca";
            }
            builder.AppendFormat("&lang={0}", HttpUtility.UrlEncode(lang));   

            //Billing address            
            if (!(postProcessPaymentRequest.Order.BillingAddress == null))
            {
                builder.AppendFormat("&bill_first_name={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.FirstName));
                builder.AppendFormat("&bill_last_name={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.LastName));
                builder.AppendFormat("&bill_address_one={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.Address1 + " " + postProcessPaymentRequest.Order.BillingAddress.Address2));
                builder.AppendFormat("&bill_city={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.City));
                builder.AppendFormat("&bill_state_or_province={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.StateProvince.Abbreviation));
                builder.AppendFormat("&bill_postal_code={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.ZipPostalCode));
                builder.AppendFormat("&bill_country={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.Country.TwoLetterIsoCode));
                builder.AppendFormat("&bill_phone={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.BillingAddress.PhoneNumber));            
            }            

            //Shipping address            
            if (!(postProcessPaymentRequest.Order.ShippingAddress == null))
            {
                builder.AppendFormat("&ship_first_name={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.FirstName));
                builder.AppendFormat("&ship_last_name={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.LastName));
                builder.AppendFormat("&ship_address_one={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.Address1 + " " + postProcessPaymentRequest.Order.ShippingAddress.Address2));
                builder.AppendFormat("&ship_city={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.City));
                builder.AppendFormat("&ship_state_or_province={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.StateProvince.Abbreviation));
                builder.AppendFormat("&ship_postal_code={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.ZipPostalCode));
                builder.AppendFormat("&ship_country={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.Country.TwoLetterIsoCode));
                builder.AppendFormat("&ship_phone={0}", HttpUtility.UrlEncode(postProcessPaymentRequest.Order.ShippingAddress.PhoneNumber));
            }

            //Shipping            
            var shippingPriceExclTax = postProcessPaymentRequest.Order.OrderShippingExclTax;
            var shippingPriceExclTaxRounded = Math.Round(shippingPriceExclTax, 2);
            builder.AppendFormat("&shipping_cost={0}", shippingPriceExclTaxRounded.ToString("0.00", CultureInfo.InvariantCulture));            

            //Send items detail
            if (_monerisStandardPaymentSettings.PassProductNamesAndTotals)
            {
                //Yes

                //get the items in the cart                
                var cartItems = postProcessPaymentRequest.Order.OrderItems;
                int x = 1;
                foreach (var item in cartItems)
                {
                    //round unit price
                    var unitPriceExclTax = item.UnitPriceExclTax;
                    var unitPriceExclTaxRounded = Math.Round(unitPriceExclTax, 2);

                    //round subtotal
                    var priceExclTax = item.PriceExclTax;
                    var priceExclTaxRounded = Math.Round(priceExclTax, 2);

                    //id
                    builder.AppendFormat("&id" + x + "={0}", HttpUtility.UrlEncode(item.Product.Sku));

                    //description
                    builder.AppendFormat("&description" + x + "={0}", HttpUtility.UrlEncode(item.Product.Name));

                    //quantity
                    builder.AppendFormat("&quantity" + x + "={0}", item.Quantity);

                    //unitprice
                    builder.AppendFormat("&price" + x + "={0}", unitPriceExclTaxRounded.ToString("0.00", CultureInfo.InvariantCulture));

                    //subtotal
                    builder.AppendFormat("&subtotal" + x + "={0}", priceExclTaxRounded.ToString("0.00", CultureInfo.InvariantCulture));
                    
                    //Video project participation
                    if (item.Product.Sku == CameleoEventProducts.PRODUCT_VIDEO_PROJECT)
                    {
                        //Yes
                        //_genericAttributeService.SaveAttribute<ShippingOption>(customer, SystemCustomerAttributeNames.DiscountCouponCode, null);
                    }                   
                    
                    x++;                    
                }

                //the checkout attributes that have a dollar value and send them to Moneris as items to be paid for
                var caValues = _checkoutAttributeParser.ParseCheckoutAttributeValues(postProcessPaymentRequest.Order.CheckoutAttributesXml);
                foreach (var val in caValues)
                {
                    var attPrice = _taxService.GetCheckoutAttributePrice(val, false, postProcessPaymentRequest.Order.Customer);
                    //round
                    var attPriceRounded = Math.Round(attPrice, 2);
                    if (attPrice > decimal.Zero) //if it has a price
                    {
                        var ca = val.CheckoutAttribute;
                        if (ca != null)
                        {
                            var attName = ca.Name; //set the name

                            //id
                            builder.AppendFormat("&id" + x + "={0}", HttpUtility.UrlEncode(attName));

                            //description
                            builder.AppendFormat("&description" + x + "={0}", HttpUtility.UrlEncode(attName));

                            //quantity
                            builder.AppendFormat("&quantity" + x + "={0}", 1);

                            //unitprice
                            builder.AppendFormat("&price" + x + "={0}", attPriceRounded.ToString("0.00", CultureInfo.InvariantCulture));

                            //subtotal
                            builder.AppendFormat("&subtotal" + x + "={0}", attPriceRounded.ToString("0.00", CultureInfo.InvariantCulture));

                            
                            x++;                            
                        }
                    }
                }
            }
            else
            {
                //pass order total only                
            }

            //Charge Total
            var totalPriceInclTax = postProcessPaymentRequest.Order.OrderTotal;
            var totalPriceInclTaxRounded = Math.Round(totalPriceInclTax, 2);
            builder.AppendFormat("&charge_total={0}", totalPriceInclTaxRounded.ToString("0.00", CultureInfo.InvariantCulture));

            var totalPriceExclTax = postProcessPaymentRequest.Order.OrderTotal - postProcessPaymentRequest.Order.OrderTax;
            var totalPriceExclTaxRounded = Math.Round(totalPriceExclTax, 2);
            

            string provinceAbbrev = postProcessPaymentRequest.Order.BillingAddress.StateProvince.Abbreviation;
            if (provinceAbbrev.Contains("QC"))
            {
                //Quebec
                //GST
                var totalGST = totalPriceExclTax * (decimal)0.05;
                var totalGSTRounded = Math.Round(totalGST, 2);
                builder.AppendFormat("&gst={0}", totalGSTRounded.ToString("0.00", CultureInfo.InvariantCulture));
                
                //PST
                var totalPST = totalPriceExclTax * (decimal)0.09975;
                var totalPSTRounded = Math.Round(totalPST, 2);
                builder.AppendFormat("&pst={0}", totalPSTRounded.ToString("0.00", CultureInfo.InvariantCulture));                
            }
            else if (provinceAbbrev.Contains("ON") || provinceAbbrev.Contains("NL") || provinceAbbrev.Contains("TNL") || provinceAbbrev.Contains("NB") )
            {
                //HST 13
                var totalHST = totalPriceExclTax * (decimal)0.13;
                var totalHSTRounded = Math.Round(totalHST, 2);
                builder.AppendFormat("&hst={0}", totalHSTRounded.ToString("0.00", CultureInfo.InvariantCulture));
            }
            else if (provinceAbbrev.Contains("NS") || provinceAbbrev.Contains("NE"))
            {
                //HST 15
                var totalHST = totalPriceExclTax * (decimal)0.15;
                var totalHSTRounded = Math.Round(totalHST, 2);
                builder.AppendFormat("&hst={0}", totalHSTRounded.ToString("0.00", CultureInfo.InvariantCulture));
            }
            else if (provinceAbbrev.Contains("PE") || provinceAbbrev.Contains("PEI") || provinceAbbrev.Contains("IPE"))
            {
                //HST 14
                var totalHST = totalPriceExclTax * (decimal)0.14;
                var totalHSTRounded = Math.Round(totalHST, 2);
                builder.AppendFormat("&hst={0}", totalHSTRounded.ToString("0.00", CultureInfo.InvariantCulture));
            }
            else if (provinceAbbrev.Contains("BC") || provinceAbbrev.Contains("CB") || provinceAbbrev.Contains("AB") || provinceAbbrev.Contains("SK") || provinceAbbrev.Contains("MB") || provinceAbbrev.Contains("NT") || provinceAbbrev.Contains("TNO") || provinceAbbrev.Contains("NU") || provinceAbbrev.Contains("YT") || provinceAbbrev.Contains("YU"))
            {
                //GST only    
                var totalGST = totalPriceExclTax * (decimal)0.05;
                var totalGSTRounded = Math.Round(totalGST, 2);
                builder.AppendFormat("&gst={0}", totalGSTRounded.ToString("0.00", CultureInfo.InvariantCulture));
            }

            //Redirect
            _httpContext.Response.Redirect(builder.ToString());
        }
       

        /// <summary>
        /// Gets additional handling fee
        /// </summary>
        /// <param name="cart">Shoping cart</param>
        /// <returns>Additional handling fee</returns>
        public decimal GetAdditionalHandlingFee(IList<ShoppingCartItem> cart)
        {
            /*var result = this.CalculateAdditionalFee(_orderTotalCalculationService, cart,
                _monerisStandardPaymentSettings.AdditionalFee, _monerisStandardPaymentSettings.AdditionalFeePercentage);
            return result;*/
            return 0;
        }

        /// <summary>
        /// Captures payment
        /// </summary>
        /// <param name="capturePaymentRequest">Capture payment request</param>
        /// <returns>Capture payment result</returns>
        public CapturePaymentResult Capture(CapturePaymentRequest capturePaymentRequest)
        {
            var result = new CapturePaymentResult();
            result.AddError("Capture method not supported");
            return result;
        }

        /// <summary>
        /// Refunds a payment
        /// </summary>
        /// <param name="refundPaymentRequest">Request</param>
        /// <returns>Result</returns>
        public RefundPaymentResult Refund(RefundPaymentRequest refundPaymentRequest)
        {
            var result = new RefundPaymentResult();
            result.AddError("Refund method not supported");
            return result;
        }

        /// <summary>
        /// Voids a payment
        /// </summary>
        /// <param name="voidPaymentRequest">Request</param>
        /// <returns>Result</returns>
        public VoidPaymentResult Void(VoidPaymentRequest voidPaymentRequest)
        {
            var result = new VoidPaymentResult();
            result.AddError("Void method not supported");
            return result;
        }

        /// <summary>
        /// Process recurring payment
        /// </summary>
        /// <param name="processPaymentRequest">Payment info required for an order processing</param>
        /// <returns>Process payment result</returns>
        public ProcessPaymentResult ProcessRecurringPayment(ProcessPaymentRequest processPaymentRequest)
        {
            var result = new ProcessPaymentResult();
            result.AddError("Recurring payment not supported");
            return result;
        }

        /// <summary>
        /// Cancels a recurring payment
        /// </summary>
        /// <param name="cancelPaymentRequest">Request</param>
        /// <returns>Result</returns>
        public CancelRecurringPaymentResult CancelRecurringPayment(CancelRecurringPaymentRequest cancelPaymentRequest)
        {
            var result = new CancelRecurringPaymentResult();
            result.AddError("Recurring payment not supported");
            return result;
        }

        /// <summary>
        /// Gets a value indicating whether customers can complete a payment after order is placed but not completed (for redirection payment methods)
        /// </summary>
        /// <param name="order">Order</param>
        /// <returns>Result</returns>
        public bool CanRePostProcessPayment(Order order)
        {
            //if (order == null)
            //    throw new ArgumentNullException("order");
            
            ////let's ensure that at least 5 seconds passed after order is placed
            ////P.S. there's no any particular reason for that. we just do it
            //if ((DateTime.UtcNow - order.CreatedOnUtc).TotalSeconds < 5)
            //    return false;

            //return true;

            return false;
        }

        /// <summary>
        /// Gets a route for provider configuration
        /// </summary>
        /// <param name="actionName">Action name</param>
        /// <param name="controllerName">Controller name</param>
        /// <param name="routeValues">Route values</param>
        public void GetConfigurationRoute(out string actionName, out string controllerName, out RouteValueDictionary routeValues)
        {
            actionName = "Configure";
            controllerName = "PaymentMonerisStandard";
            routeValues = new RouteValueDictionary() { { "Namespaces", "Nop.Plugin.Payments.MonerisStandard.Controllers" }, { "area", null } };
        }

        /// <summary>
        /// Gets a route for payment info
        /// </summary>
        /// <param name="actionName">Action name</param>
        /// <param name="controllerName">Controller name</param>
        /// <param name="routeValues">Route values</param>
        public void GetPaymentInfoRoute(out string actionName, out string controllerName, out RouteValueDictionary routeValues)
        {
            actionName = "PaymentInfo";
            controllerName = "PaymentMonerisStandard";
            routeValues = new RouteValueDictionary() { { "Namespaces", "Nop.Plugin.Payments.MonerisStandard.Controllers" }, { "area", null } };
        }

        public Type GetControllerType()
        {
            return typeof(PaymentMonerisStandardController);
        }

        public override void Install()
        {
            //settings
            var settings = new MonerisStandardPaymentSettings()
            {
                UseSandbox = true,
                StoreId = "test@test.com",
                PdtToken= "Your PDT token here...",
                PdtValidateOrderTotal = true,
                //EnableIpn = true,
            };
            _settingService.SaveSetting(settings);

            //locales
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.RedirectionTip", "You will be redirected to Moneris site to complete the order.");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.UseSandbox", "Use Sandbox");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.UseSandbox.Hint", "Check to enable Sandbox (testing environment).");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.StoreId", "Store Id");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.StoreId.Hint", "Specify your Moneris Store ID.");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTToken", "PDT Identity Token");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTToken.Hint", "Specify PDT identity token");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTValidateOrderTotal", "PDT. Validate order total");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTValidateOrderTotal.Hint", "Check if PDT handler should validate order totals.");
            /*this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFee", "Additional fee");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFee.Hint", "Enter additional fee to charge your customers.");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFeePercentage", "Additional fee. Use percentage");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFeePercentage.Hint", "Determines whether to apply a percentage additional fee to the order total. If not enabled, a fixed value is used.");*/
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PassProductNamesAndTotals", "Pass product names and order totals to Moneris");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PassProductNamesAndTotals.Hint", "Check if product names and order totals should be passed to Moneris.");
            //TODO
            /*this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.EnableIpn", "Enable IPN (Instant Payment Notification)");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.EnableIpn.Hint", "Check if IPN is enabled.");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.EnableIpn.Hint2", "Leave blank to use the default IPN handler URL.");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.IpnUrl", "IPN Handler");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.IpnUrl.Hint", "Specify IPN Handler.");*/
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage", "Return to order details page");
            this.AddOrUpdatePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage.Hint", "Enable if a customer should be redirected to the order details page when he clicks \"return to store\" link on Moneris site WITHOUT completing a payment");

            base.Install();
        }
        
        public override void Uninstall()
        {
            //settings
            _settingService.DeleteSetting<MonerisStandardPaymentSettings>();

            //locales
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.RedirectionTip");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.UseSandbox");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.UseSandbox.Hint");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.StoreId");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.StoreId.Hint");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTToken");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTToken.Hint");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTValidateOrderTotal");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PDTValidateOrderTotal.Hint");
            /*this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFee");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFee.Hint");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFeePercentage");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.AdditionalFeePercentage.Hint");*/
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PassProductNamesAndTotals");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.PassProductNamesAndTotals.Hint");
            //TODO
            /*this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.EnableIpn");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.EnableIpn.Hint");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.EnableIpn.Hint2");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.IpnUrl");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.IpnUrl.Hint");*/
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage");
            this.DeletePluginLocaleResource("Plugins.Payments.MonerisStandard.Fields.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage.Hint");
            
            base.Uninstall();
        }

        #endregion

        #region Properies

        /// <summary>
        /// Gets a value indicating whether capture is supported
        /// </summary>
        public bool SupportCapture
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// Gets a value indicating whether partial refund is supported
        /// </summary>
        public bool SupportPartiallyRefund
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// Gets a value indicating whether refund is supported
        /// </summary>
        public bool SupportRefund
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// Gets a value indicating whether void is supported
        /// </summary>
        public bool SupportVoid
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// Gets a recurring payment type of payment method
        /// </summary>
        public RecurringPaymentType RecurringPaymentType
        {
            get
            {
                return RecurringPaymentType.NotSupported;
            }
        }

        /// <summary>
        /// Gets a payment method type
        /// </summary>
        public PaymentMethodType PaymentMethodType
        {
            get
            {
                return PaymentMethodType.Redirection;
            }
        }

        /// <summary>
        /// Gets a value indicating whether we should display a payment information page for this plugin
        /// </summary>
        public bool SkipPaymentInfo
        {
            get
            {
                return false;
            }
        }

        #endregion
    }
}
