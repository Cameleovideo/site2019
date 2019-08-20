<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_rd_client_paiement, App_Web_kw1ulmho" title="Paiement" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <h1>Modes de paiement</h1>
    Le frais de pose est de :
    <asp:Label ID="lblMontantFraisPose" runat="server" Font-Bold="true"></asp:Label>
    <br /><br />
    Veuillez sélectionner le mode de paiement :
    <br /><br />
    
    <div style="margin-left: 20px">
        <asp:RadioButton ID="EnLigne" runat="server" GroupName="ModePaiement" Text=" En ligne" />
        <br />
        <asp:RadioButton ID="SurPlace" runat="server" GroupName="ModePaiement" Text=" Sur place" />
        <br />
        <asp:RadioButton ID="Reprise" runat="server" GroupName="ModePaiement" Text=" Reprise" />
        <br /><br />
        <asp:Button ID="btnValiderMode" runat="server" OnClick="btnValiderMode_Click" Text="Valider" />
    </div>
    
       
</asp:Content>

