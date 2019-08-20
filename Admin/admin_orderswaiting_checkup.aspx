<%@ page language="VB" autoeventwireup="true" inherits="Admin_admin_orderswaiting_checkup, App_Web_kw1ulmho" masterpagefile="admin.master" stylesheettheme="Admin" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <a href="admin_orders.aspx">Retour aux commandes</a>
    <br /><br />
    
    <asp:Button ID="btnCancelSelected" runat="server" Text="Annuler les commandes sélectionnées" OnClick="btnCancelSelected_Click" />
    <br /><br />
    
    <asp:GridView ID="dgResults" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="Horizontal" DataKeyNames="OrderID" onrowdatabound="dgResults_RowDataBound" AllowPaging="false">	    
		
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				
		<Columns>		    
			<asp:HyperLinkField DataNavigateUrlFields="OrderId" DataNavigateUrlFormatString="admin_order_details.aspx?t={0}"	Text="View" />
			<asp:BoundField DataField="OrderID" HeaderText="OrderID"  SortExpression="OrderID" />					
			<asp:hyperlinkfield datatextfield="UserName" datanavigateurlfields="UserName" datanavigateurlformatstring="~\admin\admin_user_details.aspx?UserName={0}" headertext="UserName"/>						
			<asp:BoundField DataField="PaymentMethod" HeaderText="Payment" SortExpression="PaymentMethod" />
			<asp:BoundField DataField="ShippingMethod" HeaderText="Ship" SortExpression="ShippingMethod" />
		    <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate" DataFormatString="{0:d}" />
			<asp:BoundField DataField="orderTotal" HeaderText="Total" SortExpression="orderTotal" DataFormatString="{0:C}" HtmlEncode="false">
			    <ItemStyle HorizontalAlign="Right"></ItemStyle>
			</asp:BoundField>			
			<asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelect" runat="server"   />
                </ItemTemplate>                      
             </asp:TemplateField>
			<asp:TemplateField HeaderText="Duplicates?">
                <ItemTemplate>
                    <asp:GridView ID="dgSubResults" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" DataKeyNames="OrderID" AllowPaging="false" onrowdatabound="dgSubResults_RowDataBound">
                                                
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            			
                        <Columns>	                        
	                        <asp:BoundField DataField="OrderID" HeaderText="OrderID"  SortExpression="OrderID" />			
	                        <asp:BoundField DataField="OrderStatus" HeaderText="Status" SortExpression="OrderStatus" />		
	                        <asp:BoundField DataField="PaymentMethod" HeaderText="Payment" SortExpression="PaymentMethod" />
			                <asp:BoundField DataField="ShippingMethod" HeaderText="Ship" SortExpression="ShippingMethod" />
		                    <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate" DataFormatString="{0:d}" />
			                <asp:BoundField DataField="orderTotal" HeaderText="Total" SortExpression="orderTotal" DataFormatString="{0:C}" HtmlEncode="false">
			                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
			                </asp:BoundField>
	                    </Columns>
                    </asp:GridView>
                </ItemTemplate>                      
             </asp:TemplateField>			
		</Columns>		
		
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />		
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		
		<emptydatatemplate>                          
            Aucune commande trouvée.
        </emptydatatemplate>         
        
	</asp:GridView>
    
</asp:Content>

