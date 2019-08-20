<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_orders_checkprocessing, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
<table>
    <tr>
        <td>
            <table>
                <tr>
                    <td>                        
                        <asp:Button ID="btnSetReceived" runat="server" Text="SetReceivedPayment" onclick="btnSetReceived_Click"/>                        
                        <br /><br />
                    </td>
                    <td>
                        <b>Légende:</b><br /><br />
                        <asp:Label ID="lblFollowup" BackColor="orange"  runat="server" Text="Suivi nécessaire"></asp:Label><br />
                        <asp:Label ID="lblPhone" BackColor="yellow" runat="server" Text="Par téléphone"></asp:Label><br />                        
                        <asp:Label ID="lblProductsOnly" BackColor="green"  runat="server" Text="Produits dérivés seulement"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>    
    <tr>
		<td>
			<asp:GridView ID="dgResults" runat="server" AutoGenerateColumns="False" 
			    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="OrderID"
			    AllowPaging="true" PageSize="50" OnRowDataBound="dgResults_RowDataBound">
			    
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<Columns>
					<asp:HyperLinkField DataNavigateUrlFields="OrderId" DataNavigateUrlFormatString="admin_order_details.aspx?t={0}"	Text="View" />
					<asp:BoundField DataField="OrderID" HeaderText="OrderID"  SortExpression="OrderID" />
					<asp:TemplateField HeaderText="SetReceivedPayment">                        
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server"   />
                        </ItemTemplate>                      
                     </asp:TemplateField>

					<asp:BoundField DataField="UserName" HeaderText="User" SortExpression="UserName" />					
					<asp:BoundField DataField="PayPalTransactionID" HeaderText="TransactionID"  SortExpression="PayPalTransactionID" />
					<asp:BoundField DataField="OrderStatus" HeaderText="Status" SortExpression="OrderStatus" />
					<asp:BoundField DataField="PaymentMethod" HeaderText="PaymentMethod" SortExpression="PaymentMethod" />
					<asp:BoundField DataField="ShippingMethod" HeaderText="ShippingMethod" SortExpression="ShippingMethod" />
				    <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate" />					
					<asp:BoundField DataField="orderTotal" HeaderText="Total" SortExpression="orderTotal" DataFormatString="{0:C}" HtmlEncode="false">
					    <ItemStyle HorizontalAlign="Right"></ItemStyle>
					</asp:BoundField>
				</Columns>
				<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<EditRowStyle BackColor="#999999" />
				<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
				
				<emptydatatemplate>                          
                    Aucune commande trouvée.
                </emptydatatemplate> 
                
                <pagersettings mode="NextPreviousFirstLast"                    
                    NextPageImageUrl="..\App_Themes\White\Images\button-next.gif"
                    PreviousPageImageUrl="..\App_Themes\White\Images\button-prev.gif"   
                    FirstPageImageUrl="..\App_Themes\White\Images\button-first.gif"
                    LastPageImageUrl="..\App_Themes\White\Images\button-last.gif"
                    position="TopAndBottom"/> 
                    
                <PagerStyle BackColor="white"/>

			</asp:GridView>
			&nbsp;
		</td>
	</tr>
</table>
</asp:Content>

