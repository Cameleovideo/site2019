<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_VoluntaryGift, App_Web_r5pyi2zf" %>


<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblVoluntaryGiftHeader" runat="server" meta:resourcekey="lblVoluntaryGiftHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblVoluntaryGift" runat="server" meta:resourcekey="lblVoluntaryGiftResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:CheckBoxList ID="chkVoluntaryGift" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="chkVoluntaryGift_SelectedIndexChanged">                
                    <asp:ListItem meta:resourcekey="chkKitResource1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="chkDigitalRigthsResource1"></asp:ListItem>
                </asp:CheckBoxList>                
            </td>
        </tr>        
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeVoluntaryGift" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblVoluntaryGiftHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>