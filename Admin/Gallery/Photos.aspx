<%@ page language="VB" masterpagefile="~/general.master" inherits="Admin_Photos_aspx, App_Web_soaif_n3" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" enableEventValidation="false" stylesheettheme="White" %>

<asp:content id="Content1" contentplaceholderid="Main2" runat="server">

	<div class="page" >
		<div id="sidebar">
		    <asp:Panel ID="panelBulkInsert"  runat="server" meta:resourcekey="panelBulkInsertResource1" >
			    <h4>Bulk Upload	Photos</h4>
			    <p>The following files were	found in your <b>Upload</b>	folder.	 Click on <b>Import</b>	to import these	pictures to	your photo album. This operation may take a	few	moments.</p>
                <asp:CheckBox ID="chkWatermarked" runat="server" Checked="True" Text="Watermark" meta:resourcekey="chkWatermarkedResource1" /><br />
			    <asp:ImageButton ID="ImageButton1" Runat="server" onclick="Button1_Click" meta:resourcekey="ImageButton1Resource1" />
			    <br />
			    <br />
			    <asp:datalist runat="server" id="UploadList" repeatcolumns="1" repeatlayout="table" repeatdirection="Horizontal" DataSourceID="ObjectDataSource2" meta:resourcekey="UploadListResource1">
				    <itemtemplate>
                        <%# Container.DataItem %>
				    </itemtemplate>
			    </asp:datalist>
			</asp:Panel>
		</div>

		<div id="content">
		
		    <asp:Panel ID="panelAddPhotos"  runat="server" meta:resourcekey="panelAddPhotosResource1" >
			    <h4><asp:Label ID="lblAddPhotos" runat="server" Text="Add Photos" meta:resourcekey="lblAddPhotosResource1" /></h4>
			    <p><asp:Label ID="lblAddPhotosInstruction" runat="server" Text="To add single photos over HTTP, select a file and caption, then click &lt;b&gt;Add&lt;/b&gt;." meta:resourcekey="lblAddPhotosInstructionResource1" /></p>
			    
			    <p><asp:Label ID="lblStandardUpload" runat="server" Text="Standard" meta:resourcekey="lblStandardUploadResource1" /></p>
			    <asp:FormView ID="FormView1" Runat="server" 
				    DataSourceID="ObjectDataSource1" DefaultMode="Insert"
				    BorderWidth="0px" CellPadding="0" OnItemInserting="FormView1_ItemInserting" meta:resourcekey="FormView1Resource1">
				    <InsertItemTemplate>
					    <asp:RequiredFieldValidator	ID="RequiredFieldValidator1" Runat="server" ErrorMessage="You must choose a	caption." ControlToValidate="PhotoCaption" Display="Dynamic" Enabled="False" meta:resourcekey="RequiredFieldValidator1Resource1" />
					    <p>                            
						    Photo<br />
						    <asp:FileUpload ID="PhotoFile" Runat="server" Width="416px" FileBytes='<%# Bind("BytesOriginal") %>' CssClass="textfield" meta:resourcekey="PhotoFileResource1" /><br />
						    Caption<br />
						    <asp:TextBox ID="PhotoCaption" Runat="server" Width="326px" Text='<%# Bind("Caption") %>' CssClass="textfield" meta:resourcekey="PhotoCaptionResource1" />
					    </p>
					    <p style="text-align:right;">
						    <asp:ImageButton ID="AddNewPhotoButton" Runat="server" CommandName="Insert" meta:resourcekey="AddNewPhotoButtonResource1"/>
					    </p>
				    </InsertItemTemplate>
			    </asp:FormView>
			    <hr />
			    
			    <p>Frame</p>
			    <asp:FormView ID="FormView2" Runat="server" 
				    DataSourceID="ObjectDataSource4" DefaultMode="Insert"
				    BorderWidth="0px" CellPadding="0" OnItemInserting="FormView2_ItemInserting" meta:resourcekey="FormView2Resource1">
				    <InsertItemTemplate>
					    <asp:RequiredFieldValidator	ID="RequiredFieldValidator1" Runat="server" ErrorMessage="You must choose a	caption." ControlToValidate="PhotoCaption" Display="Dynamic" Enabled="False" meta:resourcekey="RequiredFieldValidator1Resource2" />
					    <p>
						    Photo<br />
						    <asp:FileUpload ID="PhotoFile" Runat="server" Width="416px" FileBytes='<%# Bind("BytesOriginal") %>' CssClass="textfield" meta:resourcekey="PhotoFileResource2" /><br />
						    Caption<br />
						    <asp:TextBox ID="PhotoCaption" Runat="server" Width="326px" Text='<%# Bind("Caption") %>' CssClass="textfield" meta:resourcekey="PhotoCaptionResource2" />
					    </p>
					    <p style="text-align:right;">
						    <asp:ImageButton ID="AddNewPhotoButton" Runat="server" CommandName="Insert" meta:resourcekey="AddNewPhotoButtonResource2"/>
					    </p>
				    </InsertItemTemplate>
			    </asp:FormView>
			    <hr />
    			
    			<p>GreenScreen</p>
			    <asp:FormView ID="FormView3" Runat="server" 
				    DataSourceID="ObjectDataSource3" DefaultMode="Insert"
				    BorderWidth="0px" CellPadding="0" OnItemInserting="FormView3_ItemInserting" meta:resourcekey="FormView3Resource1">
				    <InsertItemTemplate>
					    <asp:RequiredFieldValidator	ID="RequiredFieldValidator1" Runat="server" ErrorMessage="You must choose a	caption." ControlToValidate="PhotoCaption" Display="Dynamic" Enabled="False" meta:resourcekey="RequiredFieldValidator1Resource3" />
					    <p>
						    Photo<br />
						    <asp:FileUpload ID="PhotoFile" Runat="server" Width="416px" FileBytes='<%# Bind("BytesOriginal") %>' CssClass="textfield" meta:resourcekey="PhotoFileResource3" /><br />
						    Photo without background<br />
						    <asp:FileUpload ID="PhotoWithoutBackgroundFile" Runat="server" Width="416px" FileBytes='<%# Bind("BytesGreenScreen") %>' CssClass="textfield" meta:resourcekey="PhotoWithoutBackgroundFileResource1" /><br />
						    Caption<br />
						    <asp:TextBox ID="PhotoCaption" Runat="server" Width="326px" Text='<%# Bind("Caption") %>' CssClass="textfield" meta:resourcekey="PhotoCaptionResource3" />
					    </p>
					    <p style="text-align:right;">
						    <asp:ImageButton ID="AddNewPhotoButton" Runat="server" CommandName="Insert" meta:resourcekey="AddNewPhotoButtonResource3"/>
					    </p>
				    </InsertItemTemplate>
			    </asp:FormView>
			    <hr />
			</asp:Panel>
			
			<h3><asp:Literal ID="YourPhotosHeader" meta:resourcekey="YourPhotosHeaderResource1" runat="server"></asp:Literal></h3>			
			
		    
		    <asp:UpdatePanel ID="upPnlMessages" runat="server" UpdateMode="Conditional" Visible='<%# AlbumIsPersonal() %>'>
		        <ContentTemplate>
		            <asp:Label ID="lblDiskSpace" runat="server" meta:resourcekey="lblDiskSpaceResource1" />
		        </ContentTemplate>
		    </asp:UpdatePanel>
		    
		    <br />
			
			<asp:Panel runat="server" ID="panelAddAjaxPhotos" meta:resourcekey="panelAddAjaxPhotosResource1">
			    <CuteWebUI:Uploader runat="server" ID="Uploader1" MultipleFilesUpload="True" InsertText="Upload File (Max 5mo)">
                    <ValidateOption AllowedFileExtensions="jpeg,jpg" MaxSizeKB="5120" />
                </CuteWebUI:Uploader>
			</asp:Panel>
			
			<p>
                <asp:Literal ID="Message1" meta:resourcekey="Message1Resource1" runat="server"></asp:Literal>
			</p>
			
			<asp:gridview id="GridView1" runat="server" datasourceid="ObjectDataSource1" 
				datakeynames="PhotoID" cellpadding="6" EnableViewState="False"
				autogeneratecolumns="False" BorderStyle="None" BorderWidth="0px" width="420px" meta:resourcekey="GridView1Resource1"  >
				<EmptyDataRowStyle CssClass="emptydata"></EmptyDataRowStyle>
				<EmptyDataTemplate>
					<asp:Literal ID="NoPhotos" meta:resourcekey="NoPhotosResource1" runat="server"></asp:Literal>				    
				</EmptyDataTemplate>
				
				<rowstyle verticalalign="Top"/>


				<columns>
					<asp:TemplateField meta:resourcekey="TemplateFieldResource1">
						<ItemStyle Width="50px" />
						<ItemTemplate>
							<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
								<tr>
									<td class="topx--"></td>
									<td class="top-x-"></td>
									<td class="top--x"></td>
								</tr>
								<tr>
									<td class="midx--"></td>
									<td id="tdNonPersonal" runat="server" visible='<%# IsAdminOrEvent() %>'><a href='Details.aspx?AlbumID=<%# Eval("AlbumID") %>&Page=<%# CType(Container, GridViewRow).RowIndex %>'>										
										<img src="../../Handler.ashx?Size=S&PhotoID=<%# Eval("PhotoID") %>"  
										        class="photo_198" 
										        style="width:<%# Eval("WidthThumb") %>px; height:<%# Eval("HeightThumb") %>px;<%# IsLessThanTwoWeeks(Eval("PictureAddedDate"), Eval("InPersonalAlbum")) %>" 
										        alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' />
										</a>
									</td>
									<td id="tdPersonal" runat="server" visible='<%# IsNotAdminOrEvent() %>'><a href='../../Details.aspx?AlbumID=<%# Eval("AlbumID") %>&Page=<%# CType(Container, GridViewRow).RowIndex %>'>										
										<img src="../../Handler.ashx?Size=S&PhotoID=<%# Eval("PhotoID") %>"  
										        class="photo_198" 
										        style="width:<%# Eval("WidthThumb") %>px; height:<%# Eval("HeightThumb") %>px;<%# IsLessThanTwoWeeks(Eval("PictureAddedDate"), Eval("InPersonalAlbum")) %>" 
										        alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' />
										</a>
									</td>
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
					<asp:boundfield headertext="Caption" datafield="Caption" meta:resourcekey="BoundFieldResource1" />
					<asp:checkboxfield headertext="DigitalRights" datafield="DigitalRights" meta:resourcekey="CheckBoxFieldResource1" />
					<asp:checkboxfield headertext="IsPersonal" datafield="IsPersonal" meta:resourcekey="CheckBoxFieldResource2" />
                    
					<asp:TemplateField meta:resourcekey="TemplateFieldResource2">
						<ItemStyle Width="150px" />
						<ItemTemplate>
							<div style="width:100%;text-align:right;">
								<asp:ImageButton ID="ImageButton2" Runat="server" CommandName="Edit" visible='<%# HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_ADMINISTRATORS) or HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_EVENTS) %>' meta:resourcekey="ImageButton2Resource1" />
								<asp:ImageButton ID="ImageButton3" Runat="server" CommandName="Delete"  visible='<%# Eval("IsPersonal") Or HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_ADMINISTRATORS) or HttpContext.Current.User.IsInRole(Cameleo.CameleoMembership.ROLE_EVENTS) %>' meta:resourcekey="ImageButton3Resource1"/>
							</div>
							<ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="ImageButton3" ConfirmText="Etes-vous sur ?" Enabled="True" meta:resourcekey="ConfirmButonExtender1" />
						</ItemTemplate>
						<EditItemTemplate>
							<div style="width:100%;text-align:right;">
								<asp:ImageButton ID="ImageButton4" Runat="server" CommandName="Update" meta:resourcekey="ImageButton4Resource1" />
								<asp:ImageButton ID="ImageButton5" Runat="server" CommandName="Cancel" meta:resourcekey="ImageButton5Resource1" />
							</div>
						</EditItemTemplate>
					</asp:TemplateField>
				</columns>
			</asp:gridview>
		</div>

	 </div>
	
	<asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos"
		InsertMethod="AddPhoto" 
		DeleteMethod="RemovePhoto" 
		UpdateMethod="EditPhoto" >
		<SelectParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" />
		</SelectParameters>
		<InsertParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" />
			<asp:Parameter Name="ConnectionString" />
			<asp:Parameter Name="DigitalRights" Defaultvalue="False"/>
			<asp:Parameter Name="IsPersonal" Defaultvalue="False"/>
			<asp:Parameter Name="watermark" Defaultvalue="true"/>
		</InsertParameters>
		<DeleteParameters>
		    <asp:Parameter Name="ConnectionString" />
		</DeleteParameters>
		<UpdateParameters>
		    <asp:Parameter Name="Caption" DefaultValue=" "/>	
		    <asp:Parameter Name="ConnectionString" />		    		   
		</UpdateParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource2" Runat="server" TypeName="PhotoManager" 
		SelectMethod="ListUploadDirectory" >
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource3" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos"
		InsertMethod="AddPhotoWithGreenScreen" >
		<SelectParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" />
		</SelectParameters>
		<InsertParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" />
			<asp:Parameter Name="ConnectionString" />
			<asp:Parameter Name="DigitalRights" Defaultvalue="False"/>
			<asp:Parameter Name="IsPersonal" Defaultvalue="False"/>
			<asp:Parameter Name="watermark" Defaultvalue="true"/>
		</InsertParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource4" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos"
		InsertMethod="AddFramePhoto" >
		<SelectParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" />
		</SelectParameters>
		<InsertParameters>
			<asp:QueryStringParameter Name="AlbumID" Type="Int32" QueryStringField="AlbumID" />
			<asp:Parameter Name="ConnectionString" />
			<asp:Parameter Name="DigitalRights" Defaultvalue="False"/>
			<asp:Parameter Name="IsPersonal" Defaultvalue="False"/>
		</InsertParameters>
	</asp:ObjectDataSource>
	 
</asp:content>
