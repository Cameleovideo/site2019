<%@ page language="VB" autoeventwireup="false" masterpagefile="~/Admin/admin.master" inherits="Admin_admin_user_merge, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
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
                <asp:DataList ID="dlSource" runat="Server"  dataSourceID="odsSource" cssclass="view" repeatColumns="2" 
                    repeatdirection="Vertical" borderwidth="0" DataKeyField="AlbumID">
                    
                    <ItemStyle cssClass="item" HorizontalAlign="Center"/>
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" >                
                            <tr>                    
                                <td colspan="3" rowspan="3">                                    
                                    <img src="../Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthPosterFirstPhoto") %>px; height:<%# Eval("HeightPosterFirstPhoto") %>px;' alt='Album Number <%# Eval("AlbumID") %>' />                                    
                                </td>                    
                            </tr>                               
                        </table>                        
			            <%#Eval("Caption").ToString() %>
			            (<asp:Label ID="AlbumID" runat="server" Text='<%#Eval("AlbumID").ToString()%>'></asp:Label>)
                        <asp:CheckBox ID="chkAlbum" runat="server" />
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td style="vertical-align:middle">
                <asp:Button ID="btnMerge" runat="server" Text=">>>Merge>>>" OnClick="btnMerge_Click" Height="60"/>
            </td>
            <td>
                <asp:DataList ID="dlDestination" runat="Server"  dataSourceID="odsDestination" cssclass="view" repeatColumns="2" 
                    repeatdirection="Vertical" borderwidth="0" DataKeyField="AlbumID">
                    
                    <ItemStyle cssClass="item" HorizontalAlign="Center"/>
                    <ItemTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" >                
                            <tr>                    
                                <td colspan="3" rowspan="3">                                    
                                    <img src="../Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=L"  class="photo_198" style='width:<%# Eval("WidthPosterFirstPhoto") %>px; height:<%# Eval("HeightPosterFirstPhoto") %>px;' alt='Album Number <%# Eval("AlbumID") %>' />                                    
                                </td>                    
                            </tr>                               
                        </table>                          
			            <%#Eval("Caption").ToString() %>
			            (<asp:Label ID="AlbumID" runat="server" Text='<%#Eval("AlbumID").ToString()%>'></asp:Label>)
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
	
	<asp:ObjectDataSource ID="odsDestination" Runat="server" TypeName="PhotoManager" 
		SelectMethod="GetAlbums">
		<SelectParameters>
		    <asp:Parameter Name="UserName" DefaultValue="a"  />
		    <asp:Parameter Name="IsBackdrop" DefaultValue="False" />
		    <asp:Parameter Name="IsFrame" DefaultValue="False" />
		</SelectParameters>
	</asp:ObjectDataSource>

</asp:Content>