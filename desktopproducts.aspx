<%@ page language="VB" masterpagefile="~/Desktop.master" autoeventwireup="false" inherits="desktopproducts, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Desktop/Products.ascx"  TagName="Products" TagPrefix="ucProducts" %>
<%@ Register Src="~/Modules/Desktop/Favorites.ascx"  TagName="Favorites" TagPrefix="ucFavorites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <div id="desktopcontent">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>                
                <ucProducts:Products id="ProductsDetails" runat="server" OnAddItemToCartEvent="ProductsDetails_AddItemToCartEvent" OnAddItemToFavoritesEvent="ProductsDetails_AddItemToFavoritesEvent" />                    
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>        
    
    <div id="desktopsidebarright">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>                
                <ucFavorites:Favorites id="ProductFavorites" runat="server" OnFavoriteClickedEvent="ProductFavorites_FavoriteClickedEvent" />                    
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>        
</asp:Content>

