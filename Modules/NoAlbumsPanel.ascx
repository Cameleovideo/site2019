<%@ control language="VB" autoeventwireup="false" inherits="Modules_NoAlbumsPanel, App_Web_q91opoz6" %>

    <asp:Panel ID="pnlEmpty" runat="server">
		<div >
		    <asp:Label id="EmptyBasketLabel" runat="server" meta:resourcekey="EmptyBasketLabelResource1"></asp:Label>
		    <br />            
            <asp:RequiredFieldValidator ID="req4" runat="server" ControlToValidate="txtEmail" Text="*" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" meta:resourcekey="revEmailResource1" ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="txtEmail" runat="server" width="100%"></asp:TextBox>            
            <asp:LinkButton ID="btnSaveEmail" runat="server" meta:resourcekey="btnSaveEmailResource1" OnClick="btnSaveEmail_Click" style="text-decoration:underline;"></asp:LinkButton>
            <br />
            <asp:Label ID="lblSuccess" ForeColor="red" runat="server" meta:resourcekey="lblSuccessResource1" Visible="false"></asp:Label>
            <asp:Label ID="lblError" ForeColor="red" runat="server" meta:resourcekey="lblErrorResource1" Visible="false"></asp:Label>
            <asp:HiddenField ID="UserName" runat="server" />
	    </div>	 
	</asp:Panel> 