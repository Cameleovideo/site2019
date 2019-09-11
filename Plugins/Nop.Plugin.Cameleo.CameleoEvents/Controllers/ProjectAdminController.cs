using System;
using System.Drawing;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using Nop.Core;
using Nop.Web.Framework.Controllers;
using Nop.Web.Framework.Kendoui;
using Nop.Web.Framework.Mvc;
using Nop.Admin.Controllers;
using Nop.Plugin.Cameleo.CameleoEvents.Services;
using Nop.Plugin.Cameleo.CameleoEvents.Domain;
using Nop.Plugin.Cameleo.CameleoEvents.ViewModels;
using Nop.Services.Localization;
using Nop.Services.Helpers;
using Nop.Services.Security;


namespace Nop.Plugin.Cameleo.CameleoEvents.Controllers
{
    public class ProjectAdminController : BaseAdminController
    {
        #region Fields
        private readonly ICameleoProjectCategoryService _projectCategoryService;
        private readonly ICameleoProjectSubCategoryService _projectSubCategoryService;
        /*private readonly ICameleoEventService _eventService;
        private readonly ICameleoEventUserService _eventUserService;
        private readonly ICameleoCustomerEventService _customerEventService;*/
        private readonly IWorkContext _workContext;
        private readonly IPermissionService _permissionService;        
        private readonly ILocalizationService _localizationService;
        private readonly ILocalizedEntityService _localizedEntityService;
        private readonly ILanguageService _languageService;
        private readonly IDateTimeHelper _dateTimeHelper;        
        #endregion

        #region Ctor
        public ProjectAdminController(IWorkContext workContext, ICameleoProjectCategoryService projectCategoryService, ILanguageService languageService,
                //ICameleoEventService eventService, ICameleoEventUserService eventUserService,ICameleoCustomerEventService customerEventService, 
                IPermissionService permissionService, ILocalizationService localizationService, ILocalizedEntityService localizedEntityService,
                IDateTimeHelper dateTimeHelper, ICameleoWorkflowMessageService cameleoWorkflowMessageService, ICameleoProjectSubCategoryService projectSubCategoryService)
        {
            _workContext = workContext;
            _projectCategoryService = projectCategoryService;
            _projectSubCategoryService = projectSubCategoryService;
            /*_eventService = eventService;
            _eventUserService = eventUserService;
            _customerEventService = customerEventService; */
            _permissionService = permissionService;            
            _localizationService = localizationService;
            _localizedEntityService = localizedEntityService;
            _dateTimeHelper = dateTimeHelper;
            _languageService = languageService;
        }
        #endregion

        #region Utilities

        [NonAction]
        protected virtual void UpdateLocales(CameleoProjectCategory projectCategory, ProjectCategoryViewModel model)
        {
            foreach (var localized in model.Locales)
            {
                _localizedEntityService.SaveLocalizedValue( projectCategory, 
                                                            x => x.Name, 
                                                            localized.Name, 
                                                            localized.LanguageId);

                _localizedEntityService.SaveLocalizedValue(projectCategory,
                                                            x => x.Description,
                                                            localized.Description,
                                                            localized.LanguageId);
            }
        }

        protected virtual void UpdateLocales(CameleoProjectSubCategory projectSubCategory, ProjectSubCategoryViewModel model)
        {
            foreach (var localized in model.Locales)
            {
                _localizedEntityService.SaveLocalizedValue(projectSubCategory,
                                                            x => x.Name,
                                                            localized.Name,
                                                            localized.LanguageId);

                _localizedEntityService.SaveLocalizedValue(projectSubCategory,
                                                            x => x.Description,
                                                            localized.Description,
                                                            localized.LanguageId);
            }
        }
       
        #endregion

        #region ProjectCategories

        [AdminAuthorize]
        public ActionResult List()
        {
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/List.cshtml");
        }

        [HttpPost, AdminAuthorize]
        public ActionResult ProjectCategoryList(DataSourceRequest command)
        {
            var projectCategoryModel = _projectCategoryService.GetProjectCategoryListViewModel();

            var gridModel = new DataSourceResult
            {
                Data = projectCategoryModel.ProjectCategoryList,
                Total = projectCategoryModel.ProjectCategoryList.Count
            };

            return Json(gridModel);
        }

        [AdminAuthorize]
        public ActionResult Create()
        {
            var model = new ProjectCategoryViewModel();
            
            //locales
            AddLocales(_languageService, model.Locales);            
            
            //default values
            model.CreatedOnUtc = DateTime.UtcNow;
            
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/Create.cshtml", model);
        }

        [HttpPost, AdminAuthorize, ParameterBasedOnFormName("save-continue", "continueEditing")]
        public ActionResult Create(ProjectCategoryViewModel model, bool continueEditing)
        {           
            if (ModelState.IsValid)
            {
                var projectCategory = new CameleoProjectCategory();
                projectCategory.Name = model.Name;
                projectCategory.Description = model.Description;
                projectCategory.CreatedOnUtc = model.CreatedOnUtc;
                _projectCategoryService.InsertProjectCategory(projectCategory);

                //locales
                UpdateLocales(projectCategory, model);

                SuccessNotification(_localizationService.GetResource("Plugins.Cameleo.ProjectCategories.Added"));
                return continueEditing ? RedirectToAction("Edit", new { id = projectCategory.Id }) : RedirectToAction("List");
            }

            //If we got this far, something failed, redisplay form                                  
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/Create.cshtml", model);
        }

        [AdminAuthorize]
        public ActionResult Edit(int id)
        {        
            //Get Category
            var category = _projectCategoryService.GetProjectCategoryById(id);
            if (category == null)
            {
                //No category found with the specified id
                return RedirectToAction("List");
            }

            var model = _projectCategoryService.GetProjectCategoryViewModel(id);                     

            //locales
            AddLocales(_languageService, model.Locales, (locale, languageId) =>
            {
                locale.Name = category.GetLocalized(x => x.Name, languageId, false, false);
                locale.Description = category.GetLocalized(x => x.Description, languageId, false, false);
            });

            
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/Edit.cshtml", model);
        }


        [AdminAuthorize, HttpPost, ParameterBasedOnFormName("save-continue", "continueEditing")]
        public ActionResult Edit(ProjectCategoryViewModel model, bool continueEditing)
        {
            //Get Category
            var category = _projectCategoryService.GetProjectCategoryById(model.Id);
            if (category == null)
            {
                //No category found with the specified id
                return RedirectToAction("List");
            }

            //Valid model?
            if (ModelState.IsValid)
            {
                //Yes
                
                //Update
                category.Name = model.Name;
                category.Description = model.Description;
                _projectCategoryService.UpdateProjectCategory(category);

                //locales
                UpdateLocales(category, model);                
                SuccessNotification(_localizationService.GetResource("Plugins.Cameleo.ProjectCategories.Updated"));

                if (continueEditing)
                {
                    //selected tab
                    SaveSelectedTabIndex();

                    return RedirectToAction("Edit", new { id = category.Id });
                }
                else
                {
                    return RedirectToAction("List");
                }
            }

            //If we got this far, something failed, redisplay form
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/Edit.cshtml", model);
        }


        [AdminAuthorize, HttpPost]
        public ActionResult Delete(int id)
        {
            //Get Category
            var category = _projectCategoryService.GetProjectCategoryById(id);
            if (category == null)
            {
                //No category found with the specified id
                return RedirectToAction("List");
            }

            try
            {
                //Check if associated sub categories
                if (_projectSubCategoryService.GetAllProjectSubCategoriesForCategory(id).Count > 0)
                {
                    //Yes, can't delete
                    throw new NopException(_localizationService.GetResource("Plugins.Cameleo.ProjectCategories.HasSubCategories"));
                }

                //Delete category
                _projectCategoryService.DeleteProjectCategory(category);

                SuccessNotification(_localizationService.GetResource("Plugins.Cameleo.ProjectCategories.Deleted"));
                return RedirectToAction("List");
            }
            catch (Exception exc)
            {
                ErrorNotification(exc);
                return RedirectToAction("Edit", new { id = category.Id });
            }
        }
        #endregion

        #region ProjectSubCategories

        [AdminAuthorize, HttpPost]
        public ActionResult SubCategories(int categoryId, DataSourceRequest command)
        {
            var projectSubCategoryModel = _projectSubCategoryService.GetProjectSubCategoryListViewModel(categoryId);

            var gridModel = new DataSourceResult
            {
                Data = projectSubCategoryModel.ProjectSubCategoryList,
                Total = projectSubCategoryModel.ProjectSubCategoryList.Count
            };

            return Json(gridModel);
        }

        //create
        [AdminAuthorize]
        public ActionResult SubCategoryCreatePopup(int projectCategoryId)
        {
            var model = new ProjectSubCategoryViewModel();
            model.ProjectCategoryId = projectCategoryId;

            //default values
            model.CreatedOnUtc = DateTime.UtcNow;

            //locales
            AddLocales(_languageService, model.Locales);
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/SubCategoryCreatePopup.cshtml", model);
        }

        [AdminAuthorize, HttpPost]
        public ActionResult SubCategoryCreatePopup(string btnId, string formId, ProjectSubCategoryViewModel model)
        {
            //Get Category
            var category = _projectCategoryService.GetProjectCategoryById(model.ProjectCategoryId);
            if (category == null)
            {
                //No category found with the specified id
                return RedirectToAction("List");
            }

            if (ModelState.IsValid)
            {
                var projectSubCategory = new CameleoProjectSubCategory();
                projectSubCategory.ProjectCategoryId = model.ProjectCategoryId;
                projectSubCategory.Name = model.Name;
                projectSubCategory.Description = model.Description;
                projectSubCategory.CreatedOnUtc = model.CreatedOnUtc;
                _projectSubCategoryService.InsertProjectSubCategory(projectSubCategory);

                UpdateLocales(projectSubCategory, model);

                ViewBag.RefreshPage = true;
                ViewBag.btnId = btnId;
                ViewBag.formId = formId;
                return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/SubCategoryCreatePopup.cshtml", model);
            }

            //If we got this far, something failed, redisplay form
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/SubCategoryCreatePopup.cshtml", model);
        }

        
        //edit
        [AdminAuthorize]
        public ActionResult SubCategoryEditPopup(int id)
        {
            //Get Sub Category
            var subCategory = _projectSubCategoryService.GetProjectSubCategoryById(id);
            if (subCategory == null)
            {
                //No sub category found with the specified id
                return RedirectToAction("List");
            }

            var model = _projectSubCategoryService.GetProjectSubCategoryViewModel(id);

            //locales
            AddLocales(_languageService, model.Locales, (locale, languageId) =>
            {
                locale.Name = subCategory.GetLocalized(x => x.Name, languageId, false, false);
                locale.Description = subCategory.GetLocalized(x => x.Description, languageId, false, false);
            });

            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/SubCategoryEditPopup.cshtml", model);
        }

        [AdminAuthorize, HttpPost]
        public ActionResult SubCategoryEditPopup(string btnId, string formId, ProjectSubCategoryViewModel model)
        {
            //Get Sub Category
            var subCategory = _projectSubCategoryService.GetProjectSubCategoryById(model.Id);
            if (subCategory == null)
            {
                //No sub category found with the specified id
                return RedirectToAction("List");
            }

            if (ModelState.IsValid)
            {
                subCategory.Name = model.Name;
                subCategory.Description = model.Description;
                _projectSubCategoryService.UpdateProjectSubCategory(subCategory);

                UpdateLocales(subCategory, model);

                ViewBag.RefreshPage = true;
                ViewBag.btnId = btnId;
                ViewBag.formId = formId;
                return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/SubCategoryEditPopup.cshtml", model);
            }

            //If we got this far, something failed, redisplay form
            return View("~/Plugins/Cameleo.CameleoEvents/Views/Admin/Project/SubCategoryEditPopup.cshtml", model);
        }
         

        [AdminAuthorize, HttpPost]
        public ActionResult SubCategoryDelete(int id)
        {            
            var subCategory = _projectSubCategoryService.GetProjectSubCategoryById(id);
            if (subCategory == null)
            {
                throw new ArgumentException("No sub category found with the specified id");
            }

            //TODO already in a teachers account
            /*if (_addressService.GetAddressTotalByStateProvinceId(state.Id) > 0)
            {
                return Json(new DataSourceResult() { Errors = _localizationService.GetResource("Admin.Configuration.Countries.States.CantDeleteWithAddresses") });
            }*/

            //int countryId = state.CountryId;
            _projectSubCategoryService.DeleteProjectSubCategory(subCategory);

            return new NullJsonResult();
        }

        #endregion

    }
}
