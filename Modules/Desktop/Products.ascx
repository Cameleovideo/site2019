<%@ control language="VB" autoeventwireup="false" inherits="Modules_Desktop_Products, App_Web_0t-wriki" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>    
     
     <div id="waitingdiv" style="visibility:hidden;display:none;z-index:1000;">
        <div style="background-color:White;width:125px;height:50px;margin:50px 50px 50px 50px;">
            <p style="text-align:center;">
                <asp:Label ID="lblWait" runat="server" meta:resourcekey="lblWaitResource1"></asp:Label>
                <asp:Image ID="imgWait" runat="server" ImageUrl="~/Images2/Lightbox/ajax-loader.gif" />
            </p>
        </div>
     </div>
     
    <div id="divProductCategories" runat="server">
        <div id="scrollcategories">
            <div class="customScrollBox">  
                <div class="container">  
                    <div class="content">  
                        <asp:DataList ID="lstCategories" runat="Server"	repeatdirection="Vertical" DataKeyField="CAtegoryID" OnItemDataBound="lstCategories_ItemDataBound" OnSelectedIndexChanged="lstCategories_SelectedIndexChanged">
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
                                                        <asp:Label ID="Label2" runat="server" ><%# Eval("CategoryName") %></asp:Label>            
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
                                                <asp:DataList ID="lstTopProducts" runat="Server" repeatdirection="Horizontal" RepeatColumns="5" DataKeyField="ProductID" OnItemDataBound="lstTopProducts_ItemDataBound" OnItemCommand="lstTopProducts_ItemCommand" >
                                                    <ItemStyle VerticalAlign="Top" />
                                                    <ItemTemplate>                                            
                                                        <div id="categoryimage">
                                                            <a href="#info<%#Eval("ProductID")%>" rel="facebox">
                                                                <img alt='Product Image - <%#Eval("ModelName")%>' src='images/productimages/<%#Eval("ProductImage")%>' class="thumbimage">
                                                            </a>
                                                        </div>                                                                
                                                        <div id="categorydescription">
                                                            <asp:Label ID="lblCaption" Font-Bold="true" runat="server"><%# Eval("ModelName") %><br /></asp:Label>
                                                            <asp:Label ID="lblUnitPrice" runat="server"><%#String.Format("   {0:c}", GetPrice(Eval("UnitCost"), Eval("ConfiguredUnitCost"), Eval("DiscountPercent")))%></asp:Label>
                                                        </div>                                                        
                                                        <div id="info<%#Eval("ProductID")%>" style="visibility:hidden;display:none;z-index:1000">
                                                            <div class="product">
                                                                <div id="productimage">
                                                                    <img alt='Product Image - <%#Eval("ModelName")%>' src='images/productimages/<%#Eval("ProductImage")%>' style="width:256px;height:256px;">                            
                                                                </div>
                                                                
                                                                <asp:UpdatePanel ID="pnlProductDescription2" runat="server" >
                                                                    <ContentTemplate>
                                                                        <div id="productdescription">
                                                                            <asp:Label id="lblProductID2" runat="server" Visible="False" Text='<%#Eval("ProductID")%>'></asp:Label>
                                                                            <div id="productmodelname">
                                                                                <%#Eval("ModelName")%>
                                                                            </div>
                                                                        
                                                                            <div id="productprice">
                                                                                <%#GetPrice(Eval("UnitCost"), Eval("ConfiguredUnitCost"), Eval("DiscountPercent"))%>                                                                                
                                                                            </div>
                                                                            
                                                                            <div id="productdetails">
                                                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_spacer.jpg" />
                                                                                <asp:Label ID="lblDescriptionHeader2" runat="server" Text="Description :" Font-Bold="true"  ></asp:Label>
                                                                                <br />
                                                                                <asp:Label ID="lblDescription2" runat="server" Font-Italic="true" ><%#Eval("Description")%></asp:Label>
                                                                                
                                                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_spacer.jpg" />
                                                                                
                                                                                <asp:Label ID="lblQuantity2" runat="server" meta:resourcekey="lblQuantityResource1" Font-Bold="true" ></asp:Label>
                                                                                <asp:TextBox ID="txtQuantity2" runat="server" Text="1" EnableViewState="true"></asp:TextBox>                                                                                
                                                                                
                                                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_spacer.jpg" />
                                                                                
                                                                                <asp:ImageButton ID="btnAddToCart2" runat="server" meta:resourcekey="btnAddToCartResource1" CommandName="AddToCart" />
                                                                            </div>
                                                                        </div>
                                                                        
                                                                        <div id="productfooter">
                                                                            <table width="100%" cellpadding="0" cellspacing="0" >
                                                                                <tr valign="middle">
                                                                                    <td align="left" style="width:100%">
                                                                                        <asp:ImageButton ID="btnAddToFavorites2" runat="server" meta:resourcekey="btnAddToFavoritesResource1" CommandName="AddToFavorites" />
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:Label ID="lblClose2" runat="server" meta:resourcekey="lblCloseResource1"></asp:Label>                                                                                        
                                                                                    </td>
                                                                                    <td align="right">                                                                                        
                                                                                        <asp:ImageButton ID="btnClose2" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_close_off.jpg" style="margin-left:3px;" />                                                                                        
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>                                           
                                                            </div>             
                                                        </div> 
                                                    </ItemTemplate>
                                                </asp:DataList>  
                                            </td>                                                      
                                            <td align="right">
                                                <div id="seeall">
                                                    <asp:ImageButton ID="btnAllProducts" runat="server" CommandName="Select" meta:resourcekey="btnAllProductsResource2" Visible="false"  />
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
    
    <div id="divAllProducts" runat="server" style="margin-left:25px;">
        <div id="divall">
            <div class="customScrollBox">  
                <div class="container">  
                    <div class="content">    
                        <asp:DataList ID="lstAllProducts" runat="Server" repeatdirection="Horizontal"  RepeatColumns="5" DataKeyField="ProductID" Visible="false" OnItemDataBound="lstAllProducts_ItemDataBound" OnItemCommand="lstAllProducts_ItemCommand">
                            <ItemStyle VerticalAlign="Top" />
                            <AlternatingItemStyle VerticalAlign="Top" />
                            <HeaderTemplate>                                                                                                
                                <table width="100%">
                                    <tr valign="middle">
                                        <td>
                                            <asp:LinkButton ID="btnBack" runat="server" meta:resourcekey="btnBackResource1" OnClick="btnBack_Click" Font-Underline="true"></asp:LinkButton>   >
                                            <asp:Image ID="imgSpacer" runat="server" ImageUrl="~/Images2/Inside/category_inside_triangle.png" />
                                            <asp:Label ID="lblCategory" runat="server" ForeColor="#00703C" Font-Bold="true"></asp:Label>                                
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
                                    <div id="categoryimage">
                                        <a href="#info<%#Eval("ProductID")%>" rel="facebox">
                                            <img alt='Product Image - <%#Eval("ModelName")%>' src='images/productimages/<%#Eval("ProductImage")%>' class="thumbimage">
                                        </a>
                                    </div>                                                                
                                    <div id="categorydescription">
                                        <asp:Label ID="lblCaption" Font-Bold="true" runat="server"><%# Eval("ModelName") %><br /></asp:Label>
                                        <asp:Label ID="lblUnitPrice" runat="server"><%#String.Format("   {0:c}", Eval("UnitCost"))%></asp:Label>
                                    </div> 
                                </div>
                                
                                <div id="info<%#Eval("ProductID")%>" style="visibility:hidden;display:none;z-index:1000">                                    
                                    <div class="product">
                                        <div id="productimage">
                                            <img alt='Product Image - <%#Eval("ModelName")%>' src='images/productimages/<%#Eval("ProductImage")%>' style="width:256px;height:256px;">                            
                                        </div>
                                        
                                        <asp:UpdatePanel ID="pnlProductDescription" runat="server" >
                                            <ContentTemplate>
                                                <div id="productdescription">
                                                    <asp:Label id="lblProductID" runat="server" Visible="False" Text='<%#Eval("ProductID")%>'></asp:Label>
                                                    <div id="productmodelname">
                                                        <%#Eval("ModelName")%>
                                                    </div>
                                                
                                                    <div id="productprice">
                                                        <%#GetPrice(Eval("UnitCost"), Eval("ConfiguredUnitCost"), Eval("DiscountPercent"))%>
                                                    </div>
                                                    
                                                    <div id="productdetails">
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_spacer.jpg" />
                                                        <asp:Label ID="lblDescriptionHeader" runat="server" Text="Description :" Font-Bold="true"  ></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lblDescription" runat="server" Font-Italic="true" ><%#Eval("Description")%></asp:Label>
                                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_spacer.jpg" />
                                                        
                                                        <asp:Label ID="lblQuantity" runat="server" meta:resourcekey="lblQuantityResource1" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtQuantity" runat="server" Text="1" EnableViewState="true"></asp:TextBox>
                                                        
                                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_spacer.jpg" />
                                                        
                                                        <asp:ImageButton ID="btnAddToCart" runat="server" meta:resourcekey="btnAddToCartResource1" CommandName="AddToCart" />
                                                    </div>
                                                </div>
                                                
                                                <div id="productfooter">
                                                    <table width="100%" cellpadding="0" cellspacing="0" >
                                                        <tr valign="middle">
                                                            <td align="left" style="width:100%">
                                                                <asp:ImageButton ID="btnAddToFavorites" runat="server" meta:resourcekey="btnAddToFavoritesResource1" CommandName="AddToFavorites" />
                                                            </td>
                                                            <td align="right">
                                                                <asp:Label ID="lblClose" runat="server" meta:resourcekey="lblCloseResource1"></asp:Label>                                                                                        
                                                            </td>
                                                            <td align="right">                                                                                        
                                                                <asp:ImageButton ID="btnClose" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_close_off.jpg" style="margin-left:3px;" />                                                                                        
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>                                           
                                    </div>            
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
    
    

    <script type="text/javascript">         
        /*var prm = Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequest7);
        function EndRequest7(sender, args) {              
            Init7();         
        }          
        
        function Init7(){              
            $('#mcs7_container').mCustomScrollbar('vertical',600,'easeOutCirc',1.05,'auto','yes','yes',10);
            $('#mcs6_container').mCustomScrollbar('vertical',600,'easeOutCirc',1.05,'auto','yes','yes',10);
        }                  
        $(window).load(Init7); */       
    </script> 