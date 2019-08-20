<%@ page language="vb" masterpagefile="~/Default.master" autoeventwireup="true" inherits="Search, App_Web_xkuvhdkn" title="Product Catalog" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<h1><asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label></h1>
	
	<asp:DataList ID="DataList1" Runat="server" DataKeyField="ProductID" DataSourceID="ObjectDataSource1">
			<ItemTemplate>
				<table>
					<tr>
						<td>
							<a href="product.aspx?id=<%# Eval("ProductID") %>" >
								<img src="images/productimages/<%#  Eval("ProductImage") %>" class=thumbimage>
							</a>
						</td>
						<td>
							<div class="plainbox">
								<a href="product.aspx?id=<%# Eval("ProductID") %>">
							
								[<%#Eval("ModelNumber")%>]
								<a href="product.aspx?id=<%# Eval("ProductID") %>"><%#Eval("ModelName")%></a>&nbsp; 
								</A>
								<%#GetPrice(Eval("UnitCost"),Eval("DiscountPercent"))%>
								<asp:Label id="lblProductID" runat="server" Visible="False" Text='<%#Eval("ProductID")%>'></asp:Label>  
								<br />
								<%#Eval("Description")%><br />
								<a href="product.aspx?id=<%# Eval("ProductID") %>">More</a> <IMG src="images/morearrow.gif" align="absMiddle">
						  
							</div>
						</td>
					</tr>
				</table>

					
						
			</ItemTemplate>
		</asp:DataList>
		
		<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Search"
		TypeName="CatalogManager">
		<SelectParameters>
			<asp:QueryStringParameter Name="query" QueryStringField="q" Type="String" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>

