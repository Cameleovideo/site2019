<%@ page language="vb" masterpagefile="~/general.master" autoeventwireup="true" inherits="Receipt, App_Web_-wqcg8fv" title="Order Receipt" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    
    <div style="text-align:center;">
        <h3>
            <asp:label ID="Label1" runat="server" meta:resourcekey="TitleResource1"></asp:label>                            
            <asp:Label ID="lblTitle"  forecolor="red" runat="server"></asp:Label>
        </h3>
        <h4>
            <asp:Label ID="lblCameleoAddress" runat="server" meta:resourcekey="MerchantResource1"></asp:Label>
        </h4>
    </div>
    
    <table border="0" cellpadding="0" cellspacing="0" ><tr>
        <td valign="top">    
	        <table cellspacing="0" cellpadding="0" width="100%">			    
		        <tr id="trApproved" visible="false" runat="server" style="text-align: left;">
		            <td>
		                <asp:label runat="server" meta:resourcekey="ApprovedResource1"></asp:label><br /><br />
		            </td>
		        </tr>
		        <tr id="trCheck" visible="false" runat="server" style="text-align: left;"> 
		            <td>
		                <asp:label runat="server" meta:resourcekey="CheckResource1"></asp:label><br /><br />
		            </td>
		        </tr>
		        <tr id="trPhone" visible="false" runat="server" style="text-align: left;">
		            <td>
		                <asp:label runat="server" meta:resourcekey="PhoneResource1"></asp:label><br /><br />
		            </td>
		        </tr>
		        <tr style="text-align: left;">
			            <td  class="sectionheader">
			                <b><asp:Label runat="server" meta:resourcekey="StatusHeaderResource1"></asp:Label></b>
			            </td>				        
		            </tr>
		        <tr style="text-align: left;">
			        <td  class="checkoutlabel">
                        <asp:label runat="server" meta:resourcekey="StatusResource1"></asp:label>                        
				        <asp:Label ID="lblStatus" runat="server" Font-Bold="True"></asp:Label>
				    </td>
		        </tr>            
		        <tr style="text-align: left;">
			        <td  class="checkoutlabel">
                        <asp:label runat="server" meta:resourcekey="DateResource1"></asp:label>                        
				        <asp:Label ID="lblDate" runat="server" Font-Bold="True"></asp:Label>
				    </td>
		        </tr> 
		        <tr runat="server" enableviewstate="False" visible="False" id="trError">
			        <td id="Td1" runat="server" colspan="2">
				        <font color="#990000"><b>
				        <asp:Label Runat="server" ID="lblError"></asp:Label>
				        </b></font>
			        </td>
		        </tr>
	        </table>
		    
	        <asp:Panel ID="pnlDetail" runat="server">
	            <br />
	            <table cellspacing="1" cellpadding="2" width="100%" >
		            <tr style="text-align: left;">
			            <td  class="sectionheader">
			                <b><asp:Label runat="server" meta:resourcekey="ShippingHeaderResource1"></asp:Label></b>
			            </td>
			            <td class="sectionheader">
			                <b><asp:Label runat="server" meta:resourcekey="ShippingMethodHeaderResource1"></asp:Label></b>
			            </td>
		            </tr>
		            <tr style="vertical-align: top;" style="text-align: left;">
			            <td>
				            <table width="100%">
					            <tr>
						            <td  class="checkoutlabel">
							            <asp:Label ID="lblShippingSummary" runat="server" Text="Label"></asp:Label>
							        </td>
					            </tr>						    
			                </table>               
			            </td>
			            <td>
				            <table width="100%">						    
				               <tr>
						            <td  class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="ShippingMethodResource1"></asp:Label>							        
							            <b><asp:Label ID="lblShippingMethod" runat="server" Text="Label"></asp:Label></b>
							        </td>
					           </tr>               
					           <tr>
					                <td  class="checkoutlabel" id="trTrackingNumber" runat="server" visible="false">								    
							            <asp:Label runat="server" meta:resourcekey="TrackingNumberResource1"></asp:Label>
							            <b><asp:Label ID="lblTrackingNumber" runat="server"></asp:Label></b>
						            </td>
					            </tr>
			                </table>               
			            </td>
		            </tr>
	            </table>
    		    
    		   

	            <br />
	            <table cellspacing="1" cellpadding="2" width="100%" >
		            <tr style="text-align: left;">
			            <td class="sectionheader">
			                <b><asp:Label runat="server" meta:resourcekey="BillingHeaderResource1"></asp:Label></b>
			            </td>
		            </tr>
		            <tr style="text-align: left;">
			            <td>
				            <table width="100%">
					            <tr>
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="PaymentMethodResource1"></asp:Label>
						                <b><asp:Label ID="lblPaymentMethod" runat="server" Text=""></asp:Label></b>
						            </td>
					            </tr>						    
				                <tr id="trTransactionID" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="TransactionIDResource1"></asp:Label>
						                <b><asp:Label ID="lblTransactionID" runat="server" Text=""></asp:Label></b>
						            </td>
				                </tr>
				                <tr id="trISOCode" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="ISOCodeResource1"></asp:Label>
						                <b><asp:Label ID="lblISOCode" runat="server" ></asp:Label></b>
						            </td>
				                </tr>
				                <tr id="trBankApproval" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="BankApprovalResource1"></asp:Label>
						                <b><asp:Label ID="lblBankApproval" runat="server" ></asp:Label></b>
						            </td>
				                </tr>
				                <tr id="trCCNumber" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="CCNumberResource1"></asp:Label>
						                <b><asp:Label ID="lblCCNumber" runat="server" ></asp:Label></b>
						            </td>
				                </tr>
				                <tr id="trCardHolder" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="CardHolderResource1"></asp:Label>
						                <b><asp:Label ID="lblCardHolder" runat="server" ></asp:Label></b>
						            </td>
				                </tr>
				                <tr id="trDebitIssuer" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="DebitIssuerResource1"></asp:Label>
						                <b><asp:Label ID="lblDebitIssuer" runat="server" ></asp:Label></b>
						            </td>
				                </tr>
				                <tr id="trDebitConfirmation" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="DebitConfirmationResource1"></asp:Label>
						                <b><asp:Label ID="lblDebitConfirmation" runat="server" ></asp:Label></b>
						            </td>
				                </tr>
						        <tr id="trDebitInvoice" runat="server" visible="false">
						            <td class="checkoutlabel">
						                <asp:Label runat="server" meta:resourcekey="DebitInvoiceResource1"></asp:Label>
						                <b><asp:Label ID="lblDebitInvoice" runat="server" ></asp:Label></b>
						            </td>
				                </tr>
			            </table>               
			            </td>
		            </tr>        
	            </table>    
	            <br />  
    		    
    		      
	            <table width="100%">
		            <tr style="text-align: left;">
			            <td  colspan="2" class="sectionheader">
			                <b><asp:Label runat="server" meta:resourcekey="OrderDetailHeaderResource1"></asp:Label></b>
			            </td>
		            </tr>
		            <tr>
			            <td >
				            <asp:GridView ID="dgItems" Runat="server" AutoGenerateColumns="False" Width="100%" onrowdatabound="dgItems_RowDataBound">
					            <EmptyDataTemplate>
						            <asp:Label id="EmptyBasketLabel" runat="server" meta:resourcekey="EmptyBasketLabelResource1"></asp:Label>			        
					            </EmptyDataTemplate>
					            <Columns>
						            <asp:BoundField DataField="productID" Visible="False"></asp:BoundField>
						            <asp:BoundField HeaderText="Number" DataField="modelnumber" meta:resourcekey="NumberFieldResource1">
						                <itemstyle width="200"></itemstyle>
						            </asp:BoundField>
						            <asp:BoundField HeaderText="Item" DataField="modelname" meta:resourcekey="NameFieldResource1">
						                <itemstyle width="200"></itemstyle>
						            </asp:BoundField>
						            <asp:BoundField HeaderText="Quantity" DataField="quantity" meta:resourcekey="QuantityFieldResource1">
						                <itemstyle width="75"></itemstyle>
						            </asp:BoundField>
						            <asp:BoundField HeaderText="Price" DataField="price" meta:resourcekey="PriceFieldResource1" DataFormatString="{0:C}" htmlencode="false">
							            <ItemStyle width="125" HorizontalAlign="Right"></ItemStyle>								    
						            </asp:BoundField>
						            <asp:BoundField HeaderText="Total" DataField="LineTotal" meta:resourcekey="LineTotalFieldResource1" DataFormatString="{0:C}" htmlencode="false">
							            <ItemStyle width="125" HorizontalAlign="Right"></ItemStyle>
						            </asp:BoundField>
					            </Columns>
				            </asp:GridView>    					
			            </td>
		            </tr>
		            <tr >
			            <td>
				            <table width="100%">
				                <tr>
			                        <td style="text-align:right" class="checkoutlabel"  >
			                            <asp:label id="SubTotalLabel2" runat="server" meta:resourcekey="SubTotalLabel2Resource1"></asp:label>
			                        </td>
			                        <td  style="text-align:right; width:100px;" >
				                        <asp:Label ID="lblSubTotal2" Runat="server"></asp:Label>
			                        </td>
		                        </tr>
					            <tr>
						            <td  style="text-align:right;"  class="checkoutlabel">
						                <asp:label id="ShippingFeeLabel" runat="server" meta:resourcekey="ShippingFeeLabelResource1"></asp:label>
						            </td>
						            <td  style="text-align:right;" class="checkoutlabel">
							            <asp:Label ID="lblShipping" Runat="server"></asp:Label>
						            </td>
					            </tr>
					            <tr>
			                        <td style="text-align:right;"  class="checkoutlabel">
			                            <b><asp:label id="SubTotalLabel" runat="server" meta:resourcekey="SubTotalLabelResource1"></asp:label></b>
			                        </td>
			                        <td  style="text-align:right;" >
				                        <b><asp:Label ID="lblSubTotal" Runat="server"></asp:Label></b>
			                        </td>
		                        </tr>
		                        <tr id="trTPS" runat="server">
				                    <td style="text-align:right;"  class="checkoutlabel">
				                        <asp:label id="TPSLabel" runat="server" meta:resourcekey="TPSLabelResource1"></asp:label>
				                    </td>
				                    <td style="text-align:right;" >
					                    <asp:Label ID="lblTPS" Runat="server"></asp:Label>
					                    <asp:Label ID="txtTPS" Runat="server" visible="false" text="0,0"></asp:Label>
				                    </td>
			                    </tr>
			                    <tr id="trTVQ" runat="server">
				                    <td style="text-align:right;"  class="checkoutlabel">
				                        <asp:label id="TVQLabel" runat="server" meta:resourcekey="TVQLabelResource1"></asp:label>
				                    </td>
				                    <td style="text-align:right;" >
					                    <asp:Label ID="lblTVQ" Runat="server"></asp:Label>
					                    <asp:Label ID="txtTVQ" Runat="server" visible="false" text="0,0"></asp:Label>
				                    </td>
			                    </tr>
			                    <tr id="trTVH" runat="server">
				                    <td style="text-align:right;"  class="checkoutlabel">
				                        <asp:label id="TVHLabel" runat="server" meta:resourcekey="TVHLabelResource1"></asp:label>
				                    </td>
				                    <td style="text-align:right;" >
					                    <asp:Label ID="lblTVH" Runat="server"></asp:Label>
					                    <asp:Label ID="txtTVH" Runat="server" visible="false" text="0,0"></asp:Label>
				                    </td>
			                    </tr>
					            <tr>
						            <td  style="text-align:right;"  class="checkoutlabel">
						                <b>Total:</b>
						            </td>
						            <td  style="text-align:right;" class="checkoutlabel">
							            <b><asp:Label ID="lblTotal" Runat="server"></asp:Label></b>
						            </td>
					            </tr>
				            </table>
			            </td>
		            </tr>
	            </table>  
	        </asp:Panel>    
	        </td>
        </tr>
    </table> 

</asp:Content>

