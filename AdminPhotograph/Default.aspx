<%@ page language="VB" autoeventwireup="false" masterpagefile="~/mastercart.master" inherits="AdminPhotograph_Default, App_Web_2nbfwqwe" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Photograph.ascx" TagName="Photograph" TagPrefix="uc1" %>
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
        <uc1:Photograph id="PhotographDetail" runat="server" />           
        <tr>
            <td colspan="2">                    
                <asp:linkbutton id="btnSaveProfile" runat="server" meta:resourcekey="btnSaveProfileResource1" OnClick="btnSaveProfile_Click"></asp:linkbutton>
            </td>
        </tr>
    </table>  
    <hr />
</asp:content>