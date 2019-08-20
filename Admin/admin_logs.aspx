<%@ page language="vb" masterpagefile="admin.master" autoeventwireup="true" inherits="Admin_admin_logs, App_Web_kw1ulmho" title="Untitled Page" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
	
	<table>	    
	    <tr>	        
	        <td>
                Rechercher le texte: 
	        </td>
	        <td>
	            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>                
            </td>
	    </tr>	    
	    
	    <tr>	        
	        <td>
                Nombre de lignes retournées: 
	        </td>
	        <td>
                <asp:RadioButton id="radTop" Text="Nombre limité: " Checked="True" GroupName="radGroup1" runat="server" />
                <asp:TextBox ID="txtNbRecords" runat="server">1000</asp:TextBox>
                <asp:RangeValidator ControlToValidate="txtNbRecords" MinimumValue="0"></asp:RangeValidator>
                <br />
                <asp:RadioButton id="radAll" Text="Toutes les lignes" GroupName="radGroup1" runat="server" />                
            </td>
	    </tr>	    
	    <tr>
	        <td colspan="2">
	            <asp:Button ID="btnRefresh" runat="server" Text="Rechercher" OnClick="btnRefresh_Click" />
	        </td>
	    </tr>
	</table>
	
	<br />
	<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
	    AllowPaging="True" AllowSorting="True" PageSize="300" AutoGenerateColumns="false">
	    <Columns>			                                
            <asp:BoundField  DataField="logID" HeaderText="ID">                
            </asp:BoundField>	        
            <asp:BoundField  DataField="category" HeaderText="Catégorie">                
            </asp:BoundField>	                    
            <asp:hyperlinkfield datatextfield="UserName"                
                datanavigateurlfields="UserName"
                datanavigateurlformatstring="~\admin\admin_user_details.aspx?UserName={0}"          
                headertext="UserName"/>
            <asp:BoundField  DataField="message" HeaderText="Message">                
            </asp:BoundField>	        
            <asp:BoundField  DataField="event" HeaderText="Event">
            </asp:BoundField>	        
            <asp:BoundField  DataField="itemID" HeaderText="ItemID">                
            </asp:BoundField>	        
            <asp:BoundField  DataField="Date" HeaderText="Date">                
            </asp:BoundField>	        
        </Columns>
	</asp:GridView>
	
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>">
	</asp:SqlDataSource>
</asp:Content>

