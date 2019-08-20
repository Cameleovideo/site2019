<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="Help_Merge, App_Web_zmq_q979" enableEventValidation="false" stylesheettheme="White" %>

<asp:Content ID="Content1" ContentPlaceHolderID="infoZone" Runat="Server">
    <br />
    <asp:label ID="Label1" runat="server" meta:resourcekey="ContactResource1"></asp:label>
    <br /><br />
    <a href="ContactUs.aspx">
        <asp:label ID="Label2" runat="server" meta:resourcekey="ContactResource2"></asp:label>
    </a>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Main2" Runat="Server">
    <h3>
        <asp:label ID="Label3" runat="server" meta:resourcekey="HeaderResource1"></asp:label>
    </h3>
    
    <table width="95%" >
        <tr style="vertical-align: top;">
            <td>
                <a name="merge"></a>                
                <asp:label ID="Label5" runat="server" meta:resourcekey="MergeResource1"></asp:label>                
                <ol>
                    <li>
                        <asp:label ID="Label6" runat="server" meta:resourcekey="MergeResource2"></asp:label>
                    </li>
                    <li>
                        <asp:label ID="Label7" runat="server" meta:resourcekey="MergeResource3"></asp:label>
                    </li>
                    <li>
                        <asp:label ID="Label8" runat="server" meta:resourcekey="MergeResource4"></asp:label>
                    </li>                    
                    <li>
                        <asp:label ID="Label9" runat="server" meta:resourcekey="MergeResource5"></asp:label>
                    </li>                     
                </ol>                   
            </td>
            
        </tr>
    </table>
</asp:Content>