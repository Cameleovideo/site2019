<%@ page language="VB" autoeventwireup="false" masterpagefile="~/Admin/admin.master" inherits="Admin_admin_user_move, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">

    <table  width="50%" border="2">
        <tr>
            <th>
                Code d'usager source
            </th>
            <th >
                Vers
            </th>
            <th>
                Code d'usager destination
            </th>            
        </tr>
        <tr>
            <td>    
                <asp:TextBox ID="txtSource" runat="server"></asp:TextBox>
            </td>
            <td >
                <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
            </td>
            <td>
                <asp:TextBox ID="txtDestination" runat="server"></asp:TextBox>
            </td>            
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
                <table>                    
                    <tr>
                        <td>                        
                            Nom de l'album<br />                            
                            <asp:TextBox ID="txtAlbumCaption" runat="server"></asp:TextBox>                            
                        </td>
                        <td>
                            Event<br />
                            <asp:TextBox ID="txtEvent" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="AlbumToAdd" ControlToValidate="txtEvent" runat="server">*Event requis*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Code du photographe<br />
                            <asp:TextBox ID="txtPhotographUserName" runat="server"></asp:TextBox>
                        </td>                    
                        <td>
                            Nom de famille<br />
                            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            Prénom<br />
                            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            No d'identification<br />
                            <asp:TextBox ID="txtUniqueId" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            Courriel<br />
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            Groupe<br />
                            <asp:TextBox ID="txtGroup" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            Enseignant<br />
                            <asp:TextBox ID="txtSuperiorName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnCopyAlbumInfo" runat="server" Text="Copier l'information de l'album source" OnClick="btnCopyAlbumInfo_Click" />
                <asp:Button ID="btnAddAlbum" runat="server" Text="Ajouter un album" OnClick="btnAddAlbum_Click" ValidationGroup="AlbumToAdd" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlSource" runat="Server"  dataSourceID="odsSource" cssclass="view" repeatColumns="4" OnSelectedIndexChanged="dlSource_SelectedIndexChanged"
                    repeatdirection="Vertical" borderwidth="0" DataKeyField="AlbumID" SelectedItemStyle-BackColor="yellow">
                    
                    <ItemStyle cssClass="item" HorizontalAlign="Center"/>
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" >                
                            <tr>                    
                                <td colspan="3" rowspan="3">    
                                    <asp:LinkButton ID="btnSourceAlbum" CommandName="select" runat="server">                                
                                        <img src="../Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthPosterFirstPhoto") %>px; height:<%# Eval("HeightPosterFirstPhoto") %>px;' alt='Album Number <%# Eval("AlbumID") %>' />                                    
                                    </asp:LinkButton>
                                </td>                    
                            </tr>                               
                        </table>                        
			            <%#Eval("Caption").ToString() %>
			            (<asp:Label ID="AlbumID" runat="server" Text='<%#Eval("AlbumID").ToString()%>'></asp:Label>)
                        
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td style="vertical-align:middle">
                
            </td>
            <td>
                <asp:DataList ID="dlDestination" runat="Server"  dataSourceID="odsDestination" cssclass="view" repeatColumns="4" OnSelectedIndexChanged="dlDestination_SelectedIndexChanged"
                    repeatdirection="Vertical" borderwidth="0" DataKeyField="AlbumID" SelectedItemStyle-BackColor="yellow">
                    
                    <ItemStyle cssClass="item" HorizontalAlign="Center"/>
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" >                
                            <tr>                    
                                <td colspan="3" rowspan="3">
                                    <asp:LinkButton ID="btnDestinationAlbum" CommandName="select" runat="server">                                    
                                        <img src="../Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthPosterFirstPhoto") %>px; height:<%# Eval("HeightPosterFirstPhoto") %>px;' alt='Album Number <%# Eval("AlbumID") %>' />                                    
                                    </asp:LinkButton>
                                </td>                    
                            </tr>                               
                        </table>                          
			            <%#Eval("Caption").ToString() %>
			            <asp:LinkButton ID="btnDestinationAlbum2" CommandName="select" runat="server">
			                (<asp:Label ID="AlbumID" runat="server" Text='<%#Eval("AlbumID").ToString()%>'></asp:Label>)
			            </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlSourcePhotos" runat="Server"  dataSourceID="odsSourcePhotos" cssclass="view" repeatColumns="4" 
                    repeatdirection="Vertical" borderwidth="0" DataKeyField="PhotoID" >
                    
                    <ItemStyle cssClass="item" HorizontalAlign="Center"/>
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" >                
                            <tr>                    
                                <td colspan="3" rowspan="3">                                        
                                    <img src="../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthPoster") %>px; height:<%# Eval("HeightPoster") %>px;' alt='Photo Number <%# Eval("PhotoID") %>' />
                                </td>                    
                            </tr>                               
                        </table>                        
			            <%#Eval("Caption").ToString() %>
			            (<asp:Label ID="PhotoID" runat="server" Text='<%#Eval("PhotoID").ToString()%>'></asp:Label>)
                        <asp:CheckBox ID="chkPhoto" runat="server" />
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td style="vertical-align:middle">
                <asp:Button ID="btnMove" runat="server" Text=">>>Déplacer>>>" OnClick="btnMove_Click" Height="60"/>
            </td>
            <td>
                <asp:DataList ID="dlDestinationPhotos" runat="Server"  dataSourceID="odsDestinationPhotos" cssclass="view" repeatColumns="4" 
                    repeatdirection="Vertical" borderwidth="0" DataKeyField="PhotoID" >
                    
                    <ItemStyle cssClass="item" HorizontalAlign="Center"/>
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" >                
                            <tr>                    
                                <td colspan="3" rowspan="3">                                        
                                    <img src="../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthPoster") %>px; height:<%# Eval("HeightPoster") %>px;' alt='Photo Number <%# Eval("PhotoID") %>' />
                                </td>                    
                            </tr>                               
                        </table>                        
			            <%#Eval("Caption").ToString() %>
			            (<asp:Label ID="PhotoID" runat="server" Text='<%#Eval("PhotoID").ToString()%>'></asp:Label>)                        
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        
    </table>
    
    <asp:ObjectDataSource ID="odsSource" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetAlbums">
		<SelectParameters>
		    <asp:Parameter Name="UserName" DefaultValue="a"  />
		    <asp:Parameter Name="IsBackdrop" DefaultValue="False" />
		    <asp:Parameter Name="IsFrame" DefaultValue="False" />
		</SelectParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="odsSourcePhotos" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos">
		<SelectParameters>
		    <asp:Parameter Name="AlbumID" Type="Int32" DefaultValue="0"/>		    
		</SelectParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="odsDestination" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetAlbums">
		<SelectParameters>
		    <asp:Parameter Name="UserName" DefaultValue="a"  />
		    <asp:Parameter Name="IsBackdrop" DefaultValue="False" />
		    <asp:Parameter Name="IsFrame" DefaultValue="False" />
		</SelectParameters>
	</asp:ObjectDataSource>
	
	<asp:ObjectDataSource ID="odsDestinationPhotos" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetPhotos">
		<SelectParameters>
		    <asp:Parameter Name="AlbumID" Type="Int32" DefaultValue="0"/>		    
		</SelectParameters>
	</asp:ObjectDataSource>

</asp:Content>