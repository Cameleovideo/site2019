<%@ page language="VB" autoeventwireup="false" masterpagefile="~/Admin/admin.master" inherits="Admin_admin_return_report, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<%@ Register Src="~/Modules/Client/ReturnReport.ascx" TagName="ReturnReport" TagPrefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Taux de la ristourne (%): "></asp:Label>
    <asp:TextBox ID="txtReturnPercentage" runat="server" text="15"></asp:TextBox>
    <asp:Button ID="btnRecalculate" runat="server" Text="Recalculer" OnClick="btnRecalculate_Click" />    
    <asp:RequiredFieldValidator ControlToValidate="txtReturnPercentage" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RangeValidator runat="server" type="Integer" ControlToValidate="txtReturnPercentage"  MinimumValue="0" MaximumValue="100" ErrorMessage="Entre 0 et 100"></asp:RangeValidator>
    
    <br /><br />
	<uc2:ReturnReport id="ucReturnReport" runat="server"/>     
</asp:Content>