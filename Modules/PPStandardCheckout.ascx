<%@ control language="vb" autoeventwireup="true" inherits="Modules_PPStandardCheckout, App_Web_q91opoz6" %>
    <asp:Panel ID="CCOnline" runat="server" >
        <div class=sectionheader>        
            <asp:Literal ID="CheckoutHeader" meta:resourcekey="CheckoutHeaderResource1" runat="server"></asp:Literal>
            <asp:Image ID="Image1" runat="server" ImageUrl="../Images/icons/icon_secure.gif" />
            <br /><br />
            <asp:Image ID="Image3" runat="server" ImageUrl="../Images/moneris_fr.jpg" />
        </div>
        
        <div class=plainbox>        
            <asp:Literal ID="CheckoutMessage" meta:resourcekey="CheckoutMessageResource1" runat="server"></asp:Literal>
            <br />
            <table id="tblDebit" runat="server" meta:resourcekey="tblDebitResource1">
                <tr valign="top">
                    <td>
                        <asp:Image ID="Image12" runat="server" meta:resourcekey="DebitLogoResource1"/>        
                    </td>
                    <td>
                        <asp:Literal ID="DebitMessage" meta:resourcekey="DebitMessageResource1" runat="server"></asp:Literal>
                    </td>
                </tr>
            </table><br />
            
        </div>
    </asp:Panel>
    
    
    <asp:Panel ID="CCTelephone" runat="server" Visible="false">
        <div class=sectionheader >        
            <asp:Literal ID="Literal1" meta:resourcekey="CheckoutHeaderResource1" runat="server"></asp:Literal>            
            <asp:Image ID="Image5" runat="server" ImageUrl="../Images/icons/icon_secure.gif" />
            <asp:Image ID="Image6" runat="server" ImageUrl="../Images/ccs.gif" />        
            <asp:Image ID="Image4" runat="server" ImageUrl="../Images/icons/telephone.gif" />
        </div>
        
        <div class=plainbox>        
            <asp:Literal meta:resourcekey="CheckoutMessageResource2" runat="server"></asp:Literal>            
        </div>
    </asp:Panel>
    
    <asp:Panel ID="Check" runat="server" Visible="false">
        <div class=sectionheader>        
            <asp:Literal ID="Literal2" meta:resourcekey="CheckoutHeaderResource1" runat="server"></asp:Literal>            
            <asp:Image ID="Image7" runat="server" ImageUrl="../Images/icons/icon_secure.gif" />            
            <asp:Image ID="Image9" runat="server" ImageUrl="../Images/icons/money.gif" />
        </div>
        
        <div class=plainbox>        
            <asp:Literal meta:resourcekey="CheckoutMessageResource3" runat="server"></asp:Literal>
        </div>
    </asp:Panel>   
    
    <asp:Panel ID="CashOnlytext" runat="server" Visible="false">
        <div class=sectionheader>        
            <asp:Literal ID="Literal4" meta:resourcekey="CheckoutHeaderResource1" runat="server"></asp:Literal>            
            <asp:Image ID="Image2" runat="server" ImageUrl="../Images/icons/icon_secure.gif" />            
            <asp:Image ID="Image8" runat="server" ImageUrl="../Images/icons/money.gif" />
        </div>
        
        <div class=plainbox>        
            <asp:Literal ID="Literal5" meta:resourcekey="CheckoutMessageResource4" runat="server"></asp:Literal>
        </div>
    </asp:Panel>
    
    
    <br />

    <asp:LinkButton id="btnContinue"  OnClick="btnContinue_Click" meta:resourcekey="btnContinueResource1" runat="server"></asp:LinkButton>
	<br />
	
	
