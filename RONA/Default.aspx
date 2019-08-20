<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="RONA_Default, App_Web_pvajta5p" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    
     <br /><br /><br />
    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/logoSalon2010_BIL.gif" />
    <br /><br />
    <asp:loginview id="Loginview1" runat="server">
	    <AnonymousTemplate>
            <table style="width:30%;" >
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblHome" runat="server" meta:resourcekey="lblHomeResource1"></asp:Label>                
                        <br /><br />
                    </td>
                </tr>  
                <tr>
                    <td>
                        <asp:Label ID="lblLogin" runat="server" meta:resourcekey="lblLoginResource1"></asp:Label>
                        <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" meta:resourcekey="lblPasswordResource1"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>              
                <tr>
                    <td colspan="2">
                        <asp:imagebutton runat="server"	id="LoginButton" meta:resourcekey="LoginButtonResource1" AlternateText="login"  CssClass="button" OnClick="LoginButton_Click"/>    
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Label ID="lblError" ForeColor="red" visible="false" runat="server" meta:resourcekey="lblErrorResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <br /><br />           
        </AnonymousTemplate>
    </asp:loginview>   

</asp:Content>

