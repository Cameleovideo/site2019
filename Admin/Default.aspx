<%@ page language="vb" masterpagefile="admin.master" autoeventwireup="true" inherits="_Default, App_Web_kw1ulmho" title="Administration Home" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
  
    <asp:Label ID="Label1" runat="server">Nb sessions:</asp:Label>
    <asp:Label ID="lblSessions" runat="server" Text=""></asp:Label>
           
    <asp:BulletedList ID="liveSessions" DisplayMode="HyperLink" runat="server" style="width:500px;display:inline">                    
    </asp:BulletedList>         
    
    
</asp:Content>

