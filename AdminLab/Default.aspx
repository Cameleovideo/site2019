<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="AdminLab_Default, App_Web_q_tp4egx" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Laboratory.ascx" TagName="Laboratory" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

    <h3>
        <asp:literal meta:resourcekey="LaboratoryHeaderResource1" runat="server"></asp:literal>
    </h3>   
         
    <table cellspacing="1" cellpadding="2" width="95%" >
        
        <tr>
            <td style="width: 50%;">                
            </td>
            <td>
            </td>
        </tr>
        <uc1:Laboratory id="LaboratoryDetail" runat="server" />
        
        <tr>
            <td colspan="2">                    
                <asp:linkbutton id="btnSaveProfile" runat="server" meta:resourcekey="btnSaveProfileResource1" OnClick="btnSaveProfile_Click"></asp:linkbutton>
            </td>
        </tr>
    </table>

</asp:Content>

