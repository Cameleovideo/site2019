<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="AdminClient_EventShoot, App_Web_yu99bf98" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/EventShoot.ascx" TagName="EventShoot" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <h3>
        <asp:literal meta:resourcekey="EventShootHeaderResource1" runat="server"></asp:literal>
    </h3>   
         
    <table cellspacing="1" cellpadding="2" width="95%" >
        
        <tr>
            <td style="width: 50%;">                
            </td>
            <td>
            </td>
        </tr>
        <uc1:EventShoot id="EventDetail" runat="server" />
        
        <tr>
            <td colspan="2">                    
                <asp:linkbutton id="btnSaveProfile" runat="server" meta:resourcekey="btnSaveProfileResource1" OnClick="btnSaveProfile_Click"></asp:linkbutton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:linkbutton runat="server" id="btnSaleReport" runat="server" OnClick="btnSaleReport_Click">Rapport de ventes</asp:linkbutton>
            </td>
        </tr>
    </table>
    
    
</asp:Content>

