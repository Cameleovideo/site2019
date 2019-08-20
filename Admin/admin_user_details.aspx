<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_user_details, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">

    <h3>Albums</h3>
    <h2>
        <asp:LinkButton ID="lnkOrders" runat="server" OnClick="lnkOrders_Click">Commandes</asp:LinkButton>
    </h2>
    <hr />
    <asp:DataList ID="DataList1" runat="Server"  dataSourceID="ObjectDataSource1" cssclass="view"
        repeatColumns="6" repeatdirection="Horizontal" borderwidth="0" cellpadding="10" cellspacing="10" 
        OnSelectedIndexChanged="DataList1_SelectedIndexChanged" DataKeyField="AlbumID">
        <ItemStyle cssClass="item" HorizontalAlign="Center"/>
        <ItemTemplate>
            <table border="0" cellpadding="0" cellspacing="0" >                
                <tr>                    
                    <td colspan="3" rowspan="3">
                        <asp:LinkButton ID="LinkButton1" commandname="select" runat="server">
                            <img src="../Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthPosterFirstPhoto") %>px; height:<%# Eval("HeightPosterFirstPhoto") %>px;' alt='Album Number <%# Eval("AlbumID") %>' />
                        </asp:LinkButton>                        
                    </td>                    
                </tr>                               
            </table>
            <asp:HyperLink ID="linkBatchOrder" NavigateUrl='<%# "admin_batchorder_create.aspx?UserName=" & Request("UserName") & "&AlbumId=" & Eval("AlbumId") %>' runat="server">
			    Commande batch
            </asp:HyperLink><br />
            <asp:HyperLink ID="linkAdminAlbum" NavigateUrl='<%# "gallery/Photos.aspx?AlbumID=" & Eval("AlbumId") %>' runat="server">
                Admin Album
            </asp:HyperLink>
			<h5><%#Eval("Caption") & " (" & Eval("EventUserName") & ")"%></h5>
        </ItemTemplate>
    </asp:DataList>

    <asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetAlbums">
		<SelectParameters>
		    <asp:Parameter Name="UserName"  />
		    <asp:Parameter Name="IsBackdrop" DefaultValue="False" />
		    <asp:Parameter Name="IsFrame" DefaultValue="False" />
		</SelectParameters>
	</asp:ObjectDataSource>
	
	
	<hr />
	
	<table border="1" width="100%">
	    <tr>
	        <td style="width:50%">
	            <asp:DataList ID="DataList2" runat="Server"	cssclass="view"	dataSourceID="ObjectDataSource2" 
		            repeatColumns="10" repeatdirection="Horizontal" 
		            OnSelectedIndexChanged="DataList2_SelectedIndexChanged" DataKeyField="PhotoID">
            		
		            <HeaderStyle horizontalalign="left" />

		            <headertemplate>
		                <h3 >
                            Event photos
                        </h3>
		            </headertemplate>
    		        
		            <SelectedItemStyle BackColor="Yellow">
                    </SelectedItemStyle>
            		
		            <ItemTemplate>        		    
			            <table id="Table1" border="0" cellpadding="0" cellspacing="0" class="photo-frame" runat="server">        				
				            <tr>            					
					            <td>
					                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">				    
					                    <img src="..\Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198" style='width:<%# Eval("WidthThumb") %>px; height:<%# Eval("HeightThumb") %>px;' alt='<%# Eval("PhotoID") %>' />					    	            	          
					                </asp:LinkButton>
					            </td>					
				            </tr>			        
			                <tr>			        
			                    <td>
			                        <asp:HyperLink ID="linkBuy" NavigateUrl='<%# "admin_order_create.aspx?UserName=" & Request("UserName") & "&PhotoId=" & Eval("PhotoId") %>' runat="server">
			                            <asp:Image ID="Image1" src="../images/icons/money_dollar.gif" runat="server"></asp:Image>			                
			                        </asp:HyperLink>
			                        
			                        <asp:LinkButton ID="LinkButton2" commandname="select" runat="server">
                                        <asp:Image ID="Image4" src="../images/icons/icon_download.gif" runat="server"></asp:Image>			                
                                    </asp:LinkButton> 			                    
			                    </td>		        
			                </tr>
			            </table>        			
		            </ItemTemplate>		        
	            </asp:DataList>
	        </td>
	        <td>
	            <asp:DataList ID="DataList3" runat="Server"	cssclass="view"	dataSourceID="ObjectDataSource3" 
		            repeatColumns="10" repeatdirection="Horizontal" 
		            OnSelectedIndexChanged="DataList3_SelectedIndexChanged" DataKeyField="PhotoID">
            		
		            <HeaderStyle horizontalalign="left" />

		            <headertemplate>
		                <h3 >
                            Personal photos
                        </h3>
		            </headertemplate>
		            
		            <SelectedItemStyle BackColor="Yellow">
                    </SelectedItemStyle>
    		        
		            <ItemTemplate>            		    
			            <table id="Table1" border="0" cellpadding="0" cellspacing="0" class="photo-frame" runat="server">        				
				            <tr>
            					
					            <td>
					                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">					            				    
					                    <img src="..\Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198" style='width:<%# Eval("WidthThumb") %>px; height:<%# Eval("HeightThumb") %>px;' alt='<%# Eval("PhotoID") %>' />
					                </asp:LinkButton>
					            </td>					
				            </tr>
			                <tr>			        
			                    <td>
			                        <asp:HyperLink ID="linkBuy" NavigateUrl='<%# "admin_order_create.aspx?UserName=" & Request("UserName") & "&PhotoId=" & Eval("PhotoId") %>' runat="server">
			                            <asp:Image ID="Image1" src="../images/icons/money_dollar.gif" runat="server"></asp:Image>			                
			                        </asp:HyperLink>
			                        
			                        <asp:LinkButton ID="LinkButton3" commandname="select" runat="server">
                                        <asp:Image ID="Image4" src="../images/icons/icon_download.gif" runat="server"></asp:Image>			                
                                    </asp:LinkButton>			                    
                                    
                                    <asp:ImageButton ID="ImageButton1" src="../images/icons/delete.gif " visible='<%# Eval("IsPersonal") %>'  text="delete" CommandName="Delete" runat="server"></asp:ImageButton>
			                    </td>		        
			                </tr>
			            </table>            			
		            </ItemTemplate>
	            </asp:DataList>
	        </td>
	    </tr>
	    <tr>    
	        <td>
	            <h1>Ajouter un fond</h1>
	            Catégorie: 
                <asp:DropDownList ID="lstBackdropCategories" runat="server" AutoPostBack="true">
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="btnCreateBackdrop" runat="server" OnClick="btnCreateBackdrop_Click" Enabled="false" >
                        Sauver
                </asp:LinkButton>
                <asp:DataList ID="lstBackdrops" runat="Server"	cssclass="view"	repeatColumns="10" DataKeyField="PhotoID"
                    repeatdirection="Horizontal"   DataSourceID="odsBackdrops" >
                    
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
	        <td>
	            <h1>Ajouter un cadre</h1>
	            Catégorie: 
                <asp:DropDownList ID="lstFrameCategories" runat="server" AutoPostBack="true">
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="btnCreateFrame" runat="server" OnClick="btnCreateFrame_Click" Enabled="false" >
                        Sauver
                </asp:LinkButton>
                
                <asp:DataList ID="lstFrames" runat="Server"	cssclass="view"	repeatColumns="10" DataKeyField="PhotoID"
                    repeatdirection="Horizontal"   DataSourceID="odsFrames" >
                    
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
	
	<asp:ObjectDataSource ID="odsBackdrops" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos">
		<SelectParameters>
			<asp:ControlParameter Name="AlbumID" Type="Int32" ControlID="lstBackdropCategories"  PropertyName="SelectedValue"/>
		</SelectParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="odsFrames" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos">
		<SelectParameters>
			<asp:ControlParameter Name="AlbumID" Type="Int32" ControlID="lstFrameCategories"  PropertyName="SelectedValue"/>
		</SelectParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource2" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetEventPhotos">
		<SelectParameters>
			<asp:Parameter Name="AlbumID" Type="Int32" DefaultValue="0"/>			
		</SelectParameters>		
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="ObjectDataSource3" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPersonalPhotos">
		<SelectParameters>
			<asp:Parameter Name="AlbumID" Type="Int32" DefaultValue="0"/>			
		</SelectParameters>		
	</asp:ObjectDataSource>
	
	
	<hr />
	
	<asp:formview id="FormView1" runat="server" datasourceid="ObjectDataSource4" borderstyle="none" borderwidth="0" CellPadding="0" cellspacing="0" datakeynames="PhotoID">
		<itemtemplate>		    
		    <asp:linkbutton id="Edit" text="Edit" commandname="Edit" runat="server"/> <br />
			<img src="../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=O" alt='Photo Number <%# Eval("PhotoID") %>' />				
        </itemtemplate>	        
        
        <EditItemTemplate>
			<div style="width:100%;text-align:right;" runat="server" >
			    jpg:<br />
			    <asp:FileUpload ID="PhotoFile" Runat="server" Width="416" FileBytes='<%# Bind("BytesOriginal") %>' CssClass="textfield" /><br />
			    
			    <asp:Panel runat="server" Visible='<%# Eval("IsGreenScreen") %>' >
			        png:<br />
                    <asp:FileUpload ID="PNGFile" Runat="server" Width="416" FileBytes='<%# Bind("BytesGreenScreen") %>' CssClass="textfield" /><br />
			    </asp:Panel>			    
			    
				<asp:Button ID="btnUpdate" Runat="server" CommandName="Update" text="save" />
				<asp:Button ID="ImageButton5" Runat="server" CommandName="Cancel"  text="cancel" />
			</div>
		</EditItemTemplate>
	</asp:formview>
	
	<asp:ObjectDataSource ID="ObjectDataSource4" Runat="server" TypeName="PhotoManager" OnUpdating="ObjectDataSource4_Updating"
			SelectMethod="GetPhoto"
			UpdateMethod="EditPhotoBytes">
			
			<SelectParameters>
				<asp:Parameter Name="PhotoID" Type="Int32" DefaultValue="0"/>
			</SelectParameters>
			
			<UpdateParameters>		    
		        <asp:Parameter Name="Watermark" DefaultValue="true"/>		    		    		   
		        <asp:Parameter Name="ConnectionString" />		    		   
		        <asp:Parameter Name="PhotoID" />		    		   
		    </UpdateParameters>
		</asp:ObjectDataSource>
</asp:Content>

