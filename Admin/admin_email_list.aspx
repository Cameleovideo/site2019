<%@ page language="VB" masterpagefile="admin.master" autoeventwireup="false" inherits="Admin_admin_email_list, App_Web_kw1ulmho" title="Untitled Page" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">

    <table>	    
	    <tr>	        
	        <td>
                <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
            </td>
	    </tr>	    
	</table>



    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="true">	    
	</asp:GridView>
	
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting"  
        ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
        SelectCommand="SELECT DISTINCT(aspnet_Membership.Email), aspnet_Users.UserName,  CommerceDB.dbo.CMRC_OrderItems.EventUserName FROM aspnet_Membership JOIN aspnet_Users on aspnet_Users.UserID = aspnet_Membership.UserID JOIN CommerceDB.dbo.CMRC_Orders ON aspnet_Users.UserName = CommerceDB.dbo.CMRC_Orders.UserName JOIN CommerceDB.dbo.CMRC_OrderItems ON CommerceDB.dbo.CMRC_OrderItems.OrderId = CommerceDB.dbo.CMRC_Orders.OrderId WHERE Email LIKE '%@%' AND (aspnet_Membership.Email NOT LIKE '%cameleophoto.com%') AND (aspnet_Membership.Email <> 'marc-andre.gauthier@videotron.ca') AND aspnet_Users.UserName NOT IN (SELECT UserName FROM aspnet_NoMailUsers) AND aspnet_Users.UserName LIKE '5%' ORDER BY Email, UserName" >        
    </asp:SqlDataSource>

</asp:Content>

