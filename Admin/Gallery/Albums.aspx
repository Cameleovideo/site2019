<%@ page language="VB" masterpagefile="~/general.master" title="Your Name Here | Admin" inherits="Admin_Albums_aspx, App_Web_soaif_n3" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" enableEventValidation="false" stylesheettheme="White" %>

<asp:content id="Content1" contentplaceholderid="Main2" runat="server">

	<div class="page" >

		<div id="sidebar">
            <asp:Panel ID="panelAddAlbum"  runat="server" Height="50px" Width="125px" >            
			    <h3><asp:Label ID="lblAddNewAlbum" runat="server" Text="Add New Album" meta:resourcekey="lblAddNewAlbumResource1" /></h3>
			    <p><asp:Label ID="lblBeforeUploading" runat="server" Text="Before uploading your pictures, create an album to organize your pictures." meta:resourcekey="lblBeforeUploadingResource1" /></p>
			    <asp:FormView ID="FormView1" Runat="server"
				    DataSourceID="ObjectDataSource1" DefaultMode="Insert"
				    BorderWidth="0px" CellPadding="0" meta:resourcekey="FormView1Resource1">
				    <InsertItemTemplate>
					    <asp:RequiredFieldValidator	ID="RequiredFieldValidator1" Runat="server" ErrorMessage="You must choose a	title." ControlToValidate="TextBox1" Display="Dynamic" Enabled="False" meta:resourcekey="RequiredFieldValidator1Resource1" />
					    <p>
						    <asp:Label ID="lblAlbumTitleBox" runat="server" Text="Title" meta:resourcekey="lblAlbumTitleBoxResource1" /><br />
						    <asp:TextBox ID="TextBox1" MaxLength="50" Runat="server" Width="200px" Text='<%# Bind("Caption") %>' CssClass="textfield" meta:resourcekey="TextBox1Resource1" />
						   
						    <asp:Panel ID="panelAddAlbumCheckboxes" runat="server" Visible='<%# HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_ADMINISTRATORS) Or HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_EVENTS) %>' meta:resourcekey="panelAddAlbumCheckboxesResource1">
						        <asp:CheckBox ID="CheckBox2" Runat="server" checked='<%# Bind("IsPublic") %>' text="Make this album public" meta:resourcekey="CheckBox2Resource1" /> <br />   
						        <asp:CheckBox ID="CheckBox4" Runat="server" checked='<%# Bind("IsBackdrop") %>' text="Backdrop album" meta:resourcekey="CheckBox4Resource1" />   <br />                         
						        <asp:CheckBox ID="CheckBox1" Runat="server" checked='<%# Bind("IsFrame") %>' text="Frame album" meta:resourcekey="CheckBox1Resource1" /><br />
						        <asp:CheckBox ID="CheckBox3" Runat="server" checked='<%# Bind("IsStaff") %>' text="Staff user" meta:resourcekey="CheckBox3Resource1" /> <br />
						        <asp:CheckBox ID="CheckBoxPersonalAlbum" Runat="server" Text="Personal Album" meta:resourcekey="CheckBoxPersonalAlbumResource1" />
						    </asp:Panel>
					    </p>
					    <p style="text-align:right;">
						    <asp:ImageButton ID="ImageButton1" Runat="server" CommandName="Insert" meta:resourcekey="ImageButton1Resource1"/>
					    </p>
				    </InsertItemTemplate>
			    </asp:FormView>
			</asp:Panel>
		</div>

		<div id="content">
			<h3><asp:Literal ID="YourAlbumsHeader" meta:resourcekey="YourAlbumsHeaderResource1" runat="server" Text="Vos albums"></asp:Literal></h3>
			
			<p>
                <asp:Literal ID="Message1" meta:resourcekey="Message1Resource1" runat="server" Text="Voici la liste de vos albums. Cliquez sur <b>Éditer</b> pour voir le détail d'un l'album."></asp:Literal>			    			    
			</p>		
			
			
			<asp:gridview id="GridView1" runat="server" 
				datasourceid="ObjectDataSource1" datakeynames="AlbumID" cellpadding="6"
				autogeneratecolumns="False" BorderStyle="None" BorderWidth="0px" width="420px" showheader="False" meta:resourcekey="GridView1Resource1">
				<EmptyDataTemplate>
                    <asp:Literal ID="NoAlbums" meta:resourcekey="NoAlbumsResource1" runat="server" Text="Aucun album."></asp:Literal>				    
				</EmptyDataTemplate>
				<EmptyDataRowStyle CssClass="emptydata"></EmptyDataRowStyle>
				<columns>
					<asp:TemplateField meta:resourcekey="TemplateFieldResource1">
						<ItemStyle Width="116px" />
						<ItemTemplate>
							<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
								<tr>
									<td class="topx--"></td>
									<td class="top-x-"></td>
									<td class="top--x"></td>
								</tr>
								<tr>
									<td class="midx--"></td>
									<td><a href='Photos.aspx?AlbumID=<%# Eval("AlbumID") %>'>										
										<img src="../../Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=S"  class="photo_198" style='width:<%# Eval("WidthThumbFirstPhoto") %>px; height:<%# Eval("HeightThumbFirstPhoto") %>px;' alt="Sample Photo from Album Number <%# Eval("AlbumID") %>" />										
										</a></td>
									<td class="mid--x"></td>
								</tr>
								<tr>
									<td class="botx--"></td>
									<td class="bot-x-"></td>
									<td class="bot--x"></td>
								</tr>
							</table>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField meta:resourcekey="TemplateFieldResource2" >
						<ItemStyle Width="280px" />
						<ItemTemplate>
							<div style="padding:8px 0;">
								<b><%# Server.HtmlEncode(Eval("Caption").ToString()) %></b><br />
								<%# Eval("Count") %> <asp:Label ID="lblCountPhotos" runat="server" Text=" Photo(s)" meta:resourcekey="lblCountPhotosResource1" /><asp:Label ID="lblIsPublic" Runat="server" Text="Public" Visible='<%# Eval("IsPublic") %>' meta:resourcekey="lblIsPublicResource1"></asp:Label>
							</div>
							<div style="width:100%;text-align:right;">
								<asp:ImageButton ID="ImageButton2" runat="server" CommandName="Edit" visible='<%# HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_ADMINISTRATORS) %>' meta:resourcekey="ImageButton2Resource1"/>
								<a href='Photos.aspx?AlbumID=<%# Eval("AlbumID") %>'><asp:image ID="Image1" runat="server"  skinid="edit" meta:resourcekey="Image1Resource1" /></a>
								    <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Delete" visible='<%# HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_ADMINISTRATORS) Or HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_USERS) And CBool(Eval("IsPersonalAlbum")) %>' meta:resourcekey="ImageButton3Resource1"/>
                                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Etes-vous sur ?!?" TargetControlID="ImageButton3" Enabled="True" meta:resourcekey="ConfirmButonExtender1" />
							</div>
						</ItemTemplate>
						<EditItemTemplate>
							<div style="padding:8px 0;">
							    <table>
							        <tr>
							            <td>MasterALbum:</td>
							            <td>
							                <asp:TextBox ID="MasterAlbumId" Runat="server" Width="160px" Text='<%# Bind("MasterAlbumId") %>' CssClass="textfield" meta:resourcekey="MasterAlbumIdResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Caption:</td>
							            <td>
							                <asp:TextBox ID="Caption" Runat="server" Width="160px" Text='<%# Bind("Caption") %>' CssClass="textfield" meta:resourcekey="CaptionResource1" />							                							                
							            </td>
							        </tr>
							        <tr>
							            <td>Public:</td>
							            <td>							                
							                <asp:CheckBox ID="IsPublic" Runat="server" checked='<%# Bind("IsPublic") %>' text="Public" meta:resourcekey="IsPublicResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Background album:</td>
							            <td>							                
							                <asp:CheckBox ID="IsBackDrop" Runat="server" checked='<%# Bind("IsBackdrop") %>' text="IsBackdrop" meta:resourcekey="IsBackDropResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Frame album:</td>
							            <td>							                
							                <asp:CheckBox ID="IsFrame" Runat="server" checked='<%# Bind("IsFrame") %>' text="IsFrame" meta:resourcekey="IsFrameResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Staff user:</td>
							            <td>							                
							                <asp:CheckBox ID="IsStaff" Runat="server" checked='<%# Bind("IsStaff") %>' text="IsStaff" meta:resourcekey="IsStaffResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Personal album:</td>
							            <td>
							                <asp:CheckBox ID="IsPersonalAlbum" runat="server" Checked='<%# Bind("IsPersonalAlbum") %>' Text="IsPersonalAlbum" meta:resourcekey="IsPersonalAlbumResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>EventUserName: </td>
							            <td>
							                <asp:TextBox ID="EventUserName" Runat="server" Width="160px" Text='<%# Bind("EventUserName") %>' CssClass="textfield" meta:resourcekey="EventUserNameResource1" />  
							            </td>
							        </tr>
							        <tr>
							            <td>PhotographUserName: </td>
							            <td>
							                <asp:TextBox ID="PhotographUserName" Runat="server" Width="160px" Text='<%# Bind("PhotographUserName") %>' CssClass="textfield" meta:resourcekey="PhotographUserNameResource1" />  
							            </td>
							        </tr>
							        <tr>
							            <td>First name: </td>
							            <td>
							                <asp:TextBox ID="SubjectFirstName" Runat="server" Width="160px" Text='<%# Bind("SubjectFirstName") %>' CssClass="textfield" meta:resourcekey="SubjectFirstNameResource1" />  
							            </td>
							        </tr>
							        <tr>
							            <td>Last name:</td>
							            <td>
							                <asp:TextBox ID="SubjectLastName" Runat="server" Width="160px" Text='<%# Bind("SubjectLastName") %>' CssClass="textfield" meta:resourcekey="SubjectLastNameResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>UniqueID: </td>
							            <td>
							                <asp:TextBox ID="SubjectUniqueId" Runat="server" Width="160px" Text='<%# Bind("SubjectUniqueId") %>' CssClass="textfield" meta:resourcekey="SubjectUniqueIdResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Email:</td>
							            <td>
							                <asp:TextBox ID="SubjectEmail" Runat="server" Width="160px" Text='<%# Bind("SubjectEmail") %>' CssClass="textfield" meta:resourcekey="SubjectEmailResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Group:</td>
							            <td>
							                <asp:TextBox ID="SubjectGroup" Runat="server" Width="160px" Text='<%# Bind("SubjectGroup") %>' CssClass="textfield" meta:resourcekey="SubjectGroupResource1" />
							            </td>
							        </tr>
							        <tr>
							            <td>Superior name:</td>
							            <td>
							                <asp:TextBox ID="SubjectSuperiorName" Runat="server" Width="160px" Text='<%# Bind("SubjectSuperiorName") %>' CssClass="textfield" meta:resourcekey="SubjectSuperiorNameResource1" />
							            </td>
							        </tr>
							    </table>								 
							</div>
							<div style="width:100%;text-align:right;">
								<asp:ImageButton ID="ImageButton4" Runat="server" CommandName="Update" SkinID="save" meta:resourcekey="ImageButton4Resource1" />
								<asp:ImageButton ID="ImageButton5" Runat="server" CommandName="Cancel" SkinID="cancel" meta:resourcekey="ImageButton5Resource1" />
							</div>
						</EditItemTemplate>
					</asp:TemplateField>
				</columns>
			</asp:gridview>
		</div>

	</div>
	
	<asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetAllAlbums"
		InsertMethod="AddAlbum" 
		DeleteMethod="RemoveAlbum" 
		UpdateMethod="EditAlbum" >
		
		<InsertParameters>
		    <asp:Parameter Name="MasterAlbumID" />
		    <asp:Parameter Name="UserName" />
		    <asp:Parameter Name="EventUserName" />
		    <asp:Parameter Name="PhotographUserName" />
		    <asp:Parameter Name="ConnectionString" />
		    <asp:Parameter Name="SubjectFirstName" DefaultValue=" "/>
		    <asp:Parameter Name="SubjectLastName" DefaultValue=" "/>
		    <asp:Parameter Name="SubjectUniqueId" DefaultValue=" "/>
		    <asp:Parameter Name="SubjectEmail" DefaultValue=" "/>
		    <asp:Parameter Name="SubjectGroup" DefaultValue=" "/>
		    <asp:Parameter Name="SubjectSuperiorName" DefaultValue=" " />
		    <asp:Parameter Name="IsPersonalAlbum" />
		</InsertParameters>
		
		<DeleteParameters>
		    <asp:Parameter Name="ConnectionString" />
		</DeleteParameters>
		
		<UpdateParameters>
		    <asp:Parameter Name="ConnectionString" />		    
		    <asp:Parameter Name="MasterAlbumID" />
		    <asp:Parameter Name="EventUserName" DefaultValue=" "/>	
		    <asp:Parameter Name="PhotographUserName" DefaultValue=" "/>
		    <asp:Parameter Name="SubjectFirstName" DefaultValue=" "/>	
		    <asp:Parameter Name="SubjectLastName" DefaultValue=" "/>	
		    <asp:Parameter Name="SubjectUniqueId" DefaultValue=" "/>	
		    <asp:Parameter Name="SubjectEmail" DefaultValue=" "/>	
		    <asp:Parameter Name="SubjectGroup" DefaultValue=" "/>	
		    <asp:Parameter Name="SubjectSuperiorName" DefaultValue=" "/>
		</UpdateParameters>
	</asp:ObjectDataSource>

</asp:content>
