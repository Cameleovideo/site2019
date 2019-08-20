<%@ control language="VB" autoeventwireup="false" inherits="Modules_Desktop_Album, App_Web_0t-wriki" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>        
    <div style="padding:0 5px;">
        
        <div style="padding:0px 0px 3px 0px;width:100%">            
            <cc1:OboutDropDownList ID="cboAlbums" runat="server"  OnSelectedIndexChanged="cboAlbums_SelectedIndexChanged" AutoPostBack="true" FolderStyle="obout/Interface/styles/grand_gray/OboutDropDownList" Width="100%">
            </cc1:OboutDropDownList>            
        </div>        
        
        <asp:formview id="fvSelectedPose" runat="server" datasourceid="odsPoses" datakeynames="PhotoID" OnDataBound="fvSelectedPose_DataBound"
            borderstyle="none" borderwidth="0" CellPadding="0" cellspacing="0" EnableViewState="false">
            <itemtemplate>                		
                <asp:Panel ID="pnlGreenScreenImage" runat="server" Visible="false">                
                    <img id="imgSelectedPose" src='HandlerGreenScreen.ashx?PhotoID=<%# Eval("PhotoID") %>&BackdropPhotoID=<%# Cameleo.DesktopInfo.BackdropPhotoID %>&FramePhotoID=<%# Cameleo.DesktopInfo.FramePhotoID %>' alt='<%# Eval("PhotoID") %>' style="width:195px;" />                
                </asp:Panel>                
                
                <asp:Panel ID="pnlTradImage" runat="server" Visible="false">
                    <img id="imgSelectedPose2" src='Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=L'  style='width:196px;' alt='<%# Eval("PhotoID") %>' />
                </asp:Panel>                
                
                <asp:Label ID="lblArchived"  ForeColor="red" runat="server" meta:resourcekey="lblArchivedResource1" Visible='<%# Eval("IsArchived") %>'></asp:Label>
            </itemtemplate>
        </asp:formview>
        
        <div style="margin-top:3px;padding-top:3px;"></div>
        
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr valign="middle">
                <td>
                    <asp:ImageButton ID="btnBuy" runat="server" meta:resourcekey="btnBuyResource1" />
                </td>
                <td>
                    <asp:ImageButton ID="btnDownload" runat="server" meta:resourcekey="btnDownloadResource1" />    
                </td>
                <td align="right">
                    <asp:ImageButton ID="btnHelp" runat="server" ImageUrl="~/Images2/Download/download_help_off.jpg" />    
                </td>
            </tr>
        </table>        
        
        <asp:Label ID="lblEmptyAlbum" runat="server" meta:resourcekey="lblEmptyAlbumResource1" Visible="false"></asp:Label>
        
        <asp:Image ID="imgSpacer" runat="server" ImageUrl="~/Images2/Download/download_spacer.jpg" />
        
        <div id="divposes" style="overflow:auto;">  
            <div class="customScrollBox">  
                <div class="horWrapper">  
                    <div class="container">  
                        <div class="content">  
                            <asp:DataList ID="lstPoses" runat="Server"	dataSourceID="odsPoses" DataKeyField="PhotoID"
                                repeatdirection="Horizontal" EnableViewState="false" OnSelectedIndexChanged="lstPoses_SelectedIndexChanged">	
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>		                        
                                    <asp:LinkButton ID="lnkPose" runat="server" CommandName="select">
                                        <img src="Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198" style='width:46px;' alt='Aperçu' />                                                
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:DataList> 
                        </div>  
                    </div>  
                    <div class="dragger_container">  
                        <div class="dragger">
                        </div>  
                    </div>  
                </div>  
            </div>  
        </div>
    </div>
    
    <asp:ObjectDataSource ID="odsPoses" Runat="server" TypeName="PhotoManager" 
	    SelectMethod="GetEventPhotos">
	    <SelectParameters>
	        <asp:SessionParameter Name="AlbumID" Type="Int32" SessionField="AlbumID" DefaultValue="0" />		
	    </SelectParameters>		
    </asp:ObjectDataSource>  
    
       
    <script type="text/javascript">         
        /*var prm = Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequest5);
        function EndRequest5(sender, args) {              
            Init5();         
        }          
        
        function Init5(){              
            $('#mcs5_container').mCustomScrollbar('horizontal',600,'easeOutCirc',1.05,'auto','yes','yes',10);
        }                  
        $(window).load(Init5);        */
    </script> 