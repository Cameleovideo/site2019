<%@ Control Language="vb" ClassName="WebUserControl_ascx" %>
	  <div id="menutext">
		  <ul>
			<asp:Repeater ID="rptMenu" DataSourceID="ObjectDataSource1" Runat="server">
				<ItemTemplate>
				<li><a href="<%=Utility.GetSiteRoot()%>/catalog.aspx?cid=<%# Eval("categoryID")%>&c=<%# Eval("categoryname")%>">
					<%#Eval("categoryname")%>
					</a></li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>        
	</div>
<asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="CatalogManager"
	SelectMethod="GetActiveCategories">
	
	<SelectParameters>	    
        <asp:ProfileParameter name="locale" PropertyName="PreferredCulture"/>
	</SelectParameters>
</asp:ObjectDataSource>

