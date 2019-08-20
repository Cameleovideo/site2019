<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client, App_Web_q91opoz6" %>



<table cellspacing="1" cellpadding="2"  width="95%" >      
    <tr>
        <td >
            <asp:label id="lblClientUserName" runat="server" text="Numéro d'établissement"></asp:label>
        </td>
        <td>
            <asp:label id="lblClientUserNameValue" runat="server"></asp:label>
        </td>
    </tr>  
    <tr>
        <td style="width:50%">
            <asp:label id="lblCameleoRep" runat="server" text="Directeur de compte (Caméléo)"></asp:label>
        </td>
        <td style="width:50%">
            <asp:DropDownList ID="lstCameleoRep" Width="100%" runat="server" >
            </asp:DropDownList>                  
        </td>
    </tr>
    
    <tr>
        <td >
            <asp:label id="lblPhotograph" runat="server" text="Directeur de compte (Territoire)"></asp:label>
        </td>
        <td>
            <asp:DropDownList ID="lstPhotograph" Width="100%" runat="server" >
            </asp:DropDownList>                  
        </td>
    </tr>
    
    <tr>
        <td >
            <asp:label id="lblClientType" runat="server" text="Type d'établissement"></asp:label>
        </td>
        <td>
            <asp:DropDownList  ID="lstClientTypes" runat="server" Width="100%" DataTextField="ClientType" DataValueField="ClientTypeID" OnSelectedIndexChanged="lstClientTypes_SelectedIndexChanged" AutoPostBack="true" >
            </asp:DropDownList>                  
        </td>
    </tr>   
    
    
    <tr>
        <td >
            <asp:label id="ClientNameLabel" runat="server" meta:resourcekey="ClientNameLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtClientName" Width="98%" enabled="false"></asp:TextBox>                    
        </td>
    </tr>
    
    <tr>
        <td >
            <asp:label id="lblParentOrganization" runat="server" Text="Comission scolaire, faculté ou association"></asp:label>
        </td>
        <td>
            <asp:DropDownList  ID="lstParentOrganization" Width="100%" runat="server" DataTextField="Name" DataValueField="OrganizationID" >
            </asp:DropDownList>
        </td>
    </tr>   
   
    
    <tr>
        <td >
            <asp:label id="lblClientCategory" runat="server" text="Catégorie de client"></asp:label>
        </td>
        <td>
            <asp:DropDownList ID="lstClientCategories"  Width="100%" runat="server" >
            </asp:DropDownList>                  
        </td>
    </tr>
    
    <tr>
        <td colspan="2">  
            <asp:ImageButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" ImageUrl="~/App_Themes/Admin/Images/modifier.png"/>
            <asp:ImageButton ID="btnCancel" runat="server" visible="false" OnClick="btnCancel_Click"  ImageUrl="~/App_Themes/Admin/Images/annuler.png"/>
            <asp:ImageButton ID="btnSave" runat="server" visible="false" OnClick="btnSave_Click" ImageUrl="~/App_Themes/Admin/Images/sauvegarder.png"/>          
        </td>
        
    </tr> 
</table> 

    
    
    
    