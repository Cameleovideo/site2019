<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="Help_Order, App_Web_zmq_q979" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
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
                <a name="placeorder"></a>
                <h4>
                    <asp:label runat="server" meta:resourcekey="PlaceOrderResource1"></asp:label>
                </h4>
                <asp:label runat="server" meta:resourcekey="PlaceOrderResource2"></asp:label>                
                <ol>
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource3"></asp:label>
                    </li>
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource4"></asp:label>
                    </li>
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource5"></asp:label>
                    </li>                    
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource6"></asp:label>
                    </li> 
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource7"></asp:label>
                    </li> 
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource8"></asp:label>
                    </li> 
                </ol>
                <asp:label runat="server" meta:resourcekey="PlaceOrderResource9"></asp:label> <br /><br />               
                <asp:label runat="server" meta:resourcekey="PlaceOrderResource10"></asp:label>                
                <ol>
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource11"></asp:label>
                    </li>
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource12"></asp:label>
                    </li>
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource13"></asp:label>
                    </li>                    
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource14"></asp:label>
                    </li> 
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource15"></asp:label>
                    </li> 
                    <li>
                        <asp:label runat="server" meta:resourcekey="PlaceOrderResource16"></asp:label>
                    </li> 
                </ol>
                
                <a name="paymenttype"></a>
                <h4>
                    <asp:label runat="server" meta:resourcekey="PaymentTypeResource1"></asp:label>
                </h4>
                <asp:label runat="server" meta:resourcekey="PaymentTypeResource2"></asp:label>
                
                <h5><asp:label runat="server" meta:resourcekey="PaymentTypeResource3"></asp:label></h5>
                <asp:label runat="server" meta:resourcekey="PaymentTypeResource6"></asp:label>
                
                <h5><asp:label runat="server" meta:resourcekey="PaymentTypeResource4"></asp:label></h5>
                <asp:label runat="server" meta:resourcekey="PaymentTypeResource7"></asp:label>
                
                <h5><asp:label runat="server" meta:resourcekey="PaymentTypeResource5"></asp:label></h5>
                <asp:label runat="server" meta:resourcekey="PaymentTypeResource8"></asp:label><br /><br /><br />


                
                
                <a name="security"></a>
                <h4>
                    <asp:label runat="server" meta:resourcekey="SecurityResource1"></asp:label>
                </h4>
                <asp:Image runat="server" ImageUrl="../Images/moneris_fr.jpg" /><br />
                <asp:label runat="server" meta:resourcekey="SecurityResource2"></asp:label><br /><br />
                
                <table>
                    <tr id="trBMO" runat="server" meta:resourcekey="trBMOResource1">
                        <td colspan="2">
                            <asp:Image runat="server" ImageUrl="../Images/logo_bmo_fr.gif" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image id="logoRBC" meta:resourcekey="logoRBCResource1" runat="server" /><br />
                        </td>
                        <td>
                            <asp:label runat="server" meta:resourcekey="SecurityResource4"></asp:label>
                        </td>
                    </tr>
                </table>
                <br /><br />
                
                <table id="tblDebit" runat="server" meta:resourcekey="tblDebitResource1">>
                    <tr valign="top">
                        <td>
                            <asp:Image ID="Image12" runat="server" meta:resourcekey="DebitLogoResource1"/>        
                        </td>
                        <td>
                            <asp:Literal ID="DebitMessage" meta:resourcekey="DebitMessageResource1" runat="server"></asp:Literal>
                            <br /><br /><br />
                        </td>
                    </tr>
                </table>
                
                <asp:Image runat="server" ImageUrl="../Images/icons/icon_secure.gif" />
                <asp:Image runat="server" ImageUrl="../Images/ccs.gif" />   <br />
                <asp:label runat="server" meta:resourcekey="SecurityResource3"></asp:label>
                                                
            </td>
            
        </tr>
    </table>
</asp:Content>

