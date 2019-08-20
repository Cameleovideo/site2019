<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_top_photos, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <table border="1">
        <tr>
            <td>
                <table  style="height:100%">
                    <tr>            
                        <td>
                            <h1>Add Top Background Photos</h1><br />
                            <asp:DropDownList ID="DropDownList1" DataSourceID="ObjectDataSource1" runat="server" AutoPostBack="true"
                                DataTextField = "Caption"
                                DataValueField = "AlbumId">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>                
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PhotoID, AlbumID" DataSourceID="SqlDataSource1"
	                            DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting">

	                             <InsertItemTemplate>
		                            Photo<br />
            		                
		                            <asp:DataList ID="DataList1" runat="Server"	cssclass="view"	DataSourceID="ObjectDataSource2"
	                                    repeatColumns="10" repeatdirection="Horizontal"  EnableViewState="false" 
	                                     DataKeyField="PhotoID" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            	                        
	                                    <SelectedItemStyle BackColor="Yellow">
                                        </SelectedItemStyle>
                                        
            	                        
	                                    <ItemTemplate>		            
                                            <asp:Label ID="Label2" Font-Size="6pt" runat="server" ><%# Server.HtmlEncode(Eval("Caption").ToString()) %><br /></asp:Label>
		                                    <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
			                                    <tr>
				                                    <td class="topx--"></td>
				                                    <td class="top-x-"></td>
				                                    <td class="top--x"></td>
			                                    </tr>
			                                    <tr>
				                                    <td class="midx--"></td>
				                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">
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
	                                    <FooterTemplate>
	                                    </FooterTemplate>
                                    </asp:DataList>	
		                            <br />
            		                
		                            <asp:HiddenField ID="PhotoID" runat="server" Value='<%#Bind("PhotoID")%>'/>
		                            <asp:HiddenField ID="AlbumID" runat="server" Value='<%#Bind("AlbumID")%>'/>		                
            		                
		                            Ordre<br />
		                            <asp:TextBox ID="OrdreTextBox" runat="server" Text='<%#Bind("NbBackgrounds")%>'>
		                            </asp:TextBox><br />
            		                
		                            IsNew<br />
		                            <asp:CheckBox ID="IsNewCheckBox" runat="server" Checked='<%#Bind("IsNew")%>'>
		                            </asp:CheckBox><br />
            		                
		                            <br />
		                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
			                            Text="Insert">
		                            </asp:LinkButton>
	                            </InsertItemTemplate>
                            </asp:FormView>
                            <br/><br/>
                  
                            <asp:label id="MessageLabel" forecolor="Red" runat="server"/>

                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="dgTopPhotos" runat="server" AutoGenerateColumns="False" 
	                            CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1"
	                            AllowPaging="true" PageSize="50"
	                            AutoGenerateDeleteButton="true" AutoGenerateEditButton="true"
	                            DataKeyNames="PhotoID, AlbumID" Width="50%">
                        	    
		                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        		
		                        <Columns>
		                            <asp:TemplateField HeaderText="Photo"> 
		                                <ItemTemplate >
		                                    <img src="../images/pixClear.gif"  class="photo_198" style='background-image: url(../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S);width:65px; height:100px;' alt='Photo Number <%# Eval("PhotoID") %>' />
		                                </ItemTemplate>
		                            </asp:TemplateField>
		                            <asp:BoundField DataField="NbBackgrounds" InsertVisible="true" HeaderText="Ordre" ReadOnly="false" />
		                            <asp:CheckBoxField DataField="IsNew" insertvisible="True" HeaderText="IsNew" ReadOnly="False" />
		                        </Columns>
                        		
		                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		                        <EditRowStyle BackColor="#999999" />
		                        <AlternatingRowStyle BackColor="gray" ForeColor="black" />
                        		
		                        <emptydatatemplate>                          
                                    Aucune photos trouvée.
                                </emptydatatemplate> 
                                
                                <pagersettings mode="NextPreviousFirstLast"                    
                                    NextPageImageUrl="..\App_Themes\White\Images\button-next.gif"
                                    PreviousPageImageUrl="..\App_Themes\White\Images\button-prev.gif"   
                                    FirstPageImageUrl="..\App_Themes\White\Images\button-first.gif"
                                    LastPageImageUrl="..\App_Themes\White\Images\button-last.gif"
                                    position="TopAndBottom"/> 

                                <PagerStyle BackColor="white"/>
                                
	                        </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table  style="height:100%">
                    <tr>            
                        <td>
                            <h1>Add Top Frame Photos</h1><br />
                            <asp:DropDownList ID="DropDownList2" DataSourceID="ObjectDataSource3" runat="server" AutoPostBack="true"
                                DataTextField = "Caption"
                                DataValueField = "AlbumId">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>                
                            <asp:FormView ID="FormView2" runat="server" DataKeyNames="PhotoID, AlbumID" DataSourceID="SqlDataSource2"
	                            DefaultMode="Insert" OnItemInserting="FormView2_ItemInserting">

	                             <InsertItemTemplate>
		                            Photo<br />
            		                
		                            <asp:DataList ID="DataList2" runat="Server"	cssclass="view"	DataSourceID="ObjectDataSource4"
	                                    repeatColumns="10" repeatdirection="Horizontal"  EnableViewState="false" 
	                                     DataKeyField="PhotoID" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
            	                        
	                                    <SelectedItemStyle BackColor="Yellow">
                                        </SelectedItemStyle>
                                        
            	                        
	                                    <ItemTemplate>		            
                                            <asp:Label ID="Label2" Font-Size="6pt" runat="server" ><%# Server.HtmlEncode(Eval("Caption").ToString()) %><br /></asp:Label>
		                                    <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
			                                    <tr>
				                                    <td class="topx--"></td>
				                                    <td class="top-x-"></td>
				                                    <td class="top--x"></td>
			                                    </tr>
			                                    <tr>
				                                    <td class="midx--"></td>
				                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">
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
	                                    <FooterTemplate>
	                                    </FooterTemplate>
                                    </asp:DataList>	
		                            <br />
            		                
		                            <asp:HiddenField ID="PhotoID" runat="server" Value='<%#Bind("PhotoID")%>'/>
		                            <asp:HiddenField ID="AlbumID" runat="server" Value='<%#Bind("AlbumID")%>'/>		                
            		                
		                            Ordre<br />
		                            <asp:TextBox ID="nbFramesTextBox" runat="server" Text='<%#Bind("NbFrames")%>'>
		                            </asp:TextBox><br />
            		                
		                            IsNew<br />
		                            <asp:CheckBox ID="IsNewCheckBox" runat="server" Checked='<%#Bind("IsNew")%>'>
		                            </asp:CheckBox><br />
            		                
		                            <br />
		                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
			                            Text="Insert">
		                            </asp:LinkButton>
	                            </InsertItemTemplate>
                            </asp:FormView>
                            <br/><br/>
                  
                            <asp:label id="MessageLabel2" forecolor="Red" runat="server"/>

                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="dgTopFrames" runat="server" AutoGenerateColumns="False" 
	                            CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource2"
	                            AllowPaging="true" PageSize="50"
	                            AutoGenerateDeleteButton="true" AutoGenerateEditButton="true"
	                            DataKeyNames="PhotoID, AlbumID" Width="50%">
                        	    
		                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        		
		                        <Columns>
		                            <asp:TemplateField HeaderText="Photo"> 
		                                <ItemTemplate >
		                                    <img src="../images/pixClear.gif"  class="photo_198" style='background-image: url(../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S);width:65px; height:100px;' alt='Photo Number <%# Eval("PhotoID") %>' />
		                                </ItemTemplate>
		                            </asp:TemplateField>
		                            <asp:BoundField DataField="NbFrames" InsertVisible="true" HeaderText="NbFrames" ReadOnly="false" />
		                            <asp:CheckBoxField DataField="IsNew" insertvisible="True" HeaderText="IsNew" ReadOnly="False" />
		                        </Columns>
                        		
		                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		                        <EditRowStyle BackColor="#999999" />
		                        <AlternatingRowStyle BackColor="gray" ForeColor="black" />
                        		
		                        <emptydatatemplate>                          
                                    Aucune photos trouvée.
                                </emptydatatemplate> 
                                
                                <pagersettings mode="NextPreviousFirstLast"                    
                                    NextPageImageUrl="..\App_Themes\White\Images\button-next.gif"
                                    PreviousPageImageUrl="..\App_Themes\White\Images\button-prev.gif"   
                                    FirstPageImageUrl="..\App_Themes\White\Images\button-first.gif"
                                    LastPageImageUrl="..\App_Themes\White\Images\button-last.gif"
                                    position="TopAndBottom"/> 

                                <PagerStyle BackColor="white"/>
                                
	                        </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
        
    </table>
    
	
	
	
	<asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetBackdropAlbums" >
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource2" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos" >
		<SelectParameters>
		    <asp:controlparameter Name="AlbumID" Type="Int32" controlid="DropDownList1" propertyname="SelectedItem.Value" DefaultValue="0"/>
		</SelectParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource3" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetFrameAlbums" >
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource4" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos" >
		<SelectParameters>
		    <asp:controlparameter Name="AlbumID" Type="Int32" controlid="DropDownList2" propertyname="SelectedItem.Value" DefaultValue="0"/>
		</SelectParameters>
	</asp:ObjectDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Personal %>" 
		SelectCommand="SELECT * FROM TopPhotos WHERE AlbumID = @AlbumID ORDER BY NbBackgrounds DESC"
		
		DeleteCommand="DELETE FROM TopPhotos WHERE PhotoID = @PhotoID AND AlbumID = @AlbumID"		
		
		UpdateCommand="UPDATE TopPhotos SET NbBackgrounds = @NbBackgrounds, IsNew = @IsNew WHERE [PhotoID] = @PhotoID AND AlbumID = @AlbumID"
		
		InsertCommand="INSERT INTO TopPhotos (PhotoID, ALbumID, NbBackgrounds, NbFrames, IsNew) VALUES (@PhotoID, @AlbumID, @NbBackgrounds, 0, @IsNew)">
		
		
		<SelectParameters>
		    <asp:controlparameter Name="AlbumID" Type="Int32" controlid="DropDownList1" propertyname="SelectedItem.Value" DefaultValue="0"/>
		</SelectParameters>
		
		<DeleteParameters>
			<asp:Parameter Name="PhotoID" Type="Int32" />
			<asp:Parameter Name="ALbumID" Type="Int32" />
		</DeleteParameters>
		
		<UpdateParameters>			
			<asp:Parameter Name="NbBackgrounds" Type="Int32" />			
			<asp:Parameter Name="IsNew" Type="Boolean" />
			<asp:Parameter Name="PhotoID" Type="Int32" />
			<asp:Parameter Name="ALbumID" Type="Int32" />
		</UpdateParameters>
		
		<InsertParameters>
		    <asp:Parameter Name="PhotoID" Type="Int32" />
			<asp:Parameter Name="ALbumID" Type="Int32" />
			<asp:Parameter Name="NbBackgrounds" Type="Int32" />						
			<asp:Parameter Name="IsNew" Type="Boolean" />			
		</InsertParameters>
		
	</asp:SqlDataSource>
	
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Personal %>" 
		SelectCommand="SELECT * FROM TopPhotos WHERE AlbumID = @AlbumID ORDER BY NbFrames DESC"
		
		DeleteCommand="DELETE FROM TopPhotos WHERE PhotoID = @PhotoID AND AlbumID = @AlbumID"		
		
		UpdateCommand="UPDATE TopPhotos SET NbFrames = @NbFrames, IsNew = @IsNew WHERE [PhotoID] = @PhotoID AND AlbumID = @AlbumID"
		
		InsertCommand="INSERT INTO TopPhotos (PhotoID, ALbumID, NbBackgrounds, NbFrames, IsNew) VALUES (@PhotoID, @AlbumID, 0, @nbFrames, @IsNew)">
		
		
		<SelectParameters>
		    <asp:controlparameter Name="AlbumID" Type="Int32" controlid="DropDownList2" propertyname="SelectedItem.Value" DefaultValue="0"/>
		</SelectParameters>
		
		<DeleteParameters>
			<asp:Parameter Name="PhotoID" Type="Int32" />
			<asp:Parameter Name="ALbumID" Type="Int32" />
		</DeleteParameters>
		
		<UpdateParameters>			
			<asp:Parameter Name="NbFrames" Type="Int32" />			
			<asp:Parameter Name="IsNew" Type="Boolean" />
			<asp:Parameter Name="PhotoID" Type="Int32" />
			<asp:Parameter Name="ALbumID" Type="Int32" />
		</UpdateParameters>
		
		<InsertParameters>
		    <asp:Parameter Name="PhotoID" Type="Int32" />
			<asp:Parameter Name="ALbumID" Type="Int32" />
			<asp:Parameter Name="NbFrames" Type="Int32" />						
			<asp:Parameter Name="IsNew" Type="Boolean" />			
		</InsertParameters>
		
	</asp:SqlDataSource>
	
	
</asp:Content>
