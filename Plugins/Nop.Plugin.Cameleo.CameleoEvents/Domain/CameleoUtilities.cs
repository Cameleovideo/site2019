using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Nop.Plugin.Cameleo.CameleoEvents.Domain
{   
    public static class CameleoUtilities
    {
        public static int AcceptPercentage(int EventUserCount, int AcceptedEventUserCount)
        {
            try
            {
                // Percentage of accepted users on the total number of users
                int percentage = (int)(((double)AcceptedEventUserCount / (double)EventUserCount) * 100);

                // Return 25% if real percentage is lower
                if (percentage < 25)
                {
                    return 25;
                }
                else
                {
                    return percentage;
                }
            }
            catch (Exception)
            {
                return 25;
            }
        }

        public static int AcceptRealPercentage(int EventUserCount, int AcceptedEventUserCount)
        {
            try
            {
                // Percentage of accepted users on the total number of users
                int percentage = (int)(((double)AcceptedEventUserCount / (double)EventUserCount) * 100);                
                return percentage;                
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}