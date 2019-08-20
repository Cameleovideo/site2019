<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_Invoice, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblInvoiceHeader" runat="server" meta:resourcekey="lblInvoiceHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblInvoice" runat="server" meta:resourcekey="lblInvoiceResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:CheckBox ID="chkInvoice" runat="server" meta:resourcekey="chkInvoiceResource1" OnCheckedChanged="chkInvoice_CheckedChanged" />
            </td>
        </tr>        
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeInvoice" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblInvoiceHeader" Collapsed="false" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>