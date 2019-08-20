<%@ control language="VB" autoeventwireup="false" inherits="Modules_Desktop_EditAlbum, App_Web_0t-wriki" %>

    <h3>
        <asp:Literal ID="YourPhotosHeader" meta:resourcekey="YourPhotosHeaderResource1" runat="server"></asp:Literal>
    </h3>
					    
    <asp:UpdatePanel ID="upPnlMessages" runat="server" UpdateMode="Conditional">
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

    <asp:gridview id="gvPhotos" runat="server" datasourceid="odsPhotos" datakeynames="PhotoID" cellpadding="6" EnableViewState="False"
	    autogeneratecolumns="False" BorderStyle="None" BorderWidth="0px" >
	    <EmptyDataRowStyle CssClass="emptydata"></EmptyDataRowStyle>
	    <EmptyDataTemplate>
		    <asp:Literal ID="NoPhotos" meta:resourcekey="NoPhotosResource1" runat="server"></asp:Literal>				    
	    </EmptyDataTemplate>
    	
	    <rowstyle verticalalign="Top"/>

	    <columns>
		    <asp:TemplateField >
			    <ItemStyle Width="50px" />
			    <ItemTemplate>				    					
			        <img src="Handler.ashx?Size=S&PhotoID=<%# Eval("PhotoID") %>"  class="photo_198" style="width:<%# Eval("WidthThumb") %>px; height:<%# Eval("HeightThumb") %>px;<%# IsLessThanTwoWeeks(Eval("PictureAddedDate"), Eval("InPersonalAlbum")) %>" alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' />                    
			    </ItemTemplate>
		    </asp:TemplateField>
		    <asp:boundfield datafield="Caption" meta:resourcekey="CaptionFieldResource1" />		    
            
		    <asp:TemplateField >
			    <ItemStyle Width="150px" />
			    <ItemTemplate>
				    <div style="width:100%;text-align:right;">					    
					    <asp:ImageButton ID="btnDeletePhoto" Runat="server" CommandName="Delete"  meta:resourcekey="btnDeletePhotoResource1"/>
				    </div>
				    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnDeletePhoto" Enabled="True" meta:resourcekey="ConfirmButonExtender1" />
			    </ItemTemplate>			    
		    </asp:TemplateField>
	    </columns>
    </asp:gridview>
    
    <asp:ObjectDataSource ID="odsPhotos" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos"
		InsertMethod="AddPhoto" 
		DeleteMethod="RemovePhoto" >
		<SelectParameters>
			<asp:Parameter Name="AlbumID" Type="Int32" />
		</SelectParameters>
		<InsertParameters>
			<asp:Parameter Name="AlbumID" Type="Int32" />
			<asp:Parameter Name="ConnectionString" />
			<asp:Parameter Name="DigitalRights" Defaultvalue="False"/>
			<asp:Parameter Name="IsPersonal" Defaultvalue="False"/>
			<asp:Parameter Name="watermark" Defaultvalue="true"/>
		</InsertParameters>
		<DeleteParameters>
		    <asp:Parameter Name="ConnectionString" />
		</DeleteParameters>		
	</asp:ObjectDataSource>