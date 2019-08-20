<%@ page language="VB" masterpagefile="admin.master" autoeventwireup="false" inherits="Admin_admin_user_generation, App_Web_kw1ulmho" title="User generation" stylesheettheme="Admin" enableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <table style="width: 100%;">
        
        
        <tr>
            <th colspan="2" style="text-align: left;width: 30%;">
                <br /><bR />Génération d'usagers
            </th>
        </tr>
    
        <tr>
            <td>
                <asp:CheckBox ID="chkFromFile" runat="server" Text="À partir d'un fichier" OnCheckedChanged="chkFromFile_CheckedChanged" AutoPostBack="true" TextAlign="Left" Width="166px" />
                <asp:CheckBox ID="chkIgnoreFirstLine" runat="server" Enabled="false" Text="Ignorer 1e ligne?" TextAlign="Left"  />
                <asp:CheckBox ID="chkUserNamePassword" runat="server" Enabled="false" Text="UserName et Pwd inclus?" TextAlign="Left"  />
            </td>
            <td >                
                <asp:textbox ID="txtUserFile" runat="server" Enabled="false" Width="431px" />
            </td>
        </tr>
        
        <tr>
            <td >
                Nombre d'usagers à créer:
            </td>
            <td >
                <asp:TextBox ID="txtNbUsersToCreate" runat="server" Text="1"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" MaximumValue="9999999999" ControlToValidate="txtNbUsersToCreate" MinimumValue="0">Nombre invalide</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td >
                Catégorie d'usagers à créer:
            </td>
            <td >
                <asp:DropDownList ID="cboUserCategory" runat="server">
                    <asp:ListItem Value="1000">(1000) Clients - Divers</asp:ListItem>
                    <asp:ListItem Value="1001">(1001) Clients - Écoles Primaires</asp:ListItem>
                    <asp:ListItem Value="1002">(1002) Clients - Écoles Secondaires</asp:ListItem>
                    <asp:ListItem Value="1003">(1003) Clients - Universités</asp:ListItem>
                    <asp:ListItem Value="1004">(1004) Clients - Organisme Sportif</asp:ListItem>
                    <asp:ListItem Value="2000">(2000) Photographes</asp:ListItem>
                    <asp:ListItem Value="3000">(3000) Laboratoires</asp:ListItem>
                    <asp:ListItem Value="4000">(4000) Événements</asp:ListItem>
                    <asp:ListItem Selected="true" Value="5000">(5000) Usagers</asp:ListItem>
                    <asp:ListItem Value="9000">(9000) Administrateurs</asp:ListItem>
        
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td >
                Fichier de sortie:
            </td>
            <td >
                <asp:textbox ID="txtOutputFile" runat="server" Width="431px" Text="users.csv" />
            </td>            
        </tr>
        <tr>
            <td>
                Événement:
            </td>
            <td>
                <asp:DropDownList ID="EventDDL" runat="server" DataTextField="Name" DataValueField="Code">
                </asp:DropDownList>
            </td>
        </tr>
        
        <tr>
            <td >
                <asp:Button ID="btnGenerate" OnClick="btnGenerate_Click" runat="server" Text="Générer les usagers" />
            </td>
            <td >
             
            </td>
        </tr>       
        
        <tr>
        <td colspan="2">
            <blockquote>
                <asp:Label ID="resultMessage" runat="server" ForeColor="Red"></asp:Label>
            </blockquote>
        </td>
        </tr>
    </table>

</asp:Content>

