<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_rd_client_confirmation, App_Web_kw1ulmho" title="Confirmation du rendez-vous" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <h1>Confirmation de la r�servation</h1>
    <div style="margin-left: 20px">
        Votre rendez-vous a �t� r�serv� avec succ�s !
        <br />
        Veuillez bien prendre note de la date et l'heure exacte de votre rendez-vous
        <br /><br />
        <asp:Label ID="lblRappelRendezVous" runat="server" Font-Bold="true"></asp:Label>
    </div>
    <br />
    <br />
    <asp:LinkButton ID="lnkReturnCalendar" runat="server" PostBackUrl="~/Admin/admin_rd_client_calendrier.aspx">Retourner au calendrier</asp:LinkButton>
</asp:Content>

