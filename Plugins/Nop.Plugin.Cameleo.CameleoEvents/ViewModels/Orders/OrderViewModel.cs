using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;
using Nop.Admin.Models.Orders;
using Nop.Core.Domain.Orders;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class OrderViewModel : OrderModel
    {
        public int PaymentStatusId { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.EventCode")]          
        public string EventCodes { get; set; }

        [NopResourceDisplayName("Plugins.Cameleo.CameleoEvents.Fields.EventName")]   
        public string ClientNames { get; set; }
        
        public string EventIds { get; set; }

        public bool CanEditOrder { get; set; }

        public bool ShowRefund
        {
            get
            {
                if (this.OrderStatusId == (int)Nop.Core.Domain.Orders.OrderStatus.Complete && this.PaymentStatusId == (int)Nop.Core.Domain.Payments.PaymentStatus.Paid)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public bool ShowCancel
        {
            get
            {
                if (this.OrderStatusId == (int)Nop.Core.Domain.Orders.OrderStatus.Pending && this.PaymentStatusId == (int)Nop.Core.Domain.Payments.PaymentStatus.Pending)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public bool ShowPaid
        {
            get
            {
                if (this.OrderStatusId == (int)Nop.Core.Domain.Orders.OrderStatus.Pending && this.PaymentStatusId == (int)Nop.Core.Domain.Payments.PaymentStatus.Pending)
	            {
                    return true;
	            }	
                //else if (this.OrderStatusId == (int)Nop.Core.Domain.Orders.OrderStatus.Cancelled && this.PaymentStatusId == (int)Nop.Core.Domain.Payments.PaymentStatus.Pending)
                //{
                //    return true;
                //}                
                else
                {
                    return false;
                }
            }
        }
    }
}