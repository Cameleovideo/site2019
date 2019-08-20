<%@ page language="VB" autoeventwireup="false" masterpagefile="~/mastercart.master" inherits="AdminClient_Default, App_Web_yu99bf98" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Client.ascx" TagName="Client" TagPrefix="uc1" %>
<asp:content id="Content1" contentplaceholderid="Main2" runat="server">
    <h3>
        <asp:literal meta:resourcekey="ConfigurationHeaderResource1" runat="server"></asp:literal>
    </h3>   
         
    <table cellspacing="1" cellpadding="2" width="95%" >
        <tr>
            <td style="width: 50%;">                
            </td>
            <td>
            </td>
        </tr>
        <uc1:Client id="ClientDetail" runat="server" />
        <tr>
            <td>
                <asp:label id="EventShootLabel" runat="server" meta:resourcekey="EventShootLabelResource1"></asp:label>
            </td>
            <td>                    
                <asp:hyperlink id="EventShootLink" navigateurl="EventShoot.aspx" meta:resourcekey="EventShootLinkResource1" runat="server"></asp:hyperlink>
            </td>
        </tr>
        <tr>
            <td colspan="2">                    
                <asp:linkbutton id="btnSaveProfile" runat="server" meta:resourcekey="btnSaveProfileResource1" OnClick="btnSaveProfile_Click"></asp:linkbutton>
            </td>
        </tr>
    </table>    
    <hr />
</asp:content>