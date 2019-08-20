 <%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_PersonelGift, App_Web_r5pyi2zf" %>


<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblPersonelGiftHeader" runat="server" meta:resourcekey="lblPersonelGiftHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblPersonelGift" runat="server" meta:resourcekey="lblPersonelGiftResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:CheckBoxList ID="chkPersonelGift" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="chkPersonelGift_SelectedIndexChanged">                
                    <asp:ListItem meta:resourcekey="chkKitResource1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="chkDigitalRigthsResource1" Selected="True"></asp:ListItem>
                </asp:CheckBoxList>                
            </td>
        </tr>        
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpePersonelGift" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblPersonelGiftHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>