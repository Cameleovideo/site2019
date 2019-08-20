<%@ page language="VB" autoeventwireup="true" masterpagefile="~/general.master" inherits="Checkout2, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>
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
        <asp:label ID="Label1" runat="server" meta:resourcekey="BillingHeaderResource1"></asp:label>
    </h4>
    <h5>
        <asp:Label ID="BillAddressMessage" meta:resourcekey="BillAddressMessageResource1" runat="server" Text="Label"></asp:Label>
    </h5>    
    
    <asp:panel ID="Panel1" defaultbutton="btnContinue" runat="server">
    <table border="0" cellpadding="5" cellspacing="0">
        <tr>
            <td valign="top">    
                            
                <asp:Panel ID="pnlBillInfo" runat="server">

                     <table width="100%">
	                    <tr>
		                    <td class="sectionheader" colspan="2" >
		                        <asp:label id="BillingHeaderLabel" runat="server" meta:resourcekey="BillingHeaderLabelResource1"></asp:label>        		                        
		                    </td>
	                    </tr>
	                    
	                    <tr>        
                            <td colspan="2">
                                <asp:DetailsView AutoGenerateRows="False" DataSourceID="ObjectDataSource1" ID="DetailsView1" runat="server" OnItemUpdating="DetailsView1_ItemUpdating" BorderWidth="0" Width="100%">
                                    <RowStyle height="25"/>
                                    <fieldheaderstyle Width="100" />                                    
                                    <Fields>       
                                        <asp:templatefield headertext="<%$ Resources: DetailsView1Resource1.EmailLabel  %>" >
                                            <itemtemplate>                                                
                                                <asp:TextBox id="billEmail" runat="server" Width="95%" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Runat="server" ControlToValidate="billEmail" >*</asp:RequiredFieldValidator>
                                            </itemtemplate>
                                        </asp:templatefield>                                        
                                    </Fields>                                    
                                </asp:DetailsView>
                                
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="System.Web.Security.MembershipUser" SelectMethod="GetUser" TypeName="System.Web.Security.Membership">
                                    <SelectParameters>
                                        <asp:Parameter Name="UserName" />
                                    </SelectParameters>
                                </asp:ObjectDataSource> 
                            </td>                                 
                        </tr>	
                        <tr>
			                <td colspan="2">
			                    <table width="100%">
			                        <tr>
			                            <td style="width:96px">
			                                <asp:label id="PhoneLabel" runat="server" meta:resourcekey="PhoneLabelResource1"></asp:label>
			                            </td>
			                            <td>
			                                <asp:TextBox Runat="server" ID="txtShipPhone" Width="95%"></asp:TextBox>
				                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtShipPhone">*</asp:RequiredFieldValidator><br />
			                            </td>
			                        </tr>
			                    </table>
				            </td>
		                </tr> 
		                <uc1:LocationSelector id="ucLocationSelector" runat="server"></uc1:LocationSelector>                   
                    </table>
                    <br />
         
                </asp:Panel>
                <br />
                
                <table width="100%">
		            <tr>
		                <td class="sectionheader" >
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
			                <table width="100%">			                
				                <tr>
					                <td align="right"  >
					                    <b><asp:label id="SubTotalLabel" runat="server" meta:resourcekey="SubTotalLabelResource1"></asp:label></b>
					                </td>
					                <td style="width:100px;" align="right" >
						                <b><asp:Label ID="lblTotal" Runat="server"></asp:Label></b>
					                </td>
				                </tr>
			                </table>
		                </td>
	                </tr>
	                
	                <tr id="trPlaceOrder" runat="server">
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