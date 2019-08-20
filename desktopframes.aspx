<%@ page language="VB" masterpagefile="~/Desktop.master" autoeventwireup="false" inherits="desktopframes, App_Web_-wqcg8fv" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/Desktop/Frames.ascx"  TagName="Frames" TagPrefix="ucFrames" %>
<%@ Register Src="~/Modules/Desktop/Favorites.ascx"  TagName="Favorites" TagPrefix="ucFavorites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    
    <div id="desktopcontent">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>                
                <ucFrames:Frames id="FramesDetails" runat="server" OnAddItemToFavoritesEvent="FramesDetails_AddItemToFavoritesEvent" OnFrameClickedEvent="FramesDetails_FrameClickedEvent" />                                    
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>        
    
    <div id="desktopsidebarright">
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>                
                <ucFavorites:Favorites id="FrameFavorites" runat="server" OnFavoriteClickedEvent="FrameFavorites_FavoriteClickedEvent" />                
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>        
</asp:Content>

