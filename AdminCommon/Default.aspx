<%@ page language="VB" autoeventwireup="false" masterpagefile="~/Albums.master" inherits="AdminCommon_Default, App_Web_n4n1mnp9" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/CommonUser.ascx" TagName="CommonUser" TagPrefix="uc1" %>

<asp:content id="Content1" contentplaceholderid="Main2" runat="server">    
    <div style="overflow:auto;height: 490px;">
        <h3>
            <asp:literal meta:resourcekey="AccountHeaderResource1" runat="server"></asp:literal>
        </h3>
        
         <h4>
            <asp:literal meta:resourcekey="OrderHistoryHeaderResource1" runat="server"></asp:literal>
        </h4>
        
        <div>
            <table >            
                <tr>
                    <td>                    
                        <asp:hyperlink navigateurl="~/MyOrders.aspx" meta:resourcekey="OrderHistoryLinkResource1" runat="server"></asp:hyperlink>
                    </td>
                </tr>
            </table>
        </div>
        <br /><hr/>
       
        <h4>
            <asp:literal meta:resourcekey="AccountResource1" runat="server"></asp:literal>
        </h4>
        <div>
            <table id="tblUpdateUserProperties" >
                <tr>
                <td style="width: 50%;">                
                </td>
                <td>
                </td>
            </tr>
            <uc1:CommonUser id="UserDetail" runat="server" />
            
            <tr>
                <td colspan="2">                    
                    <asp:linkbutton id="btnSaveProfile" runat="server" meta:resourcekey="btnSaveProfileResource1" OnClick="btnSaveProfile_Click" style="text-decoration:underline;"></asp:linkbutton>
                </td>
            </tr>
            </table>
        </div>
        <br /><hr/><br />
        
        
        <h4>
            <asp:literal meta:resourcekey="ChangePwdHeaderResource1" runat="server"></asp:literal>
        </h4>
        
        <div>         
            <asp:changepassword id="ChangePassword1" cancelbuttontype="Link" ChangePasswordButtonType="link" ContinueButtonType="link" meta:resourcekey="ChangePwd1Resource1" runat="server" >
                <FailureTextStyle HorizontalAlign="left"></FailureTextStyle>
                <LabelStyle HorizontalAlign="left"></LabelStyle>
            </asp:changepassword>        
        </div>
        <br /><hr/>   
    </div>
</asp:content>