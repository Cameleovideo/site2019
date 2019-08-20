<%@ page language="VB" masterpagefile="~/General.master" autoeventwireup="false" inherits="CreateAccountReminder, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <div class="page" id="createaccountreminder" style="overflow:hidden;">
        <h3>
            <asp:Label ID="lblLoginHeader" runat="server" meta:resourcekey="lblLoginHeaderResource1"></asp:Label>
        </h3>
        <h4>
            <asp:Label ID="lblQuestion1" runat="server" meta:resourcekey="lblQuestion1Resource1"></asp:Label>
        </h4>
        <asp:Label ID="lblAnswer1" runat="server" meta:resourcekey="lblAnswer1Resource1"></asp:Label>
        <br /><br />
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images2/Login/spacer_question.png" />
        <br />
        <h4>
            <asp:Label ID="lblQuestion2" runat="server" meta:resourcekey="lblQuestion2Resource1"></asp:Label>
        </h4>
        <asp:Label ID="lblAnswer2" runat="server" meta:resourcekey="lblAnswer2Resource1"></asp:Label>
        <br /><br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/Login/spacer_question.png" />
        <br />
        <h4>
            <asp:Label ID="lblQuestion3" runat="server" meta:resourcekey="lblQuestion3Resource1"></asp:Label>
        </h4>
        <asp:Label ID="lblAnswer3" runat="server" meta:resourcekey="lblAnswer3Resource1"></asp:Label>
        
        <br /><br />
        <asp:HyperLink ID="lnkContinue" runat="server" meta:resourcekey="lnkContinueResource1" NavigateUrl="~/CreateAccount.aspx" style="text-decoration:underline;"></asp:HyperLink>
        
    </div>
</asp:Content>

