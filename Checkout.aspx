<%@ page language="vb" masterpagefile="~/general.master" autoeventwireup="true" inherits="Checkout, App_Web_-wqcg8fv" title="Order Checkout" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <h5>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="basket.aspx">
            <asp:label id="BasketLabel" runat="server" meta:resourcekey="BasketLabelResource1" Font-Underline="true"></asp:label>        
        </asp:HyperLink>       
        <asp:label cssclass="checkoutlink" id="ShippingLabel" runat="server" meta:resourcekey="ShippingLabelResource1"></asp:label>        
        <asp:label cssclass="shaded" id="BillingLabel" runat="server" meta:resourcekey="BillingLabelResource1"></asp:label>        
        <asp:label cssclass="shaded" id="ConfirmLabel" runat="server" meta:resourcekey="ConfirmLabelResource1"></asp:label>        
    </h5>
    

    <h4>
        <asp:label runat="server" meta:resourcekey="CheckoutHeaderResource1"></asp:label>
    </h4>
    <h5>
        <asp:Label ID="ShipAddressMessage" meta:resourcekey="ShipAddressMessageResource1" runat="server" Text="Label"></asp:Label>
    </h5>
 
    <asp:panel ID="Panel1" defaultbutton="btnContinue" runat="server">
    <table border="0" cellpadding="5" cellspacing="0" ><tr>
        <td valign="top">    
	         
	        <table cellspacing="1" cellpadding="2" width="100%">
		        <tr>
			        <td class="sectionheader" colspan="2">
                        <asp:label id="ShippingHeaderLabel" runat="server" meta:resourcekey="ShippingHeaderLabelResource1"></asp:label>                        
			        </td>
		        </tr>
		        <tr>
			        <td >
				        <asp:label id="EmailLabel" runat="server" meta:resourcekey="EmailLabelResource1"></asp:label>
				    </td>
			        <td height="28">
				        <asp:TextBox Runat="server" ID="txtShipEmail"></asp:TextBox>
				        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtShipEmail" ID="Requiredfieldvalidator4">*</asp:RequiredFieldValidator>
			        </td>
		        </tr>
		        <tr>
			        <td>
                        <asp:label id="FirstNameLabel" runat="server" meta:resourcekey="FirstNameLabelResource1"></asp:label>
				    </td>
			        <td>
				        <asp:TextBox Runat="server" ID="txtShipFirst"></asp:TextBox>
				        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtShipFirst" ID="RequiredFieldValidator1">*</asp:RequiredFieldValidator>
			        </td>
		        </tr>
		        <tr>
			        <td>
				        <asp:label id="LastNameLabel" runat="server" meta:resourcekey="LastNameLabelResource1"></asp:label>
				    </td>
			        <td>
				        <asp:TextBox Runat="server" ID="txtShipLast"></asp:TextBox>
				        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtShipLast" ID="Requiredfieldvalidator5">*</asp:RequiredFieldValidator>
			        </td>
		        </tr>		        
		        <tr>
			        <td >
				        <asp:label id="AddressLabel" runat="server" meta:resourcekey="AddressLabelResource1"></asp:label>
				    </td>
			        <td>
				        <asp:TextBox Runat="server" ID="txtShipAddress"></asp:TextBox>
				        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtShipAddress" ID="RequiredFieldValidator2">*</asp:RequiredFieldValidator>
			        </td>
		        </tr>
		        <tr>
			        <td >
				        <asp:label id="Address2Label" runat="server" meta:resourcekey="Address2LabelResource1"></asp:label>
				    </td>
			        <td>
				        <asp:TextBox Runat="server" ID="txtShipAddress2"></asp:TextBox>
			        </td>
		        </tr>
		        <tr>
			        <td >
				        <asp:label id="CityLabel" runat="server" meta:resourcekey="CityLabelResource1"></asp:label>
				    </td>
			        <td>
				        <asp:TextBox Runat="server" ID="txtShipCity"></asp:TextBox>
				        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtShipCity" ID="RequiredFieldValidator3">*</asp:RequiredFieldValidator>
			        </td>
		        </tr>
		        <uc1:LocationSelector id="LocationSelector1" runat="server"></uc1:LocationSelector>

		        <tr>
			        <td >
				        <asp:label id="PostalCodeLabel" runat="server" meta:resourcekey="PostalCodeLabelResource1"></asp:label>
				    </td>
			        <td>
				        <asp:TextBox Runat="server" ID="txtShipZip"></asp:TextBox>
				        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtShipZip" ID="RequiredFieldValidator6">*</asp:RequiredFieldValidator>
				        &nbsp;
			        </td>
		        </tr>
		        <tr>
			        <td >
				        <asp:label id="PhoneLabel" runat="server" meta:resourcekey="PhoneLabelResource1"></asp:label>
				    </td>
			        <td>
				        <asp:TextBox Runat="server" ID="txtShipPhone"></asp:TextBox>
				        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtShipPhone">*</asp:RequiredFieldValidator><br />
				    </td>
		        </tr>
	        </table>
	        
	        <br />
	        <table cellspacing="1" cellpadding="1" width="100%">
		         <tr>
			        <td  class="sectionheader">
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
						        <asp:BoundField DataField="productID" Visible="False"></asp:BoundField>
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
						        <asp:TemplateField meta:resourcekey="PreviewFieldResource1">
			                        <itemstyle width="180" horizontalalign="center"></itemstyle>
			                        <ItemTemplate>
				                        <img src="Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198"  alt='Aperçu' />
			                        </ItemTemplate>
			                    </asp:TemplateField>
					        </Columns>
				        </asp:GridView>
						
			        </td>
		        </tr>
		        <tr >
		            <td>
			            <table width="100%" cellpadding="0" cellspacing="0">			                
				            <tr>
					            <td align="right"  >
					                <b><asp:label id="SubTotalLabel" runat="server" meta:resourcekey="SubTotalLabelResource1"></asp:label></b>
					            </td>
					            <td  align="right" >
						            <b><asp:Label ID="lblTotal" Runat="server"></asp:Label></b>
					            </td>
				            </tr>
			            </table>
		            </td>
	            </tr>
	            <tr id="trMinimumSale" visible="false" runat="server" >
			        <td style="height: 26px">
                        <asp:Label ID="lblMinimum" ForeColor="red" runat="server" ></asp:Label>			        				        
				    </td>
		        </tr>
		        <tr id="trContinue" runat="server" >
			        <td style="height: 26px">				        
				        <asp:LinkButton id="btnContinue"  OnClick="btnContinue_Click" meta:resourcekey="btnContinueResource1" runat="server"></asp:LinkButton>
				    </td>
		        </tr>
           </table>                        
        </td>
      </tr>
    </table>
    </asp:panel>
  
</asp:Content>

