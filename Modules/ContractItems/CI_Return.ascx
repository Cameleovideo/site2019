<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_Return, App_Web_r5pyi2zf" %>


<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblReturnHeader" runat="server" meta:resourcekey="lblReturnHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblReturn" runat="server" meta:resourcekey="lblReturnResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radReturn" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radReturn_SelectedIndexChanged">                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvReturn" runat="server" ControlToValidate="radReturn" ValidationGroup="ContractItems" meta:resourcekey="rfvReturnResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:middle">
                <asp:Label ID="lblReturnValue" runat="server" meta:resourcekey="lblReturnValueResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:TextBox ID="txtReturn" runat="server" OnTextChanged="txtReturn_TextChanged" Text="15" ValidationGroup="ContractItems"></asp:TextBox>
                <asp:RangeValidator ID="rvReturn" ControlToValidate="txtReturn" MinimumValue="0" MaximumValue="100" Type="Integer" meta:resourcekey="rvReturnValueResource1" runat="server" ValidationGroup="ContractItems"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="rfvReturnValue" ControlToValidate="txtReturn" runat="server" meta:resourcekey="rfvReturnValueResource1" ValidationGroup="ContractItems"></asp:RequiredFieldValidator>                
            </td>
        </tr>
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeReturn" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblReturnHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>