<%@ page language="VB" masterpagefile="admin.master" autoeventwireup="false" inherits="Admin_admin_orderscheckup, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">

    <table  style="height:100%">
        <tr>            
            <td>
                Commande:                 
                <asp:DropDownList ID="lstProcessingDates" DataSourceID="SqlDataSource1" runat="server" AutoPostBack="false"
                    DataTextField = "ProcessingDate"
                    DataValueField = "ProcessingDate">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="btnProcessingDates" runat="server" Text="Rafraîchir" OnClick="btnProcessingDates_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="dgResults" runat="server" AutoGenerateColumns="False"  
			        CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="OrderID"
			        AllowPaging="false" PageSize="50000" OnRowDataBound="dgResults_RowDataBound">
    			    
				    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				    <Columns>					    
					    <asp:BoundField DataField="OrderID" HeaderText="OrderID"  SortExpression="OrderID" />					    
                        <asp:TemplateField HeaderText="Oversized"> 
                            <ItemTemplate >
                                <asp:Label ID="lblEnvelope" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Suivi"> 
                            <ItemTemplate >
                                <asp:Label ID="lblFollowup" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ShippingMethod" HeaderText="Shipping"  SortExpression="ShippingMethod" />                        
                        <asp:TemplateField HeaderText="Contenu"> 
                            <ItemTemplate >
                                <asp:Label ID="lblContent" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
				    </Columns>
				    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
				    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
				    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
				    
				    <AlternatingRowStyle BackColor="lightgray" ForeColor="#284775" />
    				
				    <emptydatatemplate>                          
                        Aucune commande trouvée.
                    </emptydatatemplate> 
			    </asp:GridView>            
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblShipLabels" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>" 
		SelectCommand="SELECT DISTINCT ProcessingDate FROM CMRC_Orders ORDER BY ProcessingDate DESC">		
	</asp:SqlDataSource>
	
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>" 
		SelectCommand="SELECT * FROM CMRC_Orders WHERE ProcessingDate = @ProcessingDate ORDER BY OrderID">		
		
		<SelectParameters>
		    <asp:controlparameter Name="ProcessingDate" Type="String" controlid="lstProcessingDates" propertyname="SelectedItem.Value" DefaultValue=""/>
		</SelectParameters>		
	</asp:SqlDataSource>

</asp:Content>


