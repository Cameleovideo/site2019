<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="Help_MyProfile, App_Web_zmq_q979" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="infoZone" Runat="Server">
    <br />
    <asp:label runat="server" meta:resourcekey="ContactResource1"></asp:label>
    <br /><br />
    <a href="ContactUs.aspx">
        <asp:label runat="server" meta:resourcekey="ContactResource2"></asp:label>
    </a>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main2" Runat="Server">
    <h3>
        <asp:label runat="server" meta:resourcekey="HeaderResource1"></asp:label>
    </h3>
    
    <table width="95%" >
        <tr style="vertical-align: top;">
            <td>
                <a name="modifyinfo"></a>
                <h4>
                    <asp:label runat="server" meta:resourcekey="ModifyProfileResource1"></asp:label>                                        
                </h4>                
                <asp:label runat="server" meta:resourcekey="ModifyProfileResource2"></asp:label>
                <asp:bulletedlist runat="server" BulletStyle="numbered">
                    <asp:ListItem meta:resourcekey="ModifyProfileResource3"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="ModifyProfileResource4"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="ModifyProfileResource5"></asp:ListItem>
                </asp:bulletedlist>
                
            
            
            
                
                <a name="modifypassword"></a>
                <h4>
                    <asp:label runat="server" meta:resourcekey="ModifyPasswordResource1"></asp:label>
                </h4>
                <asp:label runat="server" meta:resourcekey="ModifyPasswordResource2"></asp:label>
                <asp:bulletedlist runat="server" BulletStyle="numbered">
                    <asp:ListItem meta:resourcekey="ModifyPasswordResource3"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="ModifyPasswordResource4"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="ModifyPasswordResource5"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="ModifyPasswordResource6"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="ModifyPasswordResource7"></asp:ListItem>		            
                </asp:bulletedlist>
            
            
            
            
                <a name="forgotpassword"></a>
                <h4>
                    <asp:label runat="server" meta:resourcekey="ForgotPasswordResource1"></asp:label>
                </h4>
                <asp:label runat="server" meta:resourcekey="ForgotPasswordResource2"></asp:label>
                <asp:bulletedlist runat="server" BulletStyle="numbered">
                    <asp:ListItem meta:resourcekey="ForgotPasswordResource3"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="ForgotPasswordResource4"></asp:ListItem>		            		            
                </asp:bulletedlist>
                
                <asp:label runat="server" meta:resourcekey="ForgotPasswordResource5"></asp:label>
                <br /><br />                
                <asp:label runat="server" meta:resourcekey="ForgotPasswordResource6"></asp:label>
		            
		        
          
                <a name="orderhistory"></a>
                <h4>
                    <asp:label runat="server" meta:resourcekey="OrderHistoryResource1"></asp:label>
                </h4>
                <asp:label runat="server" meta:resourcekey="OrderHistoryResource2"></asp:label>
                <asp:bulletedlist runat="server" BulletStyle="numbered">
                    <asp:ListItem meta:resourcekey="OrderHistoryResource3"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="OrderHistoryResource4"></asp:ListItem>
		            <asp:ListItem meta:resourcekey="OrderHistoryResource5"></asp:ListItem>
                </asp:bulletedlist>
            
            </td>
            
        </tr>
    </table>

</asp:Content>

