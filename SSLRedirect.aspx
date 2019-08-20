<%@ page language="VB" masterpagefile="~/Default.master" autoeventwireup="false" inherits="SSLRedirect, App_Web_xkuvhdkn" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <%               
        Dim SiteRoot As String = Utility.GetSiteRoot()
        SiteRoot = SiteRoot.Replace("http://", "https://")
        Response.Redirect(SiteRoot)
    %>
</asp:Content>

