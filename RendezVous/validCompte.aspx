<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="RendezVous_validCompte, App_Web_hsfuruo7" title="ValidationCompte" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

     <h4><asp:literal ID="etatCreationCompte" runat="server" text="<%$ Resources: etatCreationCompte  %>"></asp:literal></h4>
     <h4><asp:Literal ID="etatActiverCompte" runat="server" Visible="false" Text="<%$ Resources: etatActiverCompte %>"></asp:Literal></h4>
     <asp:label id="verifEmail" runat="server" meta:resourcekey="verifEmailResource1"></asp:label>
     <asp:Label ID="directive" runat="server" meta:resourcekey="directiveResource1" Visible="false"></asp:Label>
     <br /><br />
     <asp:HyperLink ID="lnkAccueil" runat="server" meta:resourcekey="lnkAccueilResource1" NavigateUrl="~/Default.aspx" Visible="false"></asp:HyperLink> 

    <asp:Label ID="lblMailMess1" runat="server" meta:resourcekey="lblMailMess1Resource1" Visible="false"></asp:Label>
    <asp:Label ID="lblMailMess2" runat="server" meta:resourcekey="lblMailMess2Resource1" Visible="false"></asp:Label>
    <asp:Label ID="lblMailMess3" runat="server" meta:resourcekey="lblMailMess3Resource1" Visible="false"></asp:Label>
    <asp:Label ID="lblMailSubject" runat="server" meta:resourcekey="lblMailSubjectResource1" Visible="false"></asp:Label>
    
</asp:Content>

