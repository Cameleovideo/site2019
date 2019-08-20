<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="Help_PurchaseConditions, App_Web_zmq_q979" enableEventValidation="false" stylesheettheme="White" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Main2" Runat="Server">
    <h3>
        <asp:label ID="Label3" runat="server" meta:resourcekey="HeaderResource1"></asp:label>
    </h3>
    
    <table width="100%" >
        <tr style="vertical-align: top;text-align:justify;">
            <td>                                
                <h3>
                    <asp:label ID="lblPurchaseHeader" runat="server" meta:resourcekey="lblPurchaseHeaderResource1"></asp:label>
                </h3>          
                                      
                <a name="order"></a>
                <h4>
                    <asp:label ID="lblOrder" runat="server" meta:resourcekey="lblOrderResource1"></asp:label>
                </h4>
                <asp:label ID="Label12" runat="server" meta:resourcekey="PlaceOrderResource2"></asp:label>                
                <ol>
                    <li>
                        <asp:label ID="Label20" runat="server" meta:resourcekey="PlaceOrderResource3"></asp:label>
                    </li>
                    <li>
                        <asp:label ID="Label21" runat="server" meta:resourcekey="PlaceOrderResource4"></asp:label>
                    </li>
                    <li>
                        <asp:label ID="Label22" runat="server" meta:resourcekey="PlaceOrderResource5"></asp:label>
                    </li>                    
                    <li>
                        <asp:label ID="Label23" runat="server" meta:resourcekey="PlaceOrderResource6"></asp:label>
                    </li> 
                    <li>
                        <asp:label ID="Label24" runat="server" meta:resourcekey="PlaceOrderResource7"></asp:label>
                    </li> 
                    <li>
                        <asp:label ID="Label25" runat="server" meta:resourcekey="PlaceOrderResource8"></asp:label>
                    </li> 
                </ol>                
                
                <asp:label ID="Label13" runat="server" meta:resourcekey="PlaceOrderResource10"></asp:label>                
                <ol>
                    <li>
                        <asp:label ID="Label14" runat="server" meta:resourcekey="PlaceOrderResource11"></asp:label>
                    </li>
                    <li>
                        <asp:label ID="Label15" runat="server" meta:resourcekey="PlaceOrderResource12"></asp:label>
                    </li>
                    <li>
                        <asp:label ID="Label16" runat="server" meta:resourcekey="PlaceOrderResource13"></asp:label>
                    </li>                    
                    <li>
                        <asp:label ID="Label17" runat="server" meta:resourcekey="PlaceOrderResource14"></asp:label>
                    </li> 
                    <li>
                        <asp:label ID="Label18" runat="server" meta:resourcekey="PlaceOrderResource15"></asp:label>
                    </li> 
                    <li>
                        <asp:label ID="Label19" runat="server" meta:resourcekey="PlaceOrderResource16"></asp:label>
                    </li> 
                </ol>
                
                
                <a name="paymentmethods"></a>
                <br /><br />
                <h4>
                    <asp:label ID="lblPaymentMethods" runat="server" meta:resourcekey="lblPaymentMethodsResource1"></asp:label>
                </h4>
                <asp:label ID="Label5" runat="server" meta:resourcekey="PaymentTypeResource2"></asp:label>
                
                <h5><asp:label ID="Label6" runat="server" meta:resourcekey="PaymentTypeResource3"></asp:label></h5>
                <asp:label ID="Label7" runat="server" meta:resourcekey="PaymentTypeResource6"></asp:label>
                
                <h5><asp:label ID="Label8" runat="server" meta:resourcekey="PaymentTypeResource4"></asp:label></h5>
                <asp:label ID="Label9" runat="server" meta:resourcekey="PaymentTypeResource7"></asp:label>
                
                <h5><asp:label ID="Label10" runat="server" meta:resourcekey="PaymentTypeResource5"></asp:label></h5>
                <asp:label ID="Label11" runat="server" meta:resourcekey="PaymentTypeResource8"></asp:label>                
                
                <a name="security"></a>
                <br /><br /><br />
                <h4>
                    <asp:label ID="lblSecurity" runat="server" meta:resourcekey="lblSecurityResource1"></asp:label>
                </h4>
                <asp:Image ID="Image1" runat="server" ImageUrl="../Images/moneris_fr.jpg" /><br />
                <asp:label ID="Label1" runat="server" meta:resourcekey="SecurityResource2"></asp:label><br /><br />
                
                <table>
                    <tr id="trBMO" runat="server" meta:resourcekey="trBMOResource1">
                        <td colspan="2">
                            <asp:Image ID="Image2" runat="server" ImageUrl="../Images/logo_bmo_fr.gif" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image id="logoRBC" meta:resourcekey="logoRBCResource1" runat="server" /><br />
                        </td>
                        <td>
                            <asp:label ID="Label2" runat="server" meta:resourcekey="SecurityResource4"></asp:label>
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
                
                <asp:Image ID="Image3" runat="server" ImageUrl="../Images/icons/icon_secure.gif" />
                <asp:Image ID="Image4" runat="server" ImageUrl="../Images/ccs.gif" />   <br />
                <asp:label ID="Label4" runat="server" meta:resourcekey="SecurityResource3"></asp:label>
                
                <a name="shipping"></a>
                <br /><br /><br />
                <h4>
                    <asp:label ID="lblShipping" runat="server" meta:resourcekey="lblShippingResource1"></asp:label>
                </h4>
                <asp:label ID="lblShipping2" runat="server" meta:resourcekey="lblShippingResource2"></asp:label>
                
                <a name="returns"></a>
                <br /><br /><br />
                <h4>
                    <asp:label ID="lblSatisfaction" runat="server" meta:resourcekey="lblSatisfactionResource1"></asp:label>
                </h4>
                <asp:label ID="lblSatisfaction2" runat="server" meta:resourcekey="lblSatisfactionResource2"></asp:label>
                                
            </td>
            
        </tr>
    </table>
</asp:Content>