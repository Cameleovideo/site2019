<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_NbSubjects, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblNbSubjectsHeader" runat="server" meta:resourcekey="lblNbSubjectsHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr>
            <td style="vertical-align:middle">
                <asp:Label ID="lblNbSubjects" runat="server" meta:resourcekey="lblNbSubjectsResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:TextBox ID="txtNbSubjects" runat="server" OnTextChanged="txtNbSubjects_TextChanged" ValidationGroup="ContractItems"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNbSubjects" ControlToValidate="txtNbSubjects" runat="server" meta:resourcekey="rfvNbSubjectsResource1" ValidationGroup="ContractItems"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvNbSubjects" ControlToValidate="txtNbSubjects" MinimumValue="0" MaximumValue="5" meta:resourcekey="rvNbSubjectsResource1" runat="server" ValidationGroup="ContractItems"></asp:RangeValidator>
            </td>
        </tr>
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeNbSubjects" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblNbSubjectsHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>