<%@ page language="VB" masterpagefile="~/Albums.master" autoeventwireup="false" inherits="PersonalAlbums, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Desktop/EditAlbum.ascx"  TagName="EditAlbum" TagPrefix="ucEditAlbum" %>

<asp:Content ID="Content2" ContentPlaceHolderID="infoZone" Runat="Server">
    <div class="mergeaccounts">
        <asp:Panel ID="panelAddAlbum"  runat="server" cssclass="addpersonalalbum"  >            
	        <h4>
	            <asp:Label ID="lblAddNewAlbum" runat="server" meta:resourcekey="lblAddNewAlbumResource1" />
	        </h4>	    
	        <asp:FormView ID="fvAddAlbum" Runat="server" DataSourceID="odsAddAlbum" DefaultMode="Insert"  Width="100%" BorderWidth="0px" CellPadding="0" OnItemInserted="FormView1_ItemInserted" >
		        <InsertItemTemplate>	
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnAddAlbum">                    
		                <asp:Image runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />		    
				        <asp:Label ID="lblAlbumTitleBox" runat="server" meta:resourcekey="lblAlbumTitleBoxResource1" />
				        <br />
				        <asp:TextBox ID="txtTitle" MaxLength="50" Runat="server" Width="100%" Text='<%# Bind("Caption") %>' cssclass="textbox" ValidationGroup="Add" />			    
			            <asp:RequiredFieldValidator	ID="RequiredFieldValidator1" Runat="server" ControlToValidate="txtTitle" meta:resourcekey="RequiredFieldValidator1Resource1" ValidationGroup="Add" EnableClientScript="false"  />
			            <div style="text-align:right;width:100%;">
				            <asp:ImageButton ID="btnAddAlbum" Runat="server" CommandName="Insert" CausesValidation="true" meta:resourcekey="btnAddAlbumResource1" ValidationGroup="Add" />                    
			            </div>
			            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images2/Albums/album_right_spacer.png" />   
			        </asp:Panel>
		        </InsertItemTemplate>
	        </asp:FormView>
	        <div id="moreinfo" class="moreinfo">
                <asp:Image ID="imgMoreInfo" runat="server" meta:resourcekey="imgMoreInfoResource1" />
                <div id="moreinfobutton" >
                    <a href="#moreinfocontent" rel="facebox">
                        <asp:ImageButton ID="btnMoreInfo" runat="server" meta:resourcekey="btnMoreInfoResource1" CausesValidation="false" />
                    </a>
                </div>
                <div id="moreinfocontent" style="visibility:hidden;display:none;z-index:1000;" >                        
                    <div id="loginmoreinfo" style="width:400px;height:320px;">
                        <table width="100%" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td>                                                      
                                    <h4>
                                        <asp:Label ID="lblQuestion1" runat="server" meta:resourcekey="lblQuestion1Resource1"></asp:Label>
                                    </h4>
                                    <asp:Label ID="lblAnswer1" runat="server" meta:resourcekey="lblAnswer1Resource1"></asp:Label>                            
                                    <br /><br />
                                    <h4>
                                        <asp:Label ID="lblQuestion2" runat="server" meta:resourcekey="lblQuestion2Resource1"></asp:Label>
                                    </h4>
                                    <asp:Label ID="lblAnswer2" runat="server" meta:resourcekey="lblAnswer2Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr valign="middle">                        
                                <td align="right">                                                                                       
                                    <br /><br /> 
                                    <asp:ImageButton ID="btnClose2" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_close_off.jpg" style="margin-left:3px;" CausesValidation="false" />
                                </td>
                            </tr>
                        </table>            
                    </div>
                </div>
            </div>
	    </asp:Panel>
        
	    <asp:ObjectDataSource ID="odsAddAlbum" Runat="server" TypeName="PhotoManager" 		
		    InsertMethod="AddAlbum" >				
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
		        <asp:Parameter Name="IsPersonalAlbum" DefaultValue="True" DbType="Boolean" />
		        <asp:Parameter Name="IsStaff" DefaultValue="False" DbType="Boolean" />
		        <asp:Parameter Name="IsPublic" DefaultValue="False" DbType="Boolean" />
		        <asp:Parameter Name="IsBackdrop" DefaultValue="False" DbType="Boolean" />
		        <asp:Parameter Name="IsFrame" DefaultValue="False" DbType="Boolean" />
		    </InsertParameters>
	    </asp:ObjectDataSource>
	</div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <div class="albums"> 
        <h4>
            <asp:Label ID="lblAlbums" runat="server" meta:resourcekey="lblAlbumsResource1" Visible="true"></asp:Label>
        </h4>
        
        <div id="divalbums">
            <div class="customScrollBox">  
                <div class="container">  
                    <div class="content">                       
                        <asp:DataList ID="lstAlbums" runat="Server"  dataSourceID="odsAlbums" OnSelectedIndexChanged="lstAlbums_SelectedIndexChanged" OnEditCommand="lstAlbums_EditCommand" OnItemDataBound="lstAlbums_ItemDataBound"
                            repeatColumns="1" repeatdirection="Horizontal" borderwidth="0" cellpadding="0" cellspacing="0" DataKeyField="AlbumID" OnDeleteCommand="lstAlbums_DeleteCommand">                            
                            <ItemTemplate>  
                                <div class="category">
                                    <table id="Table1" border="0" cellpadding="0" cellspacing="0"  >
                                        <tr>
                                            <td>     
                                                <div style="padding:10px 0px 10px 10px;">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select" CausesValidation="false">
                                                        <img src="Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=L"  class="photo_198" style='height:127px;' alt='Album Number <%# Eval("AlbumID") %>' />                        
                                                    </asp:LinkButton>                                                    
                                                </div>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/Albums/album_inside_spacer.jpg" />
                                            </td>
                                            <td>   
                                                <table border="0" style="width:100%;height:127px;">
                                                    <tr valign="top">
                                                        <td>
                                                            <h4>Album : <%#Eval("Caption").ToString%></h4>
                                                            <asp:Label ID="lblCount" runat="server" meta:resourcekey="lblCountResource1"></asp:Label><%# Eval("Count") %>
                                                        </td>
                                                    </tr>
                                                    <tr valign="bottom">
                                                        <td>
                                                            <asp:ImageButton ID="btnAlbum" runat="server" CommandName="Select" CausesValidation="false" meta:resourcekey="btnAlbumResource1" />
                                                            <div style="margin-left:15px;position:relative;float:right;">
                                                                <asp:ImageButton ID="btnShare" runat="server" CausesValidation="false" meta:resourcekey="btnShareResource1" Enabled="false" />
                                                            </div>
                                                            <br />
                                                            <div style="margin-top:5px;">
                                                                <asp:ImageButton ID="btnEditAlbum" runat="server" CommandName="edit" meta:resourcekey="btnEditAlbumResource1" />
                                                                <div style="margin-left:15px;position:relative;float:right;">
                                                                    <asp:ImageButton ID="btnDeleteAlbum" runat="server" CommandName="delete" visible='<%# CBool(Eval("IsPersonalAlbum")) %>' meta:resourcekey="btnDeleteAlbumResource1" />
                                                                </div>                                                            
                                                                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnDeleteAlbum" Enabled="True" meta:resourcekey="ConfirmButonExtender1Resource1" />                                            
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>			
                                </div>          
                            </ItemTemplate>                        
                        </asp:DataList>    
                        
                        <asp:Panel ID="NoAlbumsPanel1" runat="server" Visible="false">
                            <h4>
                                <asp:Label ID="lblNoAlbums" runat="server" meta:resourcekey="lblNoAlbumsResource1" ></asp:Label>
                            </h4>
                        </asp:Panel> 
                        
                        <ucEditAlbum:EditAlbum id="EditAlbum" runat="server" Visible="false" />
                    </div>  
                </div>  
                <div class="dragger_container">  
                    <div class="dragger">
                    </div>  
                </div>  
            </div>  
        </div>  
    </div>    
    
	<asp:ObjectDataSource ID="odsAlbums" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetAlbums"
		DeleteMethod="RemoveAlbum">		
		<SelectParameters>
		    <asp:Parameter Name="OnlyPersonalAlbums" DbType="boolean" DefaultValue="true" />
		</SelectParameters>		
		<DeleteParameters>
		    <asp:Parameter Name="ConnectionString" />
		    <asp:Parameter Name="AlbumID" />
		</DeleteParameters>		
	</asp:ObjectDataSource>
	
	<script type="text/javascript" language="javascript">                 
        /*$(window).load(function() {
            $('#mcs9_container').mCustomScrollbar('vertical',600,'easeOutCirc',1.05,'auto','yes','yes',10);
        });             */
    </script>     
    <script src="_javascript/scroll/jquery.mCustomScrollbar.js" type="text/javascript"></script>
</asp:Content>


