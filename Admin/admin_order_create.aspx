<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_order_create, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<%@ Register Src="../Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <asp:LinkButton ID="lnkReturn" runat="server" OnClick="lnkReturn_Click">Retour</asp:LinkButton>
    
    <table border="1">
        <tr>
            <td colspan="2">
                <h1>Cart:</h1>
                <asp:GridView ID="dgBasket" Runat="server" datakeynames="photoID, productID" 
                    AutoGenerateColumns="false" OnRowDeleting="Remove_Item">
                    
                    <headerstyle horizontalalign="center" />                                       
                    
		            <Columns>			        
		                <asp:commandfield showdeletebutton="true"  meta:resourcekey="DeleteLinkResource1" >
		                    <itemstyle width="120" horizontalalign="center"></itemstyle>
		                </asp:commandfield>

			            <asp:BoundField HeaderText="ModelNumber" DataField="ModelNumber" ReadOnly="true">
			                <itemstyle width="180"></itemstyle>
			            </asp:BoundField>
			            <asp:BoundField headertext="ModelName" DataField="ModelName" ReadOnly="true">
			                <itemstyle width="200"></itemstyle>
			            </asp:BoundField>			            
			            <asp:TemplateField HeaderText="UnitPrice">
			                <itemstyle width="200" horizontalalign="center"></itemstyle>
			                <ItemTemplate>
				                <asp:TextBox id="txtPrice" runat="server" Text='<%#Eval("price")%>' Columns="10" autopostback="True" causesvalidation="True"></asp:TextBox>
				                <asp:RangeValidator id="RangeValidator1" runat="server" ControlToValidate="txtPrice" MinimumValue="-1000" Type="Double" Display="Dynamic">
				                    *
				                </asp:RangeValidator>
			                </ItemTemplate>
			            </asp:TemplateField>
			            <asp:TemplateField HeaderText="qty">
			                <itemstyle width="180" horizontalalign="center"></itemstyle>
			                <ItemTemplate>
				                <asp:TextBox id="txtQuantity" runat="server" enabled='<%# not Eval("Price") = 0.0 and not Eval("ModelNumber") = Product.DIGITAL_RIGHTS_MODEL_NUMBER and not Eval("ModelNumber") = Product.SITTING_FEE_MODEL_NUMBER and not Eval("ModelNumber") = Product.RETOUCH_MODEL_NUMBER and not Eval("ModelNumber") = Product.RESERVATION_MODEL_NUMBER and not Eval("ModelNumber") = Product.ARCHIVAGE_MODEL_NUMBER%>' Text='<%#Eval("quantity")%>' width="20px" height="20px" autopostback="True" causesvalidation="True"></asp:TextBox>
				                <asp:RangeValidator id="RangeValidator2" runat="server" meta:resourcekey="RangeValidator1Resource1"
					                ControlToValidate="txtQuantity" MaximumValue="100" MinimumValue="0" Type="Integer"
					                Display="Dynamic">
				                </asp:RangeValidator>
			                </ItemTemplate>
			            </asp:TemplateField>
			            <asp:BoundField HeaderText="subtotal" DataField="LineTotal" DataFormatString="{0:c}" htmlencode="false" ReadOnly="true">
			                <itemstyle width="220" horizontalalign="right"></itemstyle>
			            </asp:BoundField>
			            <asp:TemplateField meta:resourcekey="PreviewFieldResource1">
			                <itemstyle width="180" horizontalalign="center"></itemstyle>
			                <ItemTemplate>
				                <img src="../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198"  alt='Aperçu' />
			                </ItemTemplate>
			            </asp:TemplateField>			                            			        
    			        
		            </Columns>
                </asp:GridView>
                
                <table width="100%" >
	                <tr>
		                <td align="right"  >
		                    Subtotal avant taxes et livraison:
		                </td>
		                <td  align="right" >
			                <asp:Label ID="lblSubTotalBeforeShipping" Runat="server"></asp:Label>
		                </td>
	                </tr>
	                <tr id="trWebDiscount" Runat="server">
			            <td align="right"  >
			                <b>WebDiscount:
			                <asp:label id="WebDiscountPercentageLabel" forecolor="red" runat="server"></asp:label></b>
			            </td>
			            <td style="width:100px;" align="right" >
				            <b><asp:Label ID="lblWebDiscount" forecolor="red" Runat="server"></asp:Label></b>
			            </td>
		            </tr>
	                <tr>
			            <td align="right"  >
			                Shipping: 
			            </td>
			            <td style="width:100px;" align="right" >
			                <asp:label id="lblShipping" runat="server" Columns="10" causesvalidation="True" ></asp:Label>			                				            
			            </td>
		            </tr>					            
		            <tr>
		                <td align="right"  >
		                    <b>Subtotal
		                </td>
		                <td  align="right" >
			                <b><asp:Label ID="lblSubTotal" Runat="server"></asp:Label></b>
		                </td>
	                </tr>
	                <tr id="trTPS" runat="server">
			            <td align="right" >
			                TPS:
			            </td>
			            <td align="right" style="width:100px;" >
				            <asp:Label ID="lblTPS" Runat="server"></asp:Label>	
				            <asp:Label ID="txtTPS" Runat="server" visible="false" text="0,0"></asp:Label>			            
			            </td>
		            </tr>
		            <tr id="trTVQ" runat="server">
			            <td align="right" >
			                TVQ:
			            </td>
			            <td align="right" style="width:100px;" >
				            <asp:Label ID="lblTVQ" Runat="server"></asp:Label>		
				            <asp:Label ID="txtTVQ" Runat="server" visible="false" text="0,0"></asp:Label>		            
			            </td>
		            </tr>
		            <tr id="trTVH" runat="server">
			            <td align="right" >
			                TVH:
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
			            </td>
		            </tr>
	            </table>
            </td>
        </tr>
        <tr>
            <td>
                <h1>Produits:</h1>
                <asp:DataList id="CategoryList"  CellPadding="0" CellSpacing="0" 
                    runat="server" DataKeyField="CategoryId" ShowHeader="false"
                    CssClass="bevelmenu" OnSelectedIndexChanged="CategoryList_SelectedIndexChanged">
                       
                    <ItemTemplate >               
                        <asp:LinkButton ID="btnCategory" runat="server" CommandName="select" >
                            <%# Eval("CategoryName") %>
                        </asp:LinkButton>                        
                    </ItemTemplate>         
                    <SelectedItemStyle CssClass="bevelmenuselected"/>        
                </asp:DataList>
            </td>
            <td>
                <table border="1">
                    <tr>
                    <td>
                        <asp:DataList ID="ProductList" Runat="server" DataKeyField="ProductID" 
                            DataSourceID="odsProducts" RepeatDirection="Horizontal" RepeatColumns="10"
                            OnSelectedIndexChanged="btnAddToCart_Click" >
                            
                            <ItemTemplate>                                
                                <td style="text-align: left;">					                
	                                <img alt='Product Image - <%#Eval("Description")%>' src='../images/productimages/<%#Eval("ProductImage")%>' class="thumbimage">					                
                                </td>
                                <td style="text-align: left;">
                                    <div class="plainbox">
	                                    <%#Eval("ModelName")%>&nbsp; 
                		                
	                                    <%#GetPrice(Eval("UnitCost"), Eval("ConfiguredUnitCost"), Eval("DiscountPercent"))%>
	                                    <asp:Label id="lblProductID" runat="server" Visible="False" Text='<%#Eval("ProductID")%>'></asp:Label>  
	                                    <br />
                		                
	                                    <%#Eval("Description")%><br />                				  
                                    </div>
    	                            
                                    <b><asp:Label id="lblQuantity"  runat="server" Text="Qty"></asp:Label></b>
                                    <asp:TextBox id="txtQuantity" maxlength="2" size="1" runat="server" text="1" enabled='<%# not Eval("ModelNumber") = Product.DIGITAL_RIGHTS_MODEL_NUMBER%>' ></asp:TextBox>
                                    <asp:RangeValidator id="RangeValidator1" runat="server" ControlToValidate="txtQuantity" MaximumValue="100" MinimumValue="0" Type="Integer">*</asp:RangeValidator>
                                    <br />
                                    
                                    <asp:LinkButton  id="btnAddToCart"  CommandName="Select" runat="server">Add to cart</asp:LinkButton>
                                </td>                                                                            
                            </ItemTemplate>
                        </asp:DataList>
                        </td>
                    </tr> 
                </table>		                					
            </td>
        </tr>
        <tr>
            <td>
                <h1>
                    Commit order
                </h1>
                Shipping: 
                <asp:DropDownList Runat="server" ID="lstShipService" AutoPostBack="true" >
                </asp:DropDownList>     
                
                <br /><br />Payment:                
                <asp:RadioButtonList ID="radPayType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" >				                            
                </asp:RadioButtonList>           
            </td>
            <td rowspan="2">                
                <h1>Ship address</h1>
                <table cellspacing="1" cellpadding="2" width="100%">		            
		            <tr>
			            <td >
				            Email:
				        </td>
			            <td height="28">
				            <asp:TextBox Runat="server" ID="txtShipEmail"></asp:TextBox>				            
			            </td>
		            </tr>
		            <tr>
			            <td>
                            Prénom:
				        </td>
			            <td>
				            <asp:TextBox Runat="server" ID="txtShipFirst"></asp:TextBox>				            
			            </td>
		            </tr>
		            <tr>
			            <td>
				            Nom de famille:
				        </td>
			            <td>
				            <asp:TextBox Runat="server" ID="txtShipLast"></asp:TextBox>				            
			            </td>
		            </tr>		        
		            <tr>
			            <td >
				            Adresse:
				        </td>
			            <td>
				            <asp:TextBox Runat="server" ID="txtShipAddress"></asp:TextBox>				            
			            </td>
		            </tr>
		            <tr>
			            <td >
				            Adresse2:
				        </td>
			            <td>
				            <asp:TextBox Runat="server" ID="txtShipAddress2"></asp:TextBox>
			            </td>
		            </tr>
		            <tr>
			            <td >
				            Ville:
				        </td>
			            <td>
				            <asp:TextBox Runat="server" ID="txtShipCity"></asp:TextBox>				            
			            </td>
		            </tr>
		            <uc1:LocationSelector id="LocationSelector1" runat="server"></uc1:LocationSelector>

		            <tr>
			            <td >
				            Code postal:
				        </td>
			            <td>
				            <asp:TextBox Runat="server" ID="txtShipZip"></asp:TextBox>				            
				            &nbsp;
			            </td>
		            </tr>
		            <tr>
			            <td >
				            Téléphone:
				        </td>
			            <td>
				            <asp:TextBox Runat="server" ID="txtShipPhone"></asp:TextBox>				            
				        </td>
		            </tr>
	            </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnCommitOrder" runat="server" Text="CommitOrder" OnClick="btnCommitOrder_Click"/>
            </td>            
        </tr>      
    </table>
        
    <asp:ObjectDataSource ID="odsProducts" runat="server" TypeName="CatalogManager"
        SelectMethod="GetEventProductsByCategory">
        <SelectParameters>
	        <asp:Parameter Name="CategoryID" Type="Int32" DefaultValue="14"/>
	        <asp:Parameter Name="EventUserName" />
	        <asp:ProfileParameter name="locale" PropertyName="PreferredCulture"/>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

