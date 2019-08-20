<%@ page language="VB" autoeventwireup="false" inherits="Admin_admin_user_paper_form, App_Web_zgfxqbvs" stylesheettheme="Admin" enableEventValidation="false" %>
<%@ Register Src="~/Modules/UserPaperForm.ascx" TagName="UserPaperform" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">    
</head>

<body>
    <form id="form1" runat="server">
        <div id="SearchHeader" class="offsetleftbox" runat="server">
            <h3>
                <asp:Label ID="Label1" runat="server" meta:resourcekey="pageTitle" Text="Label"></asp:Label>
            </h3>
            
            <asp:Label ID="lblLanguage" meta:resourcekey="lblLanguageResource1" runat="server"></asp:Label>
            <asp:DropDownList runat="server" ID="dropDownListLanguages">
                <asp:ListItem Value="">Français (Québec)</asp:ListItem>
                <asp:ListItem Value="EN-CA">Anglais (Québec)</asp:ListItem>
                <asp:ListItem Value="FR-CA">Français (Canada)</asp:ListItem>
                <asp:ListItem Value="EN-US">Anglais (Canada/USA)</asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            
            <table>
                <tr>   
                    <td>
                        Usager: 
                    </td>                 
                    <td>
                        
                        <asp:RadioButtonList ID="radAllUsers" runat="server" OnSelectedIndexChanged="radAllUsers_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="true">
                            <asp:ListItem Selected="true" Text="Un usager" Value="One"></asp:ListItem>
                            <asp:ListItem Text="Tous les usagers" Value="All"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>                    
                    <td colspan="2">
                        <asp:CheckBox ID="chkWithoutOrder" Checked="true" Text="Usagers sans commande" Visible="false" runat="server" />
                        <asp:Label ID="lblEnterUserID" meta:resourcekey="lblEnterUserID" runat="server"></asp:Label>
                        <asp:TextBox ID="txtUserId" runat="server" meta:resourcekey="txtUserIdResource1"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br /><br />
            
            <asp:Label ID="lblEnterEventID" meta:resourcekey="lblEnterEventID" runat="server"></asp:Label>
            <asp:TextBox ID="txtEventID" runat="server" meta:resourcekey="txtEventID"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEventId" runat="server">Event requis</asp:RequiredFieldValidator>
            <br /><br />
            
            <asp:Button meta:resourcekey="btnSearchUsers" ID="btnSearchPhotos" runat="server" Text="Button" OnClick="btnSearchPhotos_Click" /> 
            <asp:Button ID="btnCancel" runat="server" Text="Annuler" OnClick="btnCancel_Click" /> 
            <br /><br /><br />    
            
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="1" datakeynames="UserName"
                 ForeColor="#333333" GridLines="Vertical" AutoGenerateEditButton="false" OnRowDataBound="gvUsers_RowDataBound" AllowPaging="true" PageSize="200">
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                
                <Columns>  
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>                     
                            <asp:CheckBox ID="chkPrint" runat="server" Checked="true">
                            </asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" >    
                        <itemstyle Width="200">
                        </itemstyle>
                    </asp:BoundField> 
                    <asp:TemplateField HeaderText="Photos">
                        <ItemTemplate>                     
                            <asp:CheckBoxList ID="chkListsPhotos" runat="server" RepeatDirection="Horizontal" RepeatColumns="10">
                            </asp:CheckBoxList>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                </Columns>                
                
                <RowStyle BackColor="#E3EAEB" />
                <EditRowStyle BackColor="#7C6F57" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>           
            
            <asp:Button ID="btnGo" runat="server" Text="Button" meta:resourcekey="btnGoRessource" />            
            <br />
        </div>
        
        
        <asp:PlaceHolder ID="PaperFormPlaceHolder" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>


    

