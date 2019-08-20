<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_GreenScreen, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblGreenScreenHeader" runat="server" meta:resourcekey="lblGreenScreenHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblGreenScreen" runat="server" meta:resourcekey="lblGreenScreenResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radGreenScreen" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radGreenScreen_SelectedIndexChanged">                    
                    <asp:ListItem value="0"  meta:resourcekey="radTradResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radGreenResource1"></asp:ListItem>
                    <asp:ListItem value="2" meta:resourcekey="radBlueResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvGreenScreen" runat="server" ControlToValidate="radGreenScreen" ValidationGroup="ContractItems" meta:resourcekey="rfvGreenScreenResource1"></asp:RequiredFieldValidator>
            </td>            
        </tr>        
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblUniform" runat="server" meta:resourcekey="lblUniformResource1"></asp:Label>
            </td>            
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radUniform" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radUniform_SelectedIndexChanged">                    
                    <asp:ListItem value="0"  meta:resourcekey="radCivilResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radGreenUniformResource1"></asp:ListItem>
                    <asp:ListItem value="2" meta:resourcekey="radBlueUniformResource1"></asp:ListItem>
                    <asp:ListItem value="3" meta:resourcekey="radBlueGreenUniformResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvUniform" runat="server" ControlToValidate="radUniform" ValidationGroup="ContractItems" meta:resourcekey="rfvUniformResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>    
    </table>
</asp:Panel>

<ajaxToolkit:CollapsiblePanelExtender ID="cpeGreenScreen" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblGreenScreenHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>