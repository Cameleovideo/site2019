<%@ control language="vb" autoeventwireup="true" inherits="MiniBasket, App_Web_q91opoz6" %>
<asp:Panel ID=pnlCart runat=server>
    <h4><asp:literal ID="BasketHeader" runat="server" text="<%$ Resources: BasketHeader %>"></asp:literal></h4>
	<div class="textboxheader">
	    <img src="<%=Utility.GetSiteRoot()%>/images/icons/shopping_cart.gif" align=absmiddle/>&nbsp;
	    <a href="<%=Utility.GetSiteRoot()%>/basket.aspx">	        
	        <asp:literal ID="BasketLink" runat="server" text="<%$ Resources: BasketLink  %>"></asp:literal>
	    </a>
	</div>

	<div class="textbox">

		<asp:Repeater ID="dlBasket" Runat="server">
			<ItemTemplate>
			<div>
				(<%#Eval("quantity") %>)
			<%#Eval("modelName") %>
			</div>
			</ItemTemplate>
		</asp:Repeater>
		<div class=subtotal>
			<asp:Label runat="server" ID="lblTotal"></asp:Label>
		</div>
		<a href="<%=Utility.GetSiteRoot()%>/basket.aspx" class="checkout">
		    <asp:literal ID="CheckoutLink" runat="server" text="<%$ Resources: CheckoutLink %>"></asp:literal>
		</a>
	</div>
</asp:Panel>