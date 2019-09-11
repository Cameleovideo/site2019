using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Payments.MonerisStandard.Models
{
    public class ConfigurationModel : BaseNopModel
    {
        public int ActiveStoreScopeConfiguration { get; set; }

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.UseSandbox")]
        public bool UseSandbox { get; set; }
        public bool UseSandbox_OverrideForStore { get; set; }

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.StoreId")]
        public string StoreId { get; set; }
        public bool StoreId_OverrideForStore { get; set; }

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.PDTToken")]
        public string PdtToken { get; set; }
        public bool PdtToken_OverrideForStore { get; set; }

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.PDTValidateOrderTotal")]
        public bool PdtValidateOrderTotal { get; set; }
        public bool PdtValidateOrderTotal_OverrideForStore { get; set; }

        /*
        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.AdditionalFee")]
        public decimal AdditionalFee { get; set; }
        public bool AdditionalFee_OverrideForStore { get; set; }

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.AdditionalFeePercentage")]
        public bool AdditionalFeePercentage { get; set; }
        public bool AdditionalFeePercentage_OverrideForStore { get; set; }
         */

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.PassProductNamesAndTotals")]
        public bool PassProductNamesAndTotals { get; set; }
        public bool PassProductNamesAndTotals_OverrideForStore { get; set; }
        
        //TODO
        /*
        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.EnableIpn")]
        public bool EnableIpn { get; set; }
        public bool EnableIpn_OverrideForStore { get; set; }

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.IpnUrl")]
        public string IpnUrl { get; set; }
        public bool IpnUrl_OverrideForStore { get; set; }
        */

        [NopResourceDisplayName("Plugins.Payments.MonerisStandard.Fields.ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage")]
        public bool ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage { get; set; }
        public bool ReturnFromMonerisWithoutPaymentRedirectsToOrderDetailsPage_OverrideForStore { get; set; }
    }
}