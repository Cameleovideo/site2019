<%@ page language="vb" masterpagefile="~/General.master" autoeventwireup="true" inherits="MyOrders, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    
    <h3>
        <asp:label runat="server" meta:resourcekey="OrderHeaderResource1"></asp:label>
    </h3>    
    
    <asp:GridView ID="dgOrders" datakeynames="OrderID" Runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="dgOrders_SelectedIndexChanged">	            
        <EmptyDataTemplate>
            <asp:Label id="NoOrdersLabel" runat="server" meta:resourcekey="NoOrdersLabelResource1"></asp:Label>			        
        </EmptyDataTemplate>
        
        <headerstyle horizontalalign="center" />
        
        <Columns>			                                
            <asp:BoundField meta:resourcekey="OrderDateResource1" DataField="orderDate">
                <itemstyle width="250"></itemstyle>
            </asp:BoundField>
            <asp:BoundField meta:resourcekey="OrderIdResource1" DataField="OrderId">
                <itemstyle width="100"></itemstyle>
            </asp:BoundField>
            <asp:BoundField meta:resourcekey="OrderTotalResource1" DataField="OrderTotal" DataFormatString="{0:c}" htmlencode="false">
                <itemstyle width="150" horizontalalign="right"></itemstyle>
            </asp:BoundField>            
            <asp:commandfield showselectbutton="true"  buttontype="Link" meta:resourcekey="OrderDetailResource1" >
                <itemstyle width="100" horizontalalign="center"></itemstyle>
            </asp:commandfield>                    			        
	        
        </Columns>
    </asp:GridView>
    
</asp:Content>

