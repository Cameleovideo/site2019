using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{
    public class CameleoSelectListItem : SelectListItem
    {
        #region Ctor
        public CameleoSelectListItem()
            : base()
        {
            EventUserCount = 0;
            AcceptedEventUserCount = 0;
            AcceptedImageUseEventUserCount = 0;
            RefusedEventUserCount = 0;
        }

        public CameleoSelectListItem(int pEventUserCount, int pAcceptedEventUserCount, int pAcceptedImageUseEventUserCount, int pRefusedEventUserCount)
            : base()
        {            
            EventUserCount = pEventUserCount;
            AcceptedEventUserCount = pAcceptedEventUserCount;
            AcceptedImageUseEventUserCount = pAcceptedImageUseEventUserCount;
            RefusedEventUserCount = pRefusedEventUserCount;
        }
        #endregion

        //accepted Users
        public int EventUserCount { get; set; }
        public int AcceptedEventUserCount { get; set; }
        public int RefusedEventUserCount { get; set; }
        public int NoAnswerEventUserCount
        {
            get
            {
                return EventUserCount - AcceptedEventUserCount - RefusedEventUserCount;
            }
        }
        public int AcceptedImageUseEventUserCount { get; set; }
        public int AcceptPercentage
        {
            get
            {
                return CameleoUtilities.AcceptRealPercentage(EventUserCount, AcceptedEventUserCount);
            }
        }
    }
}