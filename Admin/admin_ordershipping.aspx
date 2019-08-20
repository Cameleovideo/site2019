<%@ page language="VB" masterpagefile="admin.master" autoeventwireup="false" inherits="Admin_admin_ordershipping, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
<table>
    <tr>
        <td>
            <table border="1">
                <tr>
                    <td>       
                        Commande:                 
                        <asp:DropDownList ID="lstProcessingDates" DataSourceID="SqlDataSource1" runat="server" AutoPostBack="false"
                            DataTextField = "ProcessingDate"
                            DataValueField = "ProcessingDate">
                        </asp:DropDownList>   
                        <asp:Button ID="btnProcessingDates" runat="server" Text="Sélectionner" OnClick="btnProcessingDates_Click" />              
                    </td>
                    <td rowspan="3">
                        <b>Légende:</b><br /><br />
                        <asp:Label ID="Label1" BackColor="orange"  runat="server" Text="Suivi nécessaire"></asp:Label><br />
                        <asp:Label ID="Label2" BackColor="yellow" runat="server" Text="Par téléphone"></asp:Label><br />
                        <asp:Label ID="Label3" BackColor="green"  runat="server" Text="Produits dérivés seulement"></asp:Label><br />
                        <asp:Label ID="Label4" BackColor="purple"  runat="server" Text="Shipping express"></asp:Label><br />
                        <asp:Label ID="Label5" BackColor="Blue"  runat="server" Text="Shipping international"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        ShipDate: 
                        <asp:TextBox ID="txtShipDate" runat="server" ></asp:TextBox><br /><br />
                        <asp:Button ID="btnShip" runat="server" Text="SetShipped" onclick="btnShip_Click"/>
                        <asp:Button ID="btnProcessed" runat="server" Text="SetProcessedButNotShipped" onclick="btnProcessed_Click"/>                        
                    </td>                    
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnShipLabels" runat="server" Text="ShippingLabels" onclick="btnShipLabels_Click"/>                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr id="trShipLabels" runat="server" visible="false">
        <td>
            <asp:Label ID="lblShipLabels" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
		<td>
			<asp:GridView ID="dgResults" runat="server" AutoGenerateColumns="False" 
			    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="OrderID"
			    AllowPaging="true" PageSize="1000" OnRowDataBound="dgResults_RowDataBound">
			    
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<Columns>
					<asp:HyperLinkField DataNavigateUrlFields="OrderId" DataNavigateUrlFormatString="admin_order_details.aspx?t={0}"	Text="View" />
					<asp:BoundField DataField="OrderID" HeaderText="OrderID"  SortExpression="OrderID" />
					<asp:TemplateField HeaderText="Ship">                        
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

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>" 
	SelectCommand="SELECT DISTINCT ProcessingDate FROM CMRC_Orders ORDER BY ProcessingDate DESC">		
</asp:SqlDataSource>

</asp:Content>

