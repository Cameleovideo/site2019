﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nop.Web.Framework;
using Nop.Web.Framework.Mvc;

namespace Nop.Plugin.Cameleo.CameleoEvents.ViewModels
{
    public class CustomerEventSubjectNameListViewModel : BaseNopModel
    {
        public CustomerEventSubjectNameListViewModel()
        {
            CameleoEventSubjectNameList = new List<CustomerEventSubjectNameViewModel>();
        }

        public IList<CustomerEventSubjectNameViewModel> CameleoEventSubjectNameList { get; set; } 
    }
}