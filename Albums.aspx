<%@ page language="VB" masterpagefile="~/albums.master" inherits="Albums_aspx, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Desktop/MergeAccounts.ascx" TagName="MergeAccounts" TagPrefix="uc1" %>

<asp:content id="Content2" contentplaceholderid="infoZone" runat="server">
    <div class="mergeaccounts">
        <uc1:MergeAccounts id="MergeAccounts" runat="server" />
    </div>    
</asp:content>

<asp:content id="Content1" contentplaceholderid="Main2" runat="server" >
    <script src="pga/md5.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/JavaScript"> 
        function concatURL(peUniqueID1, peUniqueID2)
        {
            pTournament = '<%=Profile.CaptureActionDate%>';           
            pRedirect = 'http://www.customeventvideo.com/users/event/'+pTournament+'/swing.php?key='+b64_md5(peUniqueID1+peUniqueID2)+'&firstname=' + document.getElementById('<%=txtFirstName.ClientID%>').value + '&lastname=' + document.getElementById('<%=txtLastName.ClientID%>').value + '&video=3&grouppic=0&pathname=/users/event/'+pTournament+'/&showgrouppic=0&curvideo=2'                                     
            window.open(pRedirect);
        }
    </script>

    <table id="tblCaptureAction" runat="server" style="width:100%" visible="false">         
        <tr>
            <td>
                <asp:HiddenField runat="server" ID="txtFirstName" />
                <asp:HiddenField runat="server" ID="txtLastName" />                
                <asp:ImageButton ID="btnCaptureAction" runat="server" meta:resourcekey="btnCaptureActionResource1" Width="75px" OnClick="btnCaptureAction_Click"  />                                
            </td>
            <td>
                <asp:Label ID="lblCaptureAction" runat="server" meta:resourcekey="lblCaptureActionResource1" ></asp:Label>
            </td>
        </tr>    
    </table>    
    
    <div class="albums" >    
        <h4>
            <asp:Label ID="lblAlbums" runat="server" meta:resourcekey="lblAlbumsResource1"></asp:Label>
        </h4>
        
        <div id="divalbums">
            <div class="customScrollBox">  
                <div class="container">  
                    <div class="content">                       
                        <asp:DataList ID="lstAlbums" runat="Server"  dataSourceID="odsAlbums"  OnSelectedIndexChanged="lstAlbums_SelectedIndexChanged"
                            repeatColumns="1" repeatdirection="Horizontal" borderwidth="0" cellpadding="0" cellspacing="0" DataKeyField="AlbumID" OnItemDataBound="lstAlbums_ItemDataBound" >
                            
                            <ItemTemplate>    
                                <asp:Panel ID="pnlAlbum" runat="server" visible='<%# not Eval("IsPersonalAlbum") %>' CssClass="category">                                
                                    <table id="Table1" border="0" cellpadding="0" cellspacing="0" runat="server" >
                                        <tr>
                                            <td>  
                                                <div style="padding:10px 0px 10px 10px;">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select" CausesValidation="false">
                                                        <img src="Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&Size=L"  class="photo_198" style='height:127px;' alt='Album Number <%# Eval("AlbumID") %>'  />
                                                    </asp:LinkButton>
                                                </div>                                                        
                                            </td>
                                            <td>
                                                <asp:Image runat="server" ImageUrl="~/Images2/Albums/album_inside_spacer.jpg" />
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
                                                            <div style="margin-left:15px;position:relative;float:left;">
                                                                <asp:ImageButton ID="btnAlbum" runat="server" CommandName="Select" CausesValidation="false" meta:resourcekey="btnAlbumResource1" />
                                                            </div>
                                                            <div style="margin-left:15px;position:relative;float:right;">
                                                                <asp:ImageButton ID="btnShare" runat="server" CausesValidation="false" meta:resourcekey="btnShareResource1" Enabled="false" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>                                                 
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:DataList>
                        
                        <asp:Panel ID="NoAlbumsPanel1" runat="server" Visible="false">
                            <h4>
                                <asp:Label ID="lblNoAlbums" runat="server" meta:resourcekey="lblNoAlbumsResource1" ></asp:Label>
                            </h4>
                        </asp:Panel> 
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
		SelectMethod="GetAlbums">
	</asp:ObjectDataSource>   
    
    <script type="text/javascript" language="javascript">                 
        /*$(window).load(function() {
            $('#mcs8_container').mCustomScrollbar('vertical',600,'easeOutCirc',1.05,'auto','yes','yes',10);
        });*/
    </script>     
    <script src="_javascript/scroll/jquery.mCustomScrollbar.js" type="text/javascript"></script>

</asp:content>