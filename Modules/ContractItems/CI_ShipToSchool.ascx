<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_ShipToSchool, App_Web_r5pyi2zf" %>



<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblShipToSchoolHeader" runat="server" meta:resourcekey="lblShipToSchoolHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblFamilyPictures" runat="server" meta:resourcekey="lblFamilyPicturesResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radShipToSchool" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radShiptoSchool_SelectedIndexChanged">                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>
                    <asp:ListItem value="2" meta:resourcekey="radShipToSchoolOnlyResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvShipToSchool" runat="server" ControlToValidate="radShipToSchool" ValidationGroup="ContractItems" meta:resourcekey="rfvShipToSchoolResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>        
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeShipToSchool" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblShipToSchoolHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>