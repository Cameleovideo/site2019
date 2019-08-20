<%@ page language="vb" masterpagefile="~/general.master" inherits="Basket, App_Web_-wqcg8fv" title="Shopping Cart" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
 
    <h5>        
        <asp:label cssclass="checkoutlink" id="BasketLabel" runat="server" meta:resourcekey="BasketLabelResource1"></asp:label>        
        <asp:label cssclass="shaded" id="ShippingLabel" runat="server" meta:resourcekey="ShippingLabelResource1"></asp:label>        
        <asp:label cssclass="shaded" id="BillingLabel" runat="server" meta:resourcekey="BillingLabelResource1"></asp:label>        
        <asp:label cssclass="shaded" id="ConfirmLabel" runat="server" meta:resourcekey="ConfirmLabelResource1"></asp:label>        
    </h5>
     
 
    <h4>
        <asp:label runat="server" meta:resourcekey="BasketHeaderResource1"></asp:label>
    </h4>  
    
    <table width="100%">
        <tr>
	        <td valign="top" >       
	            <asp:GridView ID="dgBasket" Runat="server" datakeynames="photoID, productID" AutoGenerateColumns="false" OnRowDeleting="Remove_Item" onrowdatabound="dgBasket_RowDataBound">
                    <headerstyle horizontalalign="center" />                                       
                    
		            <Columns>		                
		                <asp:TemplateField>
		                    <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="Delete" enabled='<%# not Eval("ModelNumber") = Product.SITTING_FEE_MODEL_NUMBER and not Eval("ModelNumber") = Product.RETOUCH_MODEL_NUMBER and not Eval("ModelNumber") = Product.RESERVATION_MODEL_NUMBER and not Eval("ModelNumber") = Product.ARCHIVAGE_MODEL_NUMBER%>' meta:resourcekey="DeleteLinkResource1"></asp:LinkButton>
                            </ItemTemplate>
		                </asp:TemplateField>

			            <asp:BoundField meta:resourcekey="NumberFieldResource1" DataField="ModelNumber">
			                <itemstyle width="180"></itemstyle>
			            </asp:BoundField>
			            <asp:BoundField meta:resourcekey="NameFieldResource1" DataField="ModelName">
			                <itemstyle width="200"></itemstyle>
			            </asp:BoundField>
			            <asp:BoundField meta:resourcekey="PriceFieldResource1" DataField="Price" DataFormatString="{0:c}" htmlencode="false">
			                <itemstyle width="320" horizontalalign="right"></itemstyle>
			            </asp:BoundField>
			            <asp:TemplateField meta:resourcekey="QuantityFieldResource1">
			                <itemstyle  horizontalalign="center"></itemstyle>
			                <ItemTemplate>
				                <asp:TextBox id="txtQuantity" runat="server" enabled='<%# not Eval("Price") = 0.0 and not Eval("ModelNumber") = Product.DIGITAL_RIGHTS_MODEL_NUMBER and not Eval("ModelNumber") = Product.SITTING_FEE_MODEL_NUMBER and not Eval("ModelNumber") = Product.RETOUCH_MODEL_NUMBER and not Eval("ModelNumber") = Product.RESERVATION_MODEL_NUMBER and not Eval("ModelNumber") = Product.ARCHIVAGE_MODEL_NUMBER%>' Text='<%#Eval("quantity")%>' width="20px" height="20px" autopostback="True" causesvalidation="True"></asp:TextBox>
				                <asp:RangeValidator id="RangeValidator1" runat="server" meta:resourcekey="RangeValidator1Resource1"
					                ControlToValidate="txtQuantity" MaximumValue="100" MinimumValue="0" Type="Integer"
					                Display="Dynamic">
				                </asp:RangeValidator>
			                </ItemTemplate>
			            </asp:TemplateField>
			            <asp:BoundField meta:resourcekey="LineTotalFieldResource1" DataField="LineTotal" DataFormatString="{0:c}" htmlencode="false">
			                <itemstyle width="320" horizontalalign="right"></itemstyle>
			            </asp:BoundField>
			            <asp:TemplateField meta:resourcekey="PreviewFieldResource1">
			                <itemstyle width="180" horizontalalign="center"></itemstyle>
			                <ItemTemplate>
				                <img src="Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198"  alt='Aperçu' />
			                </ItemTemplate>
			            </asp:TemplateField>			                            			        
    			        
		            </Columns>
                </asp:GridView> <br />               
		        <asp:Panel ID="pnlCheckout" runat="server">
		            <div class="plainbox">
		                <asp:Label id="RemoveLabel" runat="server" meta:resourcekey="RemoveLabelResource1"></asp:Label>		                
		            </div>
		            
		            <table>
		                <tr>
			                <td  valign="middle" class="sectionheader" >
			                    <br />			                
			                    <asp:label id="ShippingOptionsLabel" runat="server" meta:resourcekey="ShippingOptionsLabelResource1"></asp:label>
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
		            
		            <p><asp:LinkButton ID="btnCheckout" runat="server" meta:resourcekey="CheckOutLinkResource1" OnClick="btnCheckout_Click"></asp:LinkButton></p>	                
	            </asp:Panel>
	            <asp:Panel ID="pnlEmpty" runat="server" visible="false">
		            <div class="plainbox">
		                <asp:Label id="EmptyBasketLabel" runat="server" meta:resourcekey="EmptyBasketLabelResource1"></asp:Label>			        
		            </div>	                
	            </asp:Panel>
	        </td>
        </tr>
    </table>
          
    
	 
</asp:Content>

