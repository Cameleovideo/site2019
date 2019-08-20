<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_FamilyPictures, App_Web_r5pyi2zf" %>


<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblFamilyPicturesHeader" runat="server" meta:resourcekey="lblFamilyPicturesHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblFamilyPictures" runat="server" meta:resourcekey="lblFamilyPicturesResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radFamilyPictures" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radFamilyPictures_SelectedIndexChanged">                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvFamilyPictures" runat="server" ControlToValidate="radFamilyPictures" ValidationGroup="ContractItems" meta:resourcekey="rfvFamilyPicturesResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:top">
                <asp:Label ID="lblNotes" runat="server" meta:resourcekey="lblNotesResource1"></asp:Label>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="txtAddNote" runat="server" Columns="45" OnTextChanged="txtAddNote_TextChanged" ValidationGroup="ContractItems"></asp:TextBox>
                <asp:ImageButton ID="btnAddNote" ImageUrl="~/App_Themes/Admin/Images/ajouter.png" runat="server" style="background-color:White" OnClick="btnAddNote_Click" ValidationGroup="ContractItems" />
                <br />
                <asp:TextBox ID="txtNotes" runat="server" Enabled="true" Columns="55" Rows="10" TextMode="MultiLine" ReadOnly="true" Wrap="true"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeFamilyPictures" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblFamilyPicturesHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>