using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Core;
using Nop.Core.Domain.Messages;
using Nop.Core.Domain.Customers;
using Nop.Services.Messages;
using Nop.Services.Customers;
using Nop.Services.Events;
using Nop.Services.Localization;
using Nop.Services.Stores;


namespace Nop.Plugin.Cameleo.CameleoEvents.Services
{
    public class CameleoWorkflowMessageService : WorkflowMessageService, ICameleoWorkflowMessageService, IWorkflowMessageService
    {
        #region Fields

        private readonly IMessageTemplateService _messageTemplateService;
        private readonly IQueuedEmailService _queuedEmailService;
        private readonly ILanguageService _languageService;
        private readonly ITokenizer _tokenizer;
        private readonly IEmailAccountService _emailAccountService;
        private readonly IMessageTokenProvider _messageTokenProvider;
        private readonly IStoreService _storeService;
        private readonly IStoreContext _storeContext;
        private readonly IWorkContext _workContext;
        private readonly EmailAccountSettings _emailAccountSettings;
        private readonly IEventPublisher _eventPublisher;

        #endregion Fields

        #region Ctor

        static CameleoWorkflowMessageService()
        {
        }

       

        public CameleoWorkflowMessageService(IMessageTemplateService messageTemplateService, IQueuedEmailService queuedEmailService,             
            ITokenizer tokenizer, IEmailAccountService emailAccountService, IMessageTokenProvider messageTokenProvider,
            ILanguageService languageService, IStoreService storeService, IStoreContext storeContext, EmailAccountSettings emailAccountSettings,
            IEventPublisher eventPublisher, IWorkContext workContext)
            : base(messageTemplateService, queuedEmailService, languageService, tokenizer, emailAccountService, messageTokenProvider, storeService, storeContext, emailAccountSettings, eventPublisher)
        {
            this._messageTemplateService = messageTemplateService;
            this._queuedEmailService = queuedEmailService;
            this._languageService = languageService;
            this._tokenizer = tokenizer;
            this._emailAccountService = emailAccountService;
            this._messageTokenProvider = messageTokenProvider;
            this._storeService = storeService;
            this._storeContext = storeContext;
            this._workContext = workContext;
            this._emailAccountSettings = emailAccountSettings;
            this._eventPublisher = eventPublisher;
        }

        #endregion Ctor

        #region Utilities
        protected virtual int SendShareInfoNotification(MessageTemplate messageTemplate, EmailAccount emailAccount, int languageId,
            List<Token> tokens, string toEmailAddress, string toName, string attachmentFilePath = null, string attachmentFileName = null)
        {
            //retrieve localized message template data
            var bcc = messageTemplate.GetLocalized((mt) => mt.BccEmailAddresses, languageId);
            var subject = messageTemplate.GetLocalized((mt) => mt.Subject, languageId);
            var body = messageTemplate.GetLocalized((mt) => mt.Body, languageId);
                       

            var email = new QueuedEmail()
            {
                Priority = 5,
                From = emailAccount.Email,
                FromName = emailAccount.DisplayName,
                To = toEmailAddress,
                ToName = toName,
                CC = string.Empty,
                Bcc = bcc,
                Subject = subject,
                Body = body,
                AttachmentFilePath = attachmentFilePath,
                AttachmentFileName = attachmentFileName,
                CreatedOnUtc = DateTime.UtcNow,
                EmailAccountId = emailAccount.Id
            };            

            _queuedEmailService.InsertQueuedEmail(email);

            //Replace subject and body tokens 
            tokens.Add(new Token("EmailAFriend.SourceMessageId", email.Id.ToString()));
            var subjectReplaced = _tokenizer.Replace(subject, tokens, false);
            var bodyReplaced = _tokenizer.Replace(body, tokens, true);

            email.Subject = subjectReplaced;
            email.Body = bodyReplaced;
            _queuedEmailService.UpdateQueuedEmail(email);
            
            return email.Id;
        }
        #endregion

        #region ShareInfo
        public virtual int SendShareInfoMessage(Customer customer, int languageId, string customerEmail, string customerName, string friendsEmail, string personalMessage)
        {
            //Check customer
            if (customer == null)
            {
                throw new ArgumentNullException("customer");
            }

            //Get Store
            var store = _storeContext.CurrentStore;

            //Get language
            languageId = EnsureLanguageIsActive(languageId, store.Id);

            //Get Template 
            var messageTemplate = GetActiveMessageTemplate("Cameleo.ShareInfo", store.Id);
            if (messageTemplate == null)
            {
                return 0;
            }

            //email account
            var emailAccount = GetEmailAccountOfMessageTemplate(messageTemplate, languageId);

            //tokens
            var tokens = new List<Token>();
            _messageTokenProvider.AddStoreTokens(tokens, store, emailAccount);
            _messageTokenProvider.AddCustomerTokens(tokens, customer);
            tokens.Add(new Token("EmailAFriend.FullName", customerName));
            tokens.Add(new Token("EmailAFriend.PersonalMessage", personalMessage, true));
            tokens.Add(new Token("EmailAFriend.Email", customerEmail));
            
            //event notification
            _eventPublisher.MessageTokensAdded(messageTemplate, tokens);

            //Send message
            var toEmail = friendsEmail;
            var toName = "";
            int newMessageId = SendShareInfoNotification(messageTemplate, emailAccount, languageId, tokens, toEmail, toName);

            return newMessageId;
        }
        #endregion

        #region NotPaidReminderEmail
        public virtual int SendNotPaidReminderMessage(int languageId, decimal participationFee, string destinationEmail)
        {
            //Get Store
            var store = _storeContext.CurrentStore;

            //Get language
            languageId = EnsureLanguageIsActive(languageId, store.Id);

            //Get Template 
            var messageTemplate = GetActiveMessageTemplate("Cameleo.NotPaidReminder", store.Id);
            if (messageTemplate == null)
            {
                return 0;
            }

            //email account
            var emailAccount = GetEmailAccountOfMessageTemplate(messageTemplate, languageId);

            //tokens
            var tokens = new List<Token>();
            _messageTokenProvider.AddStoreTokens(tokens, store, emailAccount);
            //_messageTokenProvider.AddCustomerTokens(tokens, customer);            
            //tokens.Add(new Token("EmailAFriend.Email", customerEmail));

            //event notification
            _eventPublisher.MessageTokensAdded(messageTemplate, tokens);

            //Send message
            var toEmail = destinationEmail;
            var toName = "";
            int newMessageId = SendShareInfoNotification(messageTemplate, emailAccount, languageId, tokens, toEmail, toName);

            return newMessageId;
        }
        #endregion
    }
}