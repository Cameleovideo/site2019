<%@ control language="VB" autoeventwireup="false" inherits="Modules_Desktop_Backgrounds, App_Web_0t-wriki" %>    
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>    

    <div id="divCategories" runat="server" style="overflow:auto;">
        <div id="scrollcategories" >
            <div class="customScrollBox">  
                <div class="container">  
                    <div class="content">  
                        <asp:DataList ID="lstCategories" runat="Server"	repeatdirection="Vertical" DataKeyField="AlbumID" OnItemDataBound="lstCategories_ItemDataBound" OnSelectedIndexChanged="lstCategories_SelectedIndexChanged">
                            <ItemTemplate>                                
                                <div class="categoryheader">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr valign="top">
                                            <td>
                                                <asp:Image ID="imgCornerLeft" runat="server" ImageUrl="~/Images2/Categories/category_corner_left.png" />
                                            </td>
                                            <td>
                                                <div class="categoryname">
                                                    <h4>
                                                        <asp:Label ID="lblCategory" runat="server" ><%# Eval("Caption") %></asp:Label>            
                                                    </h4>
                                                </div>                                            
                                            </td>
                                            <td>
                                                <asp:Image ID="imgCornerRight" runat="server" ImageUrl="~/Images2/Categories/category_corner_right.png" />
                                            </td>
                                        </tr>                                    
                                    </table>                                
                                </div>
                                <div class="categoryheaderpadding"></div>
                                <br style="clear:both;" />
                                
                                <div class="category">
                                    <table id="tblCategories" runat="server" width="100%">
                                        <tr valign="top">
                                            <td>
                                                <asp:DataList ID="lstTopBackgrounds" runat="Server"	repeatdirection="Horizontal"  RepeatColumns="5" DataKeyField="PhotoID" OnSelectedIndexChanged="lstTopBackgrounds_SelectedIndexChanged">
                                                    <ItemStyle VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                        <div id="backgroundcategoryimage">                                                        
                                                            <asp:LinkButton ID="lnkTopBackground" runat="server" Commandname="Select">
                                                                <img src="Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  style='width:98px;' alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' />				                
                                                            </asp:LinkButton>
                                                        </div>
                                                        <div id="categorydescription">                                                                                         
                                                            <asp:Label ID="lblCaption" Font-Bold="true" runat="server" ><%# Eval("Caption") %><br/></asp:Label>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                            <td align="right">
                                                <div id="seeall">
                                                    <asp:ImageButton ID="btnAllBackgrounds" runat="server" CommandName="Select" meta:resourcekey="btnAllBackgroundsResource2"   />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
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
    
    <div id="divAllBackgrounds" runat="server" style="margin-left:25px;" visible="false">
        <div id="divall" >
            <div class="customScrollBox">  
                <div class="container">  
                    <div class="content">                                                  
                        <asp:DataList ID="lstAllBackgrounds" runat="Server"	repeatdirection="Horizontal"  RepeatColumns="5" DataKeyField="PhotoID" OnSelectedIndexChanged="lstAllBackgrounds_SelectedIndexChanged" Visible="false" OnItemDataBound="lstAllBackgrounds_ItemDataBound" OnItemCommand="lstAllBackgrounds_ItemCommand">
                            <ItemStyle VerticalAlign="Top" />
                            <AlternatingItemStyle VerticalAlign="Top" />
                            <HeaderTemplate>                                
                                <table width="100%">
                                    <tr valign="middle">
                                        <td>
                                            <asp:LinkButton ID="btnBack" runat="server" meta:resourcekey="btnBackResource1" OnClick="btnBack_Click" Font-Underline="true"></asp:LinkButton>
                                            <asp:Image ID="imgSpacer" runat="server" ImageUrl="~/Images2/Inside/category_inside_triangle.png" />
                                            <asp:Label ID="lblCategory" runat="server" ForeColor="#00703C" Font-Bold="true"></asp:Label>                                            
                                        </td>
                                        <td align="right">
                                            <asp:label id="lblCurrentItems" runat="server" Font-Bold="true"></asp:label>
                                            <asp:label id="lblOf" runat="server" meta:resourcekey="lblOfResource1"></asp:label>
                                            <asp:label id="lblItemsCount" runat="server"></asp:label>
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images2/Inside/category_inside_spacer.png" />
                                            <asp:Label ID="lblSeePage" runat="server" meta:resourcekey="lblSeePageResource1" Font-Bold="true"></asp:Label>
                                            <cc1:OboutDropDownList ID="cboCurrentPage" runat="server"  OnSelectedIndexChanged="cboCurrentPage_SelectedIndexChanged" AutoPostBack="true" FolderStyle="obout/Interface/styles/plain/OboutDropDownList" Width="40px" MenuWidth="100px" >
                                            </cc1:OboutDropDownList>                                             
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/Inside/category_inside_spacer.png" />
                                            <asp:Label ID="lblItemsPerPage" runat="server" meta:resourcekey="lblItemsPerPageResource1" Font-Bold="true"></asp:Label>
                                            <cc1:OboutDropDownList ID="cboItemsPerPage" runat="server"  OnSelectedIndexChanged="cboItemsPerPage_SelectedIndexChanged" AutoPostBack="true" FolderStyle="obout/Interface/styles/plain/OboutDropDownList" Width="40px" MenuWidth="100px"  >
                                            </cc1:OboutDropDownList> 
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Image ID="imgLine" runat="server" ImageUrl="~/Images2/Inside/category_inside_line.png" />
                                        </td>
                                    </tr>
                                </table>                                
                            </HeaderTemplate>
                            <ItemTemplate>    
                                <div style="margin: 5px 0px 5px 0px;">
                                    <div id="backgroundcategoryimage">                                 
                                        <asp:LinkButton ID="lnkBackGround" runat="server" CommandName="Select">
                                            <img src="Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  style='width:98px;' alt='Thumbnail of Photo Number <%# Eval("PhotoID") %>' />				                
                                        </asp:LinkButton>                                     
                                    </div>
                                    <div id="categorydescription">
                                        <asp:Label ID="lblCaption" runat="server" ><%# Eval("Caption") %><br/></asp:Label>                
                                        <asp:ImageButton ID="btnAddToFavorites" runat="server" meta:resourcekey="btnAddToFavoritesResource1" CommandName="AddToFavorites" />                                                                       
                                    </div>
                                </div>                            
                            </ItemTemplate>
                            <FooterStyle  />
                        </asp:DataList>                        
                        <div style="position:relative;bottom:175px;width:103px;left:470px;">		                    
                            <asp:ImageButton ID="cmdNext" runat="server" ImageUrl="~/Images2/Inside/nextpage_fr_off.jpg" OnClick="cmdNext_Click" />
	                    </div>
                    </div>  
                </div>  
                <div class="dragger_container">  
                    <div class="dragger">
                    </div>  
                </div>  
            </div>  
        </div> 
    </div>
    
    

    <script type="text/javascript">         
        /*var prm = Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequest4);
        function EndRequest4(sender, args) {              
            Init4();         
        }          
        
        function Init4(){              
            $('#mcs4_container').mCustomScrollbar('vertical',600,'easeOutCirc',1.05,'auto','yes','yes',10);
            $('#mcs3_container').mCustomScrollbar('vertical',600,'easeOutCirc',1.05,'auto','yes','yes',10);
        }                  
        $(window).load(Init4);        */
    </script> 