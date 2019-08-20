<%@ page validaterequest="false" language="vb" masterpagefile="~/general.master" autoeventwireup="true" inherits="CheckoutConfirm, App_Web_-wqcg8fv" title="Confirm Your Order" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="Modules/PPStandardCheckout.ascx" TagName="PPStandardCheckout" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

    <h5> 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="basket.aspx">      
            <asp:label id="BasketLabel" runat="server" meta:resourcekey="BasketLabelResource1" Font-Underline="true"></asp:label>        
        </asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="checkout.aspx">
            <asp:label id="ShippingLabel" runat="server" meta:resourcekey="ShippingLabelResource1" Font-Underline="true"></asp:label>        
        </asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="billing.aspx">
            <asp:label id="BillingLabel" runat="server" meta:resourcekey="BillingLabelResource1" Font-Underline="true"></asp:label>        
        </asp:HyperLink>
        <asp:label cssclass="checkoutlink" id="ConfirmLabel" runat="server" meta:resourcekey="ConfirmLabelResource1"></asp:label>        
    </h5>
    
    
    <h4>
        <asp:label runat="server" meta:resourcekey="CheckoutConfirmHeaderResource1"></asp:label>
    </h4>
    
    <table border="0" cellpadding="5" cellspacing="0" >
        <tr>
            <td valign="top">    	            
	            <table width="100%">
		            <tr>
			            <td  class="sectionheader" >
			                <asp:label id="ShippingHeaderLabel" runat="server" meta:resourcekey="ShippingHeaderLabelResource1"></asp:label>        
			            </td>
			            <td  class="sectionheader" >			            
			                <asp:label id="BillingHeaderLabel" runat="server" meta:resourcekey="BillingHeaderLabelResource1"></asp:label>        
			            </td>
		            </tr>
		            <tr>
			            <td>
				            <table width="100%" >
					            <tr>
						            <td>
							            <div >
							            <asp:Label id="lblShipName" runat="server"></asp:Label><br/>
							            <asp:Label id="lblShipAddress1" runat="server"></asp:Label><br/>
							            <asp:Label id="lblShipAddress2" runat="server"></asp:Label>
							            <asp:Label id="lblShipCity" runat="server"></asp:Label>,
							            <asp:Label id="lblShipState" runat="server"></asp:Label>&nbsp;&nbsp;
							            <asp:Label id="lblShipZip" runat="server"></asp:Label><br/>
							            <asp:Label id="lblShipCountry" runat="server"></asp:Label>							            
							            </div>
						            </td>
					            </tr>
				            </table>    						 
			            </td>
			            <td >
				            <table width="100%">
					            <tr>
						             <td>
							            <div>
							            <asp:Label id="lblName" runat="server"></asp:Label><br />
							            <asp:Label id="lblAddress1" runat="server"></asp:Label><br/>
							            <asp:Label id="lblAddress2" runat="server"></asp:Label>
							            <asp:Label id="lblCity" runat="server"></asp:Label>,
							            <asp:Label id="lblState" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label id="lblZip" runat="server"></asp:Label><br/>
							            <asp:Label id="lblCountry" runat="server"></asp:Label>                                    
							            </div>
						            </td>
					            </tr>
				             </table>
			             </td>
		            </tr>	             		                
		            <tr>
			            <td  class="sectionheader" >			                
			                <br /><asp:label id="ShippingOptionsLabel" runat="server" meta:resourcekey="ShippingOptionsLabelResource1"></asp:label>
			            </td>
			            <td valign="bottom">
			                <asp:DropDownList Runat="server" ID="ddlShipService" AutoPostBack="True" OnSelectedIndexChanged="ddlShipService_SelectedIndexChanged">
			                </asp:DropDownList>
			                <br /><asp:label id="FreeShippingLabel" forecolor="red" runat="server" meta:resourcekey="FreeShippingLabelResource1" visible="false"></asp:label>
		                </td>
			            
	                </tr> 
	                               
	                <tr>
		                <td class="sectionheader" valign="top">                            
                            <br /><asp:label ID="Label1" runat="server" meta:resourcekey="PaymentMethodResource1"></asp:label>
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
		                <td colspan="2">
                            <div class=plainbox>
                                <asp:RadioButtonList ID="radPayType"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="PayMethodIndex_Changed">				                            
                                </asp:RadioButtonList>                                
                            </div>
                        </td>
	                </tr>                
	                  			
	            </table>           
	           
    			
	            <br />
                <table width="100%">
			        <tr>
			            <td  class="sectionheader" colspan="2">
			                <asp:label id="OrderDetailLabel" runat="server" meta:resourcekey="OrderDetailLabelResource1"></asp:label>
			            </td>
		            </tr>
		            <tr>
			            <td>
				            <asp:GridView ID="dgBasket" Runat="server" AutoGenerateColumns="False" Width="100%" onrowdatabound="dgBasket_RowDataBound">
					            <EmptyDataTemplate>
						            <asp:Label id="EmptyBasketLabel" runat="server" meta:resourcekey="EmptyBasketLabelResource1"></asp:Label>			        
					            </EmptyDataTemplate>
					            <headerstyle horizontalalign="center" />
					            <Columns>
						            <asp:BoundField DataField="productID" Visible="False">
						                <itemstyle width="200"></itemstyle>
						            </asp:BoundField>
						            <asp:BoundField meta:resourcekey="NumberFieldResource1" DataField="ModelNumber">
						                <itemstyle width="200"></itemstyle>
						            </asp:BoundField>
						            <asp:BoundField meta:resourcekey="NameFieldResource1" DataField="ModelName">
						                <itemstyle width="200"></itemstyle>
						            </asp:BoundField>
						            <asp:BoundField meta:resourcekey="QuantityFieldResource1" DataField="quantity">
						                <itemstyle ></itemstyle>
						            </asp:BoundField>
						            <asp:BoundField meta:resourcekey="PriceFieldResource1" DataField="Price" DataFormatString="{0:C}" htmlencode="false">
							            <ItemStyle width="300" HorizontalAlign="Right"></ItemStyle>
						            </asp:BoundField>
						            <asp:BoundField meta:resourcekey="LineTotalFieldResource1" DataField="LineTotal" DataFormatString="{0:C}" htmlencode="false">
							            <ItemStyle width="300" HorizontalAlign="Right"></ItemStyle>
						            </asp:BoundField>
					            </Columns>
				            </asp:GridView>
    						
			            </td>
		            </tr>
		            <tr >
			            <td>
				            <table width="100%" >
				                <tr>
					                <td align="right"  >
					                    <asp:label id="SubTotalLabel2" runat="server" meta:resourcekey="SubTotalLabel2Resource1"></asp:label>
					                </td>
					                <td  align="right" >
						                <asp:Label ID="lblSubTotal2" Runat="server"></asp:Label>
					                </td>
				                </tr>
				                <tr id="trWebDiscount" Runat="server">
						            <td align="right"  >
						                <b><asp:label id="WebDiscountLabel" forecolor="red" runat="server" meta:resourcekey="WebDiscountLabelResource1"></asp:label>
						                <asp:label id="WebDiscountPercentageLabel" forecolor="red" runat="server"></asp:label></b>
						            </td>
						            <td style="width:100px;" align="right" >
							            <b><asp:Label ID="lblWebDiscount" forecolor="red" Runat="server"></asp:Label></b>
						            </td>
					            </tr>
				                <tr>
						            <td align="right"  >
						                <asp:label id="ShippingFeeLabel" runat="server" meta:resourcekey="ShippingFeeLabelResource1"></asp:label>
						                <asp:label id="FreeLabel" runat="server" ForeColor="red" Visible="false"></asp:label>
						            </td>
						            <td style="width:100px;" align="right" >
							            <asp:Label ID="lblShipping" Runat="server"></asp:Label>
						            </td>
					            </tr>					            
					            <tr>
					                <td align="right"  >
					                    <b><asp:label id="SubTotalLabel" runat="server" meta:resourcekey="SubTotalLabelResource1"></asp:label></b>
					                </td>
					                <td  align="right" >
						                <b><asp:Label ID="lblSubTotal" Runat="server"></asp:Label></b>
					                </td>
				                </tr>
				                <tr id="trTPS" runat="server">
						            <td align="right" >
						                <asp:label id="TPSLabel" runat="server" meta:resourcekey="TPSLabelResource1"></asp:label>
						            </td>
						            <td align="right" style="width:100px;" >
							            <asp:Label ID="lblTPS" Runat="server"></asp:Label>
							            <asp:Label ID="txtTPS" Runat="server" visible="false" text="0,0"></asp:Label>
						            </td>
					            </tr>
					            <tr id="trTVQ" runat="server">
						            <td align="right" >
						                <asp:label id="TVQLabel" runat="server" meta:resourcekey="TVQLabelResource1"></asp:label>
						            </td>
						            <td align="right" style="width:100px;" >
							            <asp:Label ID="lblTVQ" Runat="server"></asp:Label>
							            <asp:Label ID="txtTVQ" Runat="server" visible="false" text="0,0"></asp:Label>
						            </td>
					            </tr>
					            <tr id="trTVH" runat="server">
						            <td align="right" >
						                <asp:label id="TVHLabel" runat="server" meta:resourcekey="TVHLabelResource1"></asp:label>
						            </td>
						            <td align="right" style="width:100px;" >
							            <asp:Label ID="lblTVH" Runat="server"></asp:Label>
							            <asp:Label ID="txtTVH" Runat="server" visible="false" text="0,0"></asp:Label>
						            </td>
					            </tr>					            
					            <tr>
						            <td align="right"  ><b>Total:</b></td>
						            <td style="width:100px;" align="right" >
							            <b><asp:Label ID="lblTotal" Runat="server"></asp:Label></b>
							            <b><asp:Label ID="lblCurrency" Runat="server"></asp:Label></b>
						            </td>
					            </tr>
				            </table>
			            </td>
		            </tr>
		            
		            
		            <tr>
			            <td>                    
			                <uc2:PPStandardCheckout id="PPStandardCheckout1" runat="server"></uc2:PPStandardCheckout>
			            </td>
		            </tr>
		            <asp:TextBox ID="txtTaxAmount" runat="server" Visible="False"></asp:TextBox>
	            </table>                        
            </td>
        </tr>
    </table>
	    
</asp:Content>

