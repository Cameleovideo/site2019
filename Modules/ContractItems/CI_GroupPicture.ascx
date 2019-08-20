<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_GroupPicture, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblGroupPictureHeader" runat="server" meta:resourcekey="lblGroupPictureHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblGroupPicture" runat="server" meta:resourcekey="lblGroupPictureResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radGroupPicture" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radGroupPicture_SelectedIndexChanged">                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1" Selected="true"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvGroupPicture" runat="server" ControlToValidate="radGroupPicture" ValidationGroup="ContractItems" meta:resourcekey="rfvGroupPictureResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblPrints" runat="server" meta:resourcekey="lblPrintsResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radPrints" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radPrints_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="rad5X7Resource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="2" meta:resourcekey="radOtherResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvPrints" runat="server" ControlToValidate="radPrints" ValidationGroup="ContractItems" meta:resourcekey="rfvPrintsResource1"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblDigital" runat="server" meta:resourcekey="lblDigitalResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radDigital" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radDigital_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1" Selected="True"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesWithRightsResource1"></asp:ListItem>
                    <asp:ListItem value="2" meta:resourcekey="radYesWithoutRightsResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvDigital" runat="server" ControlToValidate="radDigital" ValidationGroup="ContractItems" meta:resourcekey="rfvDigitalResource1"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblClientAccount" runat="server" meta:resourcekey="lblClientAccountResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radClientAccount" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radClientAccount_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesWithRightsResource1"></asp:ListItem>
                    <asp:ListItem value="2" meta:resourcekey="radYesWithoutRightsResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvClientAccount" runat="server" ControlToValidate="radClientAccount" ValidationGroup="ContractItems" meta:resourcekey="rfvClientAccountResource1"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblCrazyPersonel" runat="server" meta:resourcekey="lblCrazyPersonelResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radCrazyPersonel" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radCrazyPersonel_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>                    
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvCrazyPersonel" runat="server" ControlToValidate="radCrazyPersonel" ValidationGroup="ContractItems" meta:resourcekey="rfvCrazyPersonelResource1"></asp:RequiredFieldValidator>                
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblCrazyGraduates" runat="server" meta:resourcekey="lblCrazyGraduatesResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radCrazyGraduates" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radCrazyGraduates_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>                    
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvCrazyGraduates" runat="server" ControlToValidate="radCrazyGraduates" ValidationGroup="ContractItems" meta:resourcekey="rfvCrazyGraduatesResource1"></asp:RequiredFieldValidator>                
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

<ajaxToolkit:CollapsiblePanelExtender ID="cpeGroupPicture" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblGroupPictureHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>