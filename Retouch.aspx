<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="Retouch, App_Web_-wqcg8fv" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>

<asp:Content ID="Content1" ContentPlaceHolderID="infoZone" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <hr />
    <h4>
        <asp:Label ID="lblRequestRetouch" runat="server" meta:resourcekey="lblRequestRetouchResource1"></asp:Label>
    </h4>
    
    <ajaxToolkit:Accordion ID="MyAccordion" runat="server" SelectedIndex="-1"
        HeaderCssClass="accordionHeader" ContentCssClass="accordionContent"
        FadeTransitions="true" FramesPerSecond="40" TransitionDuration="200"
        AutoSize="None" RequireOpenedPane="false" SuppressHeaderPostbacks="true">
        <Panes>
            <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                <Header>
                    <a href="" class="accordionLink">
                        <asp:Label ID="lblDescriptionHeader" runat="server" meta:resourcekey="lblRequestRetouchResource1"></asp:Label>                        
                    </a>
                </Header>
                <Content>                    
                    <asp:Label ID="lblDescription" runat="server" meta:resourcekey="lblDescriptionResource1"></asp:Label>
                </Content>
            </ajaxToolkit:AccordionPane>
            <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                <Header>
                    <a href="" class="accordionLink">
                        <asp:Label ID="lblFeeHeader" runat="server" meta:resourcekey="lblFeeHeaderResource1"></asp:Label>                        
                    </a>
                </Header>
                <Content>
                    <asp:Label ID="lblFee" runat="server" meta:resourcekey="lblFeeResource1"></asp:Label>
                </Content>
            </ajaxToolkit:AccordionPane>        
        </Panes>
    </ajaxToolkit:Accordion><br />
    
    
    <table>
        <tr>
            <td>
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" Columns="20" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="txtNameValidator1" 
                    runat="server" ErrorMessage="*" ControlToValidate="txtName">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPhone" runat="server" meta:resourcekey="lblPhoneResource1"></asp:Label>    
            </td>
            <td>
                <asp:TextBox ID="txtPhone"  Columns="20" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="txtPhoneValidator1" 
                    runat="server" ErrorMessage="*" ControlToValidate="txtPhone">
                </asp:RequiredFieldValidator>
            </td>
        </tr>        
    </table>
    <br />
    <asp:Label ID="lblNote" runat="server" meta:resourcekey="lblNoteResource1"></asp:Label><br />
    <asp:TextBox ID="txtNote" TextMode="MultiLine" Rows="10" Columns="23" runat="server"></asp:TextBox>
    <asp:LinkButton ID="btnRequestRetouch" runat="server" meta:resourcekey="btnRequestRetouchResource1" OnClick="btnRequestRetouch_Click"></asp:LinkButton><br /><br />
    
    <asp:Label ID="lblResult" runat="server" ForeColor="red" Visible="false"></asp:Label><br />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main2" Runat="Server">
    
    <asp:formview id="FormView1" runat="server"	datasourceid="ObjectDataSource1" DataKeyNames="PhotoID"
		borderstyle="none" borderwidth="0" CellPadding="0" cellspacing="0" AllowPaging="true">
		<itemtemplate>
		
			<div class="buttonbar buttonbar-top">
				<asp:ImageButton ID="ImageButton9" Runat="server" CommandName="Page" CommandArgument="First" skinid="first" meta:resourcekey="BtnFirstResource1"/>
				<asp:ImageButton ID="ImageButton10"	Runat="server" CommandName="Page" CommandArgument="Prev" skinid="prev" meta:resourcekey="BtnPrevResource1"/>
				<asp:ImageButton ID="ImageButton11"	Runat="server" CommandName="Page" CommandArgument="Next" skinid="next" meta:resourcekey="BtnNextResource1"/>
				<asp:ImageButton ID="ImageButton12"	Runat="server" CommandName="Page" CommandArgument="Last" skinid="last" meta:resourcekey="BtnLastResource1"/>
			</div>
			
			<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
				<tr>
					<td class="topx--"></td>
					<td class="top-x-"></td>
					<td class="top--x"></td>
				</tr>
				<tr>
					<td class="midx--"></td>						
					<td><img src="images/pixClear.gif"  class="photo_198" style='background-image: url(Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=L);width:<%# Eval("WidthFull")%>px; height:<%# Eval("HeightFull")%>px;' alt='Photo Number <%# Eval("PhotoID") %>' /></td>
					<td class="mid--x"></td>
				</tr>
				<tr>
					<td class="botx--"></td>
					<td class="bot-x-"></td>
					<td class="bot--x"></td>
				</tr>
			</table>            
			
			<div class="buttonbar">					
				<asp:ImageButton ID="ImageButton1" Runat="server" CommandName="Page" CommandArgument="First" skinid="first" meta:resourcekey="BtnFirstResource1"/>
				<asp:ImageButton ID="ImageButton2" Runat="server" CommandName="Page" CommandArgument="Prev" skinid="prev" meta:resourcekey="BtnPrevResource1"/>
				<asp:ImageButton ID="ImageButton3" Runat="server" CommandName="Page" CommandArgument="Next" skinid="next" meta:resourcekey="BtnNextResource1"/>
				<asp:ImageButton ID="ImageButton4" Runat="server" CommandName="Page" CommandArgument="Last" skinid="last" meta:resourcekey="BtnLastResource1"/>
			</div>

		</itemtemplate>
	</asp:formview>	
	
	<asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos" >
		<SelectParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" DefaultValue="0"/>
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>

