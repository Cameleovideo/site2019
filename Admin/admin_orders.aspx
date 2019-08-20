<%@ page language="vb" masterpagefile="admin.master" autoeventwireup="true" inherits="admin_orders, App_Web_kw1ulmho" title="Order Administration" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
<h1>Order Administration</h1>
<table width=100%>
    <tr>
	    <td>
	        <table>
			    <tr>
    			    <th>Par Order ID</th>
			        <th></th>
			        <th>Par UserName</th>
			        <th></th>
			        <th>Par TransactionID</th>
				    <th></th>
			        <th>Par OrderStatus</th>
			        <th></th>
			        <th>Par Date</th>
			        <th></th>
			        <th>Par liste d'Order id (séparé par des virgules)</th>
		        </tr>
			    <tr style="text-align:center">
			        <td>
				        <asp:TextBox ID="txtOrderID" runat="server"></asp:TextBox><br />
					    <asp:Button ID="btnOrderIDSearch" runat="server" OnClick="btnOrderIDSearch_Click" Text="Go" />
					    <br /><br />
					    <b>Légende:</b><br /><br />
                        <asp:Label ID="lblFollowup" BackColor="orange"  runat="server" Text="Suivi nécessaire"></asp:Label><br />
                        <asp:Label ID="lblPhone" BackColor="yellow" runat="server" Text="Par téléphone"></asp:Label><br />
                        <asp:Label ID="lblCredit" BackColor="red"  runat="server" Text="Par carte de crédit 'failed'"></asp:Label><br>
                        <asp:Label ID="lblProductsOnly" BackColor="green"  runat="server" Text="Produits dérivés seulement"></asp:Label>
				    </td>				    
				    <td>
				    </td>
				    
			        <td>
				        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br />
					    <asp:Button ID="btnUserSearch" runat="server" OnClick="btnUserSearch_Click" Text="Go" />
					    <br />
                            
				    </td>				    
				    <td>
				    </td>
				    <td>
					    <asp:TextBox ID="txtTransactionID" runat="server"></asp:TextBox><br />
					    <asp:Button ID="btnTrans" runat="server" OnClick="btnTrans_Click" Text="Go" />
					    <br />					    
				    </td>
				    <td>
				    </td>                       					    
				    <td>				       
				        <asp:GridView ID="dgStatus" Runat="server" 
				            AutoGenerateColumns="False" Width="100%"
				            DataKeyNames="OrderStatusID" ShowHeader="false">
					        <Columns>							        
						        <asp:TemplateField >			                            
		                            <ItemTemplate>
                                        <asp:LinkButton ID="btnOrderStatus" CommandName="select" runat="server" Text='<%# Eval("OrderStatus") %>' ></asp:LinkButton>
		                            </ItemTemplate>
		                        </asp:TemplateField>								        
					        </Columns>
				        </asp:GridView>				        
					    <br />
                        <asp:Button ID="btnFollowupList" runat="server" Text="Avec suivi" OnClick="btnFollowupList_Click"/>
                        <asp:Button ID="btnPhoneList" runat="server" Text="Par téléphone" OnClick="btnPhoneList_Click"/>
                        <br /><br />
                        <asp:Button ID="btnWaitingForPaymentCheckup" runat="server" Text="Suivi des ''waiting on payment''" OnClick="btnWaitingForPaymentCheckup_Click" />
				    </td>
				    <td>
				    </td>
				    <td>
				        <table>
				            <tr>
				                <td style="height: 26px">
				                    Date Début
				                </td>
				                <td style="height: 26px">
					                <asp:TextBox ID="txtDateStart" runat="server"></asp:TextBox>
				                </td>
		                    </tr>
			                <tr>
				                <td>Date Fin</td>
				                <td>
					                <asp:TextBox ID="txtDateEnd" runat="server"></asp:TextBox>
				                </td>
		                    </tr>
		                    <tr>
				                <td>
				                </td>
				                <td>
					                <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" />
				                </td>
			                </tr>
				        </table>
				    </td>
				    <td>				    
				    </td>
				    <td>
                        <asp:TextBox ID="txtOrderIDs" runat="server" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox>				    
                        <br />
                        <asp:Label ID="lblErrorMultipleSearch" runat="server" ></asp:Label>
                        <asp:Button ID="btnMultipleOrderIDSearch" runat="server" Text="Go" OnClick="btnMultipleOrderIDSearch_Click" />
                        <asp:Button ID="btndReceivedPayment" runat="server" Text="Change selected to ReceivedPayment" OnClick="btndReceivedPayment_Click" />
				    </td>
		        </tr>			    
		    </table>
        </td>
	</tr>
	
	<tr>
		<td>
			<asp:GridView ID="dgResults" runat="server" AutoGenerateColumns="False" 
			    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="OrderID"
			    onrowdatabound="dgResults_RowDataBound" AllowPaging="true" PageSize="100">
			    
				<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				<Columns>
					<asp:HyperLinkField DataNavigateUrlFields="OrderId" DataNavigateUrlFormatString="admin_order_details.aspx?t={0}"	Text="View" />
					<asp:BoundField DataField="OrderID" HeaderText="OrderID"  SortExpression="OrderID" />					
					<asp:hyperlinkfield datatextfield="UserName"                
                        datanavigateurlfields="UserName"
                        datanavigateurlformatstring="~\admin\admin_user_details.aspx?UserName={0}"          
                        headertext="UserName"/>
					<asp:BoundField DataField="PayPalTransactionID" HeaderText="TransactionID"  SortExpression="PayPalTransactionID" />
					<asp:BoundField DataField="OrderStatus" HeaderText="Status" SortExpression="OrderStatus" />
					<asp:BoundField DataField="PaymentMethod" HeaderText="PaymentMethod" SortExpression="PaymentMethod" />
					<asp:BoundField DataField="ShippingMethod" HeaderText="ShippingMethod" SortExpression="ShippingMethod" />
				    <asp:BoundField DataField="OrderDate" HeaderText="Date" SortExpression="OrderDate" />					
					<asp:BoundField DataField="orderTotal" HeaderText="Total" SortExpression="orderTotal" DataFormatString="{0:C}" HtmlEncode="false">
					    <ItemStyle HorizontalAlign="Right"></ItemStyle>
					</asp:BoundField>
					<asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server"   />
                        </ItemTemplate>                      
                     </asp:TemplateField>
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

