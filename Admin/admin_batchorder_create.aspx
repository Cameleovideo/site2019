<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_batchorder_create, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <table>
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
                            <asp:DataList ID="ProductList" Runat="server" DataKeyField="ProductID" SelectedItemStyle-BackColor="yellow" 
                                DataSourceID="odsProducts" RepeatDirection="Horizontal" RepeatColumns="10">
                                
                                <ItemTemplate>                                
                                    <td style="text-align: left;">                                    
	                                    <img alt='Product Image - <%#Eval("Description")%>' src='../images/productimages/<%#Eval("ProductImage")%>' class="thumbimage">					                
                                        <br /><asp:LinkButton ID="LinkButton1" CommandName="Select" runat="server">Sélectionner</asp:LinkButton>
                                    </td>
                                    <td style="text-align: left;">
                                        <div class="plainbox">
	                                        <%#Eval("ModelName")%>&nbsp;	                                    
	                                        <asp:Label id="lblProductID" runat="server" Visible="False" Text='<%#Eval("ProductID")%>'></asp:Label>  
	                                        <br />
                    		                
	                                        <%#Eval("Description")%><br />                				  
                                        </div>
                                    </td>                                                                            
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr> 
                </table>
            </td>
        </tr>
        <tr>            
            <td colspan="2">
                 Payment:                
                <asp:RadioButtonList ID="radPayType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" >				                            
                </asp:RadioButtonList>    
                <br /><br />
           
                Prix unitaire (sera appliqué à tous les items): 
                <asp:TextBox ID="txtUnitPrice" runat="server">0</asp:TextBox>
                <asp:RangeValidator id="RangeValidator1" runat="server" ControlToValidate="txtUnitPrice" MinimumValue="0" MaximumValue="1000000" Type="Double" Display="Dynamic">
                    *
                </asp:RangeValidator>
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
    
    
    <table>
        <tr>
	        <td>
                <asp:Label ID="lblMessage" runat="server" Text="" Font-Size="X-Large" ForeColor="red"></asp:Label>
	        </td>
	    </tr>
	    <tr>
	        <td >
	            <asp:DataList ID="PhotoList" runat="Server"	cssclass="view"	dataSourceID="odsPhotos" 
		            repeatColumns="1" repeatdirection="Horizontal" DataKeyField="PhotoID">
            		
		            <HeaderStyle horizontalalign="left" />
            		
		            <ItemTemplate>        		    
			            <table id="Table1" border="1" width="100%" cellpadding="0" cellspacing="0"  runat="server">        				
				            <tr>            					
					            <td>					                
					                <img src="..\Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthFull") %>px; height:<%# Eval("HeightFull") %>px;' alt='<%# Eval("PhotoID") %>' />
					                <br />(<asp:Label ID="PhotoID" runat="server" Text='<%#Eval("PhotoID").ToString()%>'></asp:Label>)
					            </td>
					            <td style="vertical-align:middle">
					                Quantité: <asp:TextBox ID="txtQuantity" runat="server" >0</asp:TextBox>
					                <asp:RangeValidator id="RangeValidator2" runat="server" ControlToValidate="txtQuantity" MinimumValue="0" MaximumValue="1000000" Type="Integer" Display="Dynamic">
				                        *
				                    </asp:RangeValidator>
					            </td>
				            </tr>			        			                
			            </table>        			
		            </ItemTemplate>		        
	            </asp:DataList>
	        </td>
	    </tr>
	    <tr>
	        <td>
                <asp:Button ID="btnCreateOrder" runat="server" Text="Créer la commande" OnClick="btnCreateOrder_Click" />
	        </td>
	    </tr>	    
	</table>
	
	<asp:ObjectDataSource ID="odsPhotos" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos">
		<SelectParameters>
			<asp:Parameter Name="AlbumID" Type="Int32" DefaultValue="0"/>			
		</SelectParameters>		
	</asp:ObjectDataSource>


</asp:Content>

