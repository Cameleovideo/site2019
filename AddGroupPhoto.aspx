<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="AddGroupPhoto, App_Web_-wqcg8fv" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="infoZone" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main2" Runat="Server">
    <h4>
        <asp:label runat="server" meta:resourcekey="HeaderResource1"></asp:label>
    </h4>
    
    <asp:label runat="server" meta:resourcekey="MessageResource1"></asp:label><br /><br />
    <ul>
        <li>
            <asp:label runat="server" meta:resourcekey="MessageResource2"></asp:label>
        </li>
        <li>
            <asp:label runat="server" meta:resourcekey="MessageResource3"></asp:label>
        </li>
        <li>
            <asp:label runat="server" meta:resourcekey="MessageResource4"></asp:label>
        </li>
    </ul>
    
    <asp:radiobuttonlist id="lstChoices" runat="server">        
        <asp:ListItem value="2" meta:resourcekey="AddToCartResource1" selected="true"></asp:ListItem>        
        <asp:ListItem value="3" meta:resourcekey="AddToCartResource2"></asp:ListItem>        
        <asp:ListItem value="1" meta:resourcekey="DigitalRightsResource1"></asp:ListItem>
    </asp:radiobuttonlist>
    
    <asp:linkbutton id="btnReturn" runat="server" onclick="btnReturn_Click" meta:resourcekey="btnReturnResource1"></asp:linkbutton>

</asp:Content>

