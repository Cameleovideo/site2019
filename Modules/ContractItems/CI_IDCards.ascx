<%@ control language="VB" autoeventwireup="false" inherits="Modules_ContractItems_CI_IDCards, App_Web_r5pyi2zf" %>

<asp:Panel id="pnlHeader" runat="server" CssClass="accordionHeader">
    <asp:Label ID="lblIDCardsHeader" runat="server" meta:resourcekey="lblIDCardsHeaderResource1"></asp:Label>
</asp:Panel>
<asp:Panel id="pnlContent" runat="server" CssClass="accordionContent" Height="0px" style="overflow: hidden;" >
    <table style="padding:10px">
        <tr>
            <td style="vertical-align:middle">
                <asp:Label ID="lblIDCards" runat="server" meta:resourcekey="lblIDCardsResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radIDCards" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radIDCards_SelectedIndexChanged" >
                    <asp:ListItem value="0"  meta:resourcekey="radNoResource1"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radYesResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvIDCards" runat="server" ControlToValidate="radIDCards" ValidationGroup="ContractItems" meta:resourcekey="rfvIDCardsResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>        
        <tr>
            <td style="vertical-align:middle">
                <asp:Label ID="lblBackground" runat="server" meta:resourcekey="lblBackgroundResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <table>
                    <tr>
                        <td>
                            <asp:formview id="FormView1" runat="server"	datasourceid="odsSelectedBackgroundId" datakeynames="PhotoID"
                                borderstyle="none" borderwidth="0" CellPadding="0" cellspacing="0" EnableViewState="false">
                                <itemtemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
                                        <tr>
                                            <td class="topx--"></td>
                                            <td class="top-x-"></td>
                                            <td class="top--x"></td>
                                        </tr>
                                        <tr>
                                            <td class="midx--"></td>						
                                            <td>
                                                <img src="../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198" style='width:<%# Eval("WidthThumb") %>px; height:<%# Eval("HeightThumb") %>px;' alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' />
                                            </td>
                                            <td class="mid--x"></td>
                                        </tr>
                                        <tr>
                                            <td class="botx--"></td>
                                            <td class="bot-x-"></td>
                                            <td class="bot--x"></td>
                                        </tr>
                                    </table>
                                </itemtemplate>
                            </asp:formview>
                        </td>
                        <td>
                            <asp:LinkButton ID="btnNewBackground" runat="server" meta:resourcekey="lblNewBackgroundResource1" onclick="btnNewBackground_Click"></asp:LinkButton>                
                            <br /><br />
                            <asp:DropDownList ID="lstBackdropCategories" runat="server" AutoPostBack="true" Visible="false">
                            </asp:DropDownList>
                            <br />
                            <asp:DataList ID="lstBackdrops" runat="Server"	cssclass="view"	repeatColumns="15" DataKeyField="PhotoID"
                                repeatdirection="Horizontal"   DataSourceID="odsBackdrops" Visible="false" OnSelectedIndexChanged="lstBackdrops_SelectedIndexChanged">                   
                                
                                <SelectedItemStyle BackColor="Yellow">
                                </SelectedItemStyle>                    
		                        <ItemTemplate>		            
                                    <asp:Label ID="Label2" Font-Size="6pt" runat="server" >
                                        <%#Eval("Caption").ToString()%> <br />
                                    </asp:Label>
			                        <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
				                        <tr>
					                        <td class="topx--"></td>
					                        <td class="top-x-"></td>
					                        <td class="top--x"></td>
				                        </tr>
				                        <tr>
					                        <td class="midx--"></td>
					                        <td>
					                            <asp:LinkButton ID="LinkButton2" commandname="select" runat="server">
						                            <img src="../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198" style='width:<%# Eval("WidthThumb") %>px; height:<%# Eval("HeightThumb") %>px;' alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' />
						                        </asp:LinkButton>
					                        </td>
					                        <td class="mid--x"></td>
				                        </tr>
				                        <tr>
					                        <td class="botx--"></td>
					                        <td class="bot-x-"></td>
					                        <td class="bot--x"></td>
				                        </tr>				            
			                        </table>
			                        <br />
		                        </ItemTemplate>		            
	                        </asp:DataList> 
                        </td>
                    </tr>
                </table>
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
                <asp:Label ID="lblInfo" runat="server" meta:resourcekey="lblInfoResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:CheckBoxList ID="chkInfo" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="chkInfo_SelectedIndexChanged">                
                    <asp:ListItem meta:resourcekey="chkNameResource1" Selected="True"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="chkGroupResource1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="chkUniqueIDResource1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="chkBarcodeResource1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="chkAddressResource1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="chkOtherResource1"></asp:ListItem>
                </asp:CheckBoxList>                
            </td>
        </tr>
        <tr >
            <td style="vertical-align:middle">
                <asp:Label ID="lblEveryone" runat="server" meta:resourcekey="lblEveryoneResource1"></asp:Label>
            </td>
            <td style="vertical-align:middle">
                <asp:RadioButtonList ID="radEveryone" runat="server" ValidationGroup="ContractItems" RepeatDirection="Horizontal" OnSelectedIndexChanged="radEveryone_SelectedIndexChanged" >                    
                    <asp:ListItem value="0"  meta:resourcekey="radListToReceiveResource1" Selected="true"></asp:ListItem>
                    <asp:ListItem value="1" meta:resourcekey="radEveryoneResource1"></asp:ListItem>
                </asp:RadioButtonList>                
                <asp:RequiredFieldValidator id="rfvEveryone" runat="server" ControlToValidate="radModel" ValidationGroup="ContractItems" meta:resourcekey="rfvEveryoneResource1"></asp:RequiredFieldValidator>
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

<ajaxToolkit:CollapsiblePanelExtender ID="cpeIDCards" runat="server" 
    TargetControlID="pnlContent" ExpandControlID="pnlHeader" CollapseControlID="pnlHeader" 
    TextLabelID="lblIDCardsHeader" Collapsed="true" SuppressPostBack="true">
</ajaxToolkit:CollapsiblePanelExtender>

<asp:ObjectDataSource ID="odsSelectedBackgroundId" Runat="server" TypeName="PhotoManager" 
	SelectMethod="GetPhoto">
	<SelectParameters>
	    <asp:Parameter Name="PhotoId" Type="Int32" DefaultValue="24906" />		
	</SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsBackdrops" Runat="server" TypeName="PhotoManager" 
	SelectMethod="GetPhotos">
	<SelectParameters>
		<asp:ControlParameter Name="AlbumID" Type="Int32" ControlID="lstBackdropCategories"  PropertyName="SelectedValue"/>
	</SelectParameters>
</asp:ObjectDataSource>