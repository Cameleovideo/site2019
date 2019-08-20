<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_NbPoses, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblNbPosesHeader" runat="server" meta:resourcekey="lblNbPosesHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr>
            <td style="vertical-align:middle">
                <asp:Label ID="lblNbPoses" runat="server" meta:resourcekey="lblNbPosesResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:TextBox ID="txtNbPoses" runat="server" OnTextChanged="txtNbPoses_TextChanged" ValidationGroup="ContractItems"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNbPoses" ControlToValidate="txtNbPoses" runat="server" meta:resourcekey="rfvNbPosesResource1" ValidationGroup="ContractItems"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvNbPoses" ControlToValidate="txtNbPoses" MinimumValue="0" MaximumValue="5" meta:resourcekey="rvNbPosesResource1" runat="server" ValidationGroup="ContractItems"></asp:RangeValidator>
            </td>
        </tr>
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeNbPoses" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblNbPosesHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>