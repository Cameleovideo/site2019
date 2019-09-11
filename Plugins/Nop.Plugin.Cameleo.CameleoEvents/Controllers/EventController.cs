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
using Nop.Core.Domain.Messages;
using Nop.Core.Domain.Common;
using Nop.Services.Catalog;
using Nop.Services.Common;
using Nop.Plugin.Cameleo.CameleoEvents.Services;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Plugin.Cameleo.CameleoEvents.Models;
using Nop.Services.Security;
using Nop.Web.Controllers;
using Nop.Web.Models.Customer;
using Nop.Web.Models.Catalog;
using Nop.Web.Models.Common;
using Nop.Web.Framework.Controllers;
using Nop.Web.Framework.Security;
using Nop.Web.Themes.CameleoVideoTheme.ViewModels;
using Nop.Web.Framework.UI.Captcha;
using Nop.Web.Infrastructure.Cache;
using Nop.Services.Localization;
using Nop.Services.Messages;
using Nop.Services.Logging;
using Nop.Web.Themes.CameleoVideoTheme.Domain;


namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class EventController : BasePublicController
    {
        #region Fields
        private readonly ICameleoEventService _eventService;
        private readonly ICameleoEventUserService _eventUserService;
        private readonly ICameleoCustomerEventService _customerEventService;        
        private readonly IWorkContext _workContext;        
        private readonly CustomerSettings _customerSettings;
        private readonly CaptchaSettings _captchaSettings;
        private readonly ILocalizationService _localizationService;        
        private readonly IEmailAccountService _emailAccountService;
        private readonly EmailAccountSettings _emailAccountSettings;
        private readonly IStoreContext _storeContext;
        private readonly CommonSettings _commonSettings;
        private readonly IQueuedEmailService _queuedEmailService;
        private readonly ICustomerActivityService _customerActivityService;
        private readonly ICameleoWorkflowMessageService _cameleoWorkflowMessageService;
        private readonly IGenericAttributeService _genericAttributeService;
        #endregion

        #region Ctor
        public EventController(IWorkContext workContext, ICameleoEventService eventService, ICameleoEventUserService eventUserService, 
                CaptchaSettings captchaSettings, CustomerSettings customerSettings, ILocalizationService localizationService, 
                IEmailAccountService emailAccountService, EmailAccountSettings emailAccountSettings, IStoreContext storeContext, 
                IQueuedEmailService queuedEmailService, ICustomerActivityService customerActivityService, CommonSettings commonSettings,
                ICameleoCustomerEventService customerEventService, ICameleoWorkflowMessageService cameleoWorkflowMessageService,
                IGenericAttributeService genericAttributeService)
        {
            _workContext = workContext;            
            _eventService = eventService;
            _eventUserService = eventUserService;
            _customerEventService = customerEventService;            
            _captchaSettings = captchaSettings;
            _customerSettings = customerSettings;
            _localizationService = localizationService;            
            _emailAccountService = emailAccountService;
            _emailAccountSettings = emailAccountSettings;
            _storeContext = storeContext;
            _queuedEmailService = queuedEmailService;
            _customerActivityService = customerActivityService;
            _commonSettings = commonSettings;
            _cameleoWorkflowMessageService = cameleoWorkflowMessageService;
            _genericAttributeService = genericAttributeService;
        }
        #endregion        

        #region index
        [NopHttpsRequirement(SslRequirement.No)]
        public ActionResult Index2()
        {
            var model = new CameleoVideoIndexViewModel();
            model.Topic = "HomePageText2";
            return View("Index", model);
        }

        [NopHttpsRequirement(SslRequirement.No)]
        public ActionResult Index3()
        {
            var model = new CameleoVideoIndexViewModel();
            model.Topic = "HomePageText3";
            return View("Index", model);
        }
        
        [NopHttpsRequirement(SslRequirement.No)]
        public ActionResult CameleoLogin()
        {
            var model = new LoginModel();
            model.UsernamesEnabled = _customerSettings.UsernamesEnabled;            
            model.DisplayCaptcha = _captchaSettings.Enabled && _captchaSettings.ShowOnLoginPage;
            ModelState.AddModelError("Plugins.Cameleo.CameleoEvents.Activation.Success", _localizationService.GetResource("Plugins.Cameleo.CameleoEvents.Activation.Success"));
            
            return View("Login", model);
        }
        #endregion

        #region EventCodeRecovery
        [Authorize]
        public ActionResult EventCodeRecovery()
        {
            var model = new EventCodeRecoveryModel();
            model.Email = _workContext.CurrentCustomer.Username;
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventCodeRecovery/EventCodeRecovery.cshtml", model);
        }

        [HttpPost, ActionName("EventCodeRecovery")]
        [FormValueRequired("event-recevory")]
        public ActionResult EventRecoverySend(EventCodeRecoveryModel model)
        {
            if (ModelState.IsValid)
            {
                //Get customer email address
                string email = model.Email.Trim();

                string fullName = model.FirstName + " " + model.LastName;

                //Message subject
                string subject = string.Format(_localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.EmailSubject"), _storeContext.CurrentStore.Name);

                //Email account to send message
                var emailAccount = _emailAccountService.GetEmailAccountById(_emailAccountSettings.DefaultEmailAccountId);
                if (emailAccount == null)
                    emailAccount = _emailAccountService.GetAllEmailAccounts().FirstOrDefault();
                if (emailAccount == null)
                {            
                    // Can't get account
                    model.SuccessfullySent = false;
                    model.Result = _localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.YourEnquiryHasNotBeenSent");

                    //activity log
                    _customerActivityService.InsertActivity("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Activity.Used", _localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Activity.Used"));

                    return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventCodeRecovery/EventCodeRecovery.cshtml", model);
                }

                //Else create message
                string from = null;
                string fromName = null;
                string body = Core.Html.HtmlHelper.FormatText(model.Notes, false, true, false, false, false, false);
                //required for some SMTP servers
                if (_commonSettings.UseSystemEmailForContactUsForm)
                {
                    from = emailAccount.Email;
                    fromName = emailAccount.DisplayName;
                    body = string.Format("<strong>From</strong>: {0} - {1}<br /><br />{2}<br /><br />{3}<br /><br />{4}",
                        Server.HtmlEncode(fullName), Server.HtmlEncode(email), model.Event, model.Group, body);
                }
                else
                {
                    from = email;
                    fromName = fullName;
                }

                //Send
                _queuedEmailService.InsertQueuedEmail(new QueuedEmail()
                {
                    From = from,
                    FromName = fromName,
                    To = emailAccount.Email,
                    ToName = emailAccount.DisplayName,
                    Priority = 5,
                    Subject = subject,
                    Body = body,
                    CreatedOnUtc = DateTime.UtcNow,
                    EmailAccountId = emailAccount.Id
                });

                model.SuccessfullySent = true;
                model.Result = _localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.YourEnquiryHasBeenSent");

                //activity log
                _customerActivityService.InsertActivity("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Activity.Used", _localizationService.GetResource("Plugins.Cameleo.CameleoEvents.EventCodeRecovery.Activity.Used"));

                return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventCodeRecovery/EventCodeRecovery.cshtml", model);
            }
            
            //If we got this far, something failed, redisplay form
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/EventCodeRecovery/EventCodeRecovery.cshtml", model);
        }
        #endregion

        #region TopMenu
        [ChildActionOnly]
        public ActionResult TopMenu(int? customerEventId)
        {
            //Get Catalog controller
            var tmpCatalogController = DependencyResolver.Current.GetService(typeof(CatalogController)) as CatalogController;
            PartialViewResult result = (PartialViewResult)tmpCatalogController.TopMenu();

            //Current catalog topmenu model
            TopMenuModel tmpModel = (TopMenuModel)result.ViewData.Model;
            CameleoTopMenuModel tmpCameleoModel = new CameleoTopMenuModel();
            tmpCameleoModel.BlogEnabled = tmpModel.BlogEnabled;
            tmpCameleoModel.ForumEnabled = tmpModel.ForumEnabled;            
            tmpCameleoModel.Categories = tmpModel.Categories;
            tmpCameleoModel.RecentlyAddedProductsEnabled = tmpModel.RecentlyAddedProductsEnabled;

            //Enable MyGroup Menu for staff ?
            //In customer event details page?
            if (customerEventId == null)
            {
                //No don't show menu
                tmpCameleoModel.MyGroupEnabled = false;
            }
            else
            {
                //Else, get customer event
                var tmpCustomerEvent = _customerEventService.GetCustomerEventById(customerEventId);
                //Found?
                if (tmpCustomerEvent == null)
                {
                    //No don't show menu
                    tmpCameleoModel.MyGroupEnabled = false;
                }
                else
                {
                    // Get event user
                    var tmpEventUser = _eventUserService.GetEventUserById(tmpCustomerEvent.EventUserId);

                    //Found?
                    if (tmpEventUser==null)
                    {
                        //No don't show menu
                        tmpCameleoModel.MyGroupEnabled = false;
	                }
                    else
                    {
                        //Else, check if staff
                        if (tmpEventUser.isStaff)
                        {
                            //Yes, show menu
                            tmpCameleoModel.MyGroupEnabled = true;
                            tmpCameleoModel.CustomerEventId = customerEventId;
                        }
                        else
                        {
                            //Else don't show menu
                            tmpCameleoModel.MyGroupEnabled = false;
                        }
                    }                    
                }
            }            

            //Return view
            return PartialView(tmpCameleoModel);
        }
        #endregion

        #region ShareInfo
        [CaptchaValidator, NopHttpsRequirement(SslRequirement.No)]
        public ActionResult ShareInfo(string emailaddresses, string sharefullname, string shareemail, string shareschoolname, string sharemessage, bool captchaValid)
        {
            var model = new ContactUsModel()
            {                
                DisplayCaptcha = _captchaSettings.Enabled && _captchaSettings.ShowOnContactUsPage
            };

            if (_captchaSettings.Enabled && _captchaSettings.ShowOnContactUsPage && !captchaValid)
            {
                ModelState.AddModelError("", _localizationService.GetResource("Common.WrongCaptcha"));
            }

            if (ModelState.IsValid)
            {
                if (emailaddresses.Trim().Length > 0)
                {
                    //For all email addresses
                    foreach (var tmpEmail in emailaddresses.Split(';'))
                    {
                        //Validate email address
                        if (!CommonHelper.IsValidEmail(tmpEmail))
                        {
                            //Invalid
                            model.Result = model.Result + _localizationService.GetResource("Common.WrongEmail") + " : (" + tmpEmail + ")<br/>";                            
                        }
                        else
                        {
                            //Send the message
                            try
                            {
                                _cameleoWorkflowMessageService.SendShareInfoMessage(_workContext.CurrentCustomer, _workContext.WorkingLanguage.Id,
                                    shareemail, sharefullname, tmpEmail, Core.Html.HtmlHelper.FormatText(sharemessage, false, true, false, false, false, false));

                                model.Result = model.Result + _localizationService.GetResource("ShareInfo.YourEnquiryHasBeenSent") + " : (" + tmpEmail + ")<br/>";
                            }
                            catch (Exception)
                            {
                                model.Result = model.Result + _localizationService.GetResource("ShareInfo.Error") + " : (" + tmpEmail + ")<br/>";
                            }
                        }                        
                    } 
      
                    //Notify admin
                    string subject = string.Format(_localizationService.GetResource("ShareInfo.EmailSubject"), _storeContext.CurrentStore.Name);

                    var emailAccount = _emailAccountService.GetEmailAccountById(_emailAccountSettings.DefaultEmailAccountId);
                    if (emailAccount == null)
                        emailAccount = _emailAccountService.GetAllEmailAccounts().FirstOrDefault();
                    if (emailAccount == null)
                        throw new Exception("No email account could be loaded");

                    string from = null;
                    string fromName = null;
                    string body = Core.Html.HtmlHelper.FormatText(sharemessage, false, true, false, false, false, false);
                    //required for some SMTP servers
                    if (_commonSettings.UseSystemEmailForContactUsForm)
                    {
                        from = emailAccount.Email;
                        fromName = emailAccount.DisplayName;
                        body = string.Format("<strong>From</strong>: {0} - {1}<br /><br /><strong>To</strong>: {2} - {3}<br /><br />{4}",
                            Server.HtmlEncode(sharefullname),
                            Server.HtmlEncode(shareemail),
                            Server.HtmlEncode(emailaddresses),
                            Server.HtmlEncode(shareschoolname),
                            body);
                    }
                    else
                    {
                        from = shareemail;
                        fromName = sharefullname;
                    }

                    //Send message
                    QueuedEmail queudEmail = new QueuedEmail()
                    {
                        From = from,
                        FromName = fromName,
                        To = emailAccount.Email,
                        ToName = emailAccount.DisplayName,
                        Priority = 5,
                        Subject = subject,
                        Body = body,
                        CreatedOnUtc = DateTime.UtcNow,
                        EmailAccountId = emailAccount.Id
                    };
                    _queuedEmailService.InsertQueuedEmail(queudEmail);
                }
                else
                {
                    model.Result = model.Result + _localizationService.GetResource("ShareInfo.NoAddresses");
                }
                         

                //activity log
                _customerActivityService.InsertActivity("PublicStore.ContactUs", _localizationService.GetResource("ActivityLog.PublicStore.ShareInfo"));

                //Return
                model.SuccessfullySent = true;
                return View("ContactUs", model);
            }

            //Return 
            return View("ContactUs", model);
        }

        [NopHttpsRequirement(SslRequirement.No)]
        public ActionResult RequestInfo(int sourceMessageId)
        {
            var model = new ContactUsModel()
            {
                DisplayCaptcha = _captchaSettings.Enabled && _captchaSettings.ShowOnContactUsPage
            };


            //Return 
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/RequestInfo/RequestInfo.cshtml", model);
        }

        [CaptchaValidator, NopHttpsRequirement(SslRequirement.No), HttpPost]
        public ActionResult RequestInfo(ContactUsModel model, int sourceMessageId, bool captchaValid)
        {

            //validate CAPTCHA
            if (_captchaSettings.Enabled && _captchaSettings.ShowOnContactUsPage && !captchaValid)
            {
                ModelState.AddModelError("", _localizationService.GetResource("Common.WrongCaptcha"));
            }

            if (ModelState.IsValid)
            {
                string email = model.Email.Trim();
                string fullName = model.FullName;
                string subject = string.Format(_localizationService.GetResource("RequestInfo.EmailSubject"), _storeContext.CurrentStore.Name);

                var emailAccount = _emailAccountService.GetEmailAccountById(_emailAccountSettings.DefaultEmailAccountId);
                if (emailAccount == null)
                    emailAccount = _emailAccountService.GetAllEmailAccounts().FirstOrDefault();
                if (emailAccount == null)
                    throw new Exception("No email account could be loaded");                

                string from = null;
                string fromName = null;
                string body = Core.Html.HtmlHelper.FormatText(model.Enquiry, false, true, false, false, false, false);
                //required for some SMTP servers
                if (_commonSettings.UseSystemEmailForContactUsForm)
                {
                    from = emailAccount.Email;
                    fromName = emailAccount.DisplayName;
                    body = string.Format("<strong>From</strong>: {0} - {1}<br /><br />{2}",
                        Server.HtmlEncode(fullName),
                        Server.HtmlEncode(email),
                        body + "<br /><br />SourceMessageID : " + sourceMessageId.ToString());
                }
                else
                {
                    from = email;
                    fromName = fullName;
                }

                //Send message
                QueuedEmail queudEmail = new QueuedEmail()
                {
                    From = from,
                    FromName = fromName,
                    To = emailAccount.Email,
                    ToName = emailAccount.DisplayName,
                    Priority = 5,
                    Subject = subject,
                    Body = body,
                    CreatedOnUtc = DateTime.UtcNow,
                    EmailAccountId = emailAccount.Id
                };
                _queuedEmailService.InsertQueuedEmail(queudEmail);

                //Keep link between this message and the source message in the generic attributes                
                _genericAttributeService.SaveAttribute<int>(queudEmail, CameleoGenericAttributeNames.RequestInfo, sourceMessageId, _storeContext.CurrentStore.Id);

                //Successful, return view
                model.SuccessfullySent = true;
                model.Result = _localizationService.GetResource("ContactUs.YourEnquiryHasBeenSent");

                //activity log
                _customerActivityService.InsertActivity("PublicStore.RequestInfo", _localizationService.GetResource("ActivityLog.PublicStore.ContactUs"));
                return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/RequestInfo/RequestInfo.cshtml", model);
            }

            //Somethig wrong happened, reload view
            model.DisplayCaptcha = _captchaSettings.Enabled && _captchaSettings.ShowOnContactUsPage;
            return View("~/Plugins/Cameleo.CameleoEvents/Views/CameleoEvents/RequestInfo/RequestInfo.cshtml", model);
            
        }
        
        #endregion

    }
}
