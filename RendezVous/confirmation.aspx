<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="RendezVous_confirmation, App_Web_hsfuruo7" title="Rendez-vous : Confirmation" stylesheettheme="White" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

     <div id="home" class="page">
        <h3 style="text-align:center;"><asp:literal ID="paiementHeader" runat="server" text="<%$ Resources: confirmationHeader  %>"></asp:literal></h3>
        <hr />        
        <asp:Label ID="lblConfirmationText" runat="server" meta:resourcekey="lblConfirmationTextResource1"></asp:Label> 
        <asp:Label ID="lblRappelRendezVous" runat="server" Font-Bold="true" style="margin-left: 20px"></asp:Label>
        <br /><br /><br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx" meta:resourcekey="lnkReturnHomeResource1"></asp:LinkButton>
    </div>

</asp:Content>

