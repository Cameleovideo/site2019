<%@ control language="VB" autoeventwireup="false" inherits="Modules_Desktop_DesktopBasket, App_Web_0t-wriki" %>

    <div id="desktopbasket">        
        <div id="leftcolumn">   
            <div id="yourcartimage">
                <asp:Image ID="imgYourCart" runat="server" meta:resourcekey="imgYourCartResource1" />         
                <asp:Label ID="lblItems" runat="server" meta:resourcekey="lblItemsResource1"></asp:Label>
                <asp:Label ID="lblItemsFrom" runat="server" Font-Bold="true" ></asp:Label>
                <asp:Label ID="lblTo" runat="server" meta:resourcekey="lblToResource1"></asp:Label>
                <asp:Label ID="lblTotalItems" runat="server" ></asp:Label>
            </div>
        </div>
        
        <div id="centercolumn">
            <div id="prevbutton">
                <asp:ImageButton id="cmdPrev" Runat="server" ImageUrl="~/Images2/Cart/cart_left_off.jpg" OnClick="cmdPrev_Click"/>
            </div>
            <div id="basketcontent">                  
                <asp:DataList ID="lstBasket" runat="Server" DataKeyField="BasketItemID" repeatColumns="7" repeatdirection="Horizontal" borderwidth="0" cellpadding="0" cellspacing="0" OnDeleteCommand="lstBasket_DeleteCommand" OnItemDataBound="lstBasket_ItemDataBound" Visible="false">                            
                    <ItemTemplate>                        
                        <table border="0" cellpadding="0px" cellspacing="0px" width="312px" >
                            <tr valign="middle">
                                <td >
                                    <asp:Image ID="imgProduct" runat="server" width="60px" />
                                </td>
                                <td>
                                    <asp:Image ID="imgPlus" runat="server" ImageUrl="~/Images2/Cart/cart_plus.jpg" />
                                </td>
                                <td >
                                    <asp:Image ID="imgPhoto" runat="server" width="60px" />
                                </td>
                                <td>
                                    <asp:Image ID="imgEqual" runat="server" ImageUrl="~/Images2/Cart/cart_equals.jpg" />
                                </td>
                                <td style="text-align:right;">
                                
                                    <asp:Label ID="lblModelName" runat="server" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblQuantity" runat="server" meta:resourcekey="lblQuantityResource1"></asp:Label>
                                    <asp:Label ID="lblQuantityValue" runat="server" ></asp:Label>
                                    <br />
                                    <asp:Label ID="lblProductSubTotal" runat="server" Font-Bold="true" ></asp:Label>
                                    <br />
                                    <asp:Image ID="imgGreenLine" runat="server" ImageUrl="~/Images2/Cart/cart_greenline.jpg" />
                                    <br />
                                    <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images2/Cart/cart_del_off.jpg" CommandName="delete" />
                                </td>  
                                <td>                                    
                                    <asp:Image ID="imgSpacer" runat="server" ImageUrl="~/Images2/Cart/cart_spacer.jpg" />
                                </td>                              
                            </tr>
                        </table>
                        
                    </ItemTemplate>        
                </asp:DataList>
                <asp:Label id="EmptyBasketLabel" runat="server" meta:resourcekey="EmptyBasketLabelResource1" Visible="false"></asp:Label>			        
            </div>
            <div id="nextbutton">
                <asp:ImageButton id="cmdNext" Runat="server" ImageUrl="~/Images2/Cart/cart_right_off.jpg" OnClick="cmdNext_Click"/>				    
            </div>            
        </div>
        
        <div id="rightcolumn">  
            <div id="description">
                <asp:Label ID="lblSubTotal" runat="server" meta:resourcekey="lblSubTotalResource1" Font-Size="13px" ForeColor="#00703C" ></asp:Label>          
                <asp:Label ID="lblSubTotalAmount" runat="server" Font-Bold="true" Font-Size="15px" ForeColor="#00703C"></asp:Label>
                <asp:Panel ID="pnlFreeShipping" runat="server">
                    <asp:Label ID="lblFreeShipping" runat="server" meta:resourcekey="lblFreeShippingResource1" Font-Italic="true" Font-Size="12px" ></asp:Label>
                    <asp:Label ID="lblFreeShippingAmount" runat="server" Font-Italic="true" Font-Size="12px"></asp:Label>
                    <asp:Label ID="lblFreeShiping2" runat="server" meta:resourcekey="lblFreeShippingResource2" Font-Italic="true" Font-Size="12px"></asp:Label>
                </asp:Panel>                
            </div>
            
            <div id="gotocart">
                <asp:ImageButton ID="btnGoToCart" runat="server" meta:resourcekey="btnGotoCartResource1" OnClick="btnGoToCart_Click" />
            </div>
        </div>
        
    </div>