<%@ page language="VB" masterpagefile="~/general.master" inherits="Admin_Details_aspx, App_Web_soaif_n3" enableEventValidation="false" stylesheettheme="White" %>

<asp:content id="Content1" contentplaceholderid="Main2" runat="server">

	<div class="page" >
		<asp:formview id="FormView1" runat="server" datasourceid="ObjectDataSource1" cssclass="view" datakeynames="PhotoID"
			borderstyle="none" borderwidth="0" CellPadding="0" cellspacing="0" EnableViewState="false">
			<itemtemplate>
				<p><%# Server.HtmlEncode(Eval("Caption").ToString()) %></p>
				<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
					<tr>
						<td class="topx--"></td>
						<td class="top-x-"></td>
						<td class="top--x"></td>
					</tr>
					<tr>
						<td class="midx--"></td>
						<td>						
						<img src="../../images/pixClear.gif"  class="photo_198" style='background-image: url(../../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=L);width:<%# Eval("WidthFull") %>px; height:<%# Eval("HeightFull") %>px;' alt='Photo Number <%# Eval("PhotoID") %>' />
						</td>
						<td class="mid--x"></td>
					</tr>
					<tr>
						<td class="botx--"></td>
						<td class="bot-x-"></td>
						<td class="bot--x"></td>
					</tr>
				</table>
				<asp:linkbutton id="Edit" text="Edit" commandname="Edit" runat="server" Visible=" <%# HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_ADMINISTRATORS) Or HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_EVENTS) %>"/> 

			</itemtemplate>
			
			
			<EditItemTemplate>
				<div style="width:100%;text-align:right;">
				    <asp:FileUpload ID="PhotoFile" Runat="server" Width="416" FileBytes='<%# Bind("BytesOriginal") %>' CssClass="textfield" />
				    
					<asp:ImageButton ID="ImageButton4" Runat="server" CommandName="Update" SkinID="save" />
					<asp:ImageButton ID="ImageButton5" Runat="server" CommandName="Cancel"  SkinID="cancel" />
				</div>
			</EditItemTemplate>
			
		</asp:formview>
	</div>

	<asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos"
		UpdateMethod="EditPhotoBytes">
		<SelectParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" DefaultValue="0"/>
		</SelectParameters>
		<UpdateParameters>		    
		    <asp:Parameter Name="Watermark" DefaultValue="true"/>		    		    		   
		    <asp:Parameter Name="ConnectionString" />		    		   
		    <asp:Parameter Name="PhotoID" />		    		   
		</UpdateParameters>
	</asp:ObjectDataSource>

</asp:content>