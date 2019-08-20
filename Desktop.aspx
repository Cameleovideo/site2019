<%@ page language="VB" masterpagefile="~/Desktop.master" autoeventwireup="false" inherits="Desktop, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Desktop/Backgrounds.ascx"  TagName="Backgrounds" TagPrefix="ucBackgrounds" %>
<%@ Register Src="~/Modules/Desktop/Favorites.ascx"  TagName="Favorites" TagPrefix="ucFavorites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <div id="desktopcontent">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <ucBackgrounds:Backgrounds id="BackgroundsDetails" runat="server" OnAddItemToFavoritesEvent="BackgroundsDetails_AddItemToFavoritesEvent" OnBackgroundClickedEvent="BackgroundsDetails_BackgroundClickedEvent"  />                                                    
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>        
    
    <div id="desktopsidebarright">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>
                <ucFavorites:Favorites id="BackgroundFavorites" runat="server" OnFavoriteClickedEvent="BackgroundFavorites_FavoriteClickedEvent" />                                                    
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>    
</asp:Content>

