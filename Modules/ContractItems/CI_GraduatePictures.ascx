<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_GraduatePictures, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblGraduatePicturesHeader" runat="server" meta:resourcekey="lblGraduatePicturesHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblGraduatePictures" runat="server" meta:resourcekey="lblGraduatePicturesResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radGraduatePictures" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radGraduatePictures_SelectedIndexChanged">                    
                    <asp:ListItem value="0" Selected="true" meta:resourcekey="radNoResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvGraduatePictures" runat="server" ControlToValidate="radGraduatePictures" ValidationGroup="ContractItems" meta:resourcekey="rfvGraduatePicturesResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblSameDay" runat="server" meta:resourcekey="lblSameDayResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radSameDay" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radSameDay_SelectedIndexChanged">                    
                    <asp:ListItem value="0"  meta:resourcekey="radSameDayResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radOtherDateResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvSameDay" runat="server" ControlToValidate="radSameDay" ValidationGroup="ContractItems" meta:resourcekey="rfvSameDayResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:top">
                <asp:Label ID="Label1" runat="server" meta:resourcekey="lblGownColorResource1"></asp:Label>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="txtGownColor" runat="server" Columns="45" OnTextChanged="txtGownColor_TextChanged" ValidationGroup="ContractItems"></asp:TextBox>                
                <asp:RequiredFieldValidator id="rfvGownColor" runat="server" ControlToValidate="txtGownColor" ValidationGroup="ContractItems" meta:resourcekey="rfvGownColorResource1"></asp:RequiredFieldValidator>
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

<ajaxToolkit:CollapsiblePanelExtender ID="cpeGraduatePictures" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblGraduatePicturesHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>