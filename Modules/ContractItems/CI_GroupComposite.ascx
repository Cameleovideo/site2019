<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_GroupComposite, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblGroupCompositeHeader" runat="server" meta:resourcekey="lblGroupCompositeHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblGroupComposite" runat="server" meta:resourcekey="lblGroupCompositeResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radGroupComposite" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radGroupComposite_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvGroupComposite" runat="server" ControlToValidate="radGroupComposite" ValidationGroup="ContractItems" meta:resourcekey="rfvGroupCompositeResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblTargetDate" runat="server" meta:resourcekey="lblTargetDateResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:Calendar ID="calTargetDate" runat="server" BackColor="White" BorderColor="Black" SelectionMode="day" 
                    BorderStyle="Solid" CellSpacing="1" FirstDayOfWeek="Sunday" Font-Bold="True"
                    Font-Names="Verdana" Font-Size="7pt" ForeColor="Black" NextPrevFormat="ShortMonth"
                    OnSelectionChanged="calTargetDate_SelectionChanged"
                    Style="color: green" Width="371px">
                    <TitleStyle BackColor="#8CC63F" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True"
                        Font-Size="9pt" ForeColor="White" Height="9pt" BorderColor="#27972D" />
                    <NextPrevStyle Font-Bold="False" Font-Size="Medium" Font-Underline="False" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <DayHeaderStyle BorderColor="Transparent" Font-Bold="True" Font-Size="8pt" ForeColor="#333333"
                        Height="8pt" Wrap="True" />
                    <DayStyle BackColor="#CCCCCC" VerticalAlign="Middle" />
                    <SelectedDayStyle BackColor="#8CC63F" VerticalAlign="Middle" />
                </asp:Calendar>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblModel" runat="server" meta:resourcekey="lblModelResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radModel" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radModel_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radStdModelResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radOtherModelResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvModel" runat="server" ControlToValidate="radModel" ValidationGroup="ContractItems" meta:resourcekey="rfvModelResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblMultiple" runat="server" meta:resourcekey="lblMultipleResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radMultiple" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radMultiple_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radOneResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radMultipleResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvMultiple" runat="server" ControlToValidate="radMultiple" ValidationGroup="ContractItems" meta:resourcekey="rfvMultipleResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblLogo" runat="server" meta:resourcekey="lblLogoResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radLogo" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radLogo_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvLogo" runat="server" ControlToValidate="radLogo" ValidationGroup="ContractItems" meta:resourcekey="rfvLogoResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td style="vertical-align:top">
                <asp:Label ID="lblFormat" runat="server" meta:resourcekey="lblFormatResource1"></asp:Label>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="txtFormat" runat="server" Columns="45" OnTextChanged="txtFormat_TextChanged" ValidationGroup="ContractItems"></asp:TextBox>                                
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

<ajaxToolkit:CollapsiblePanelExtender ID="cpeGroupComposite" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblGroupCompositeHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>