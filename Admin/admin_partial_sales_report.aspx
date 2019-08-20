<%@ page language="VB" autoeventwireup="false" masterpagefile="~/Admin/admin.master" inherits="Admin_admin_partial_sales_report, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<%@ Register Src="~/Modules/Client/PartialSalesReport.ascx" TagName="PartialSalesReport" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">    
	<uc2:PartialSalesReport id="ucReport" runat="server"/>     
</asp:Content>