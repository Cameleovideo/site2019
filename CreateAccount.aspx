<%@ page language="VB" masterpagefile="~/CreateAccount.master" autoeventwireup="false" inherits="CreateAccount, App_Web_-wqcg8fv" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <div class="page" style="overflow:hidden;">
	    <div id="header">
            <asp:Label ID="lblCreateAccount" runat="server" Font-Bold="true" ForeColor="#00703C" meta:resourcekey="lblCreateAccountResource1"></asp:Label>	    
            <asp:Label ID="lblCreateAccount2" runat="server" Font-Bold="true" ForeColor="#8CC63F" meta:resourcekey="lblCreateAccount2Resource1"></asp:Label>	    
	    </div>	    
	    
	    <div id="createaccountleft" >
            <asp:Panel ID="pnlCreateAccount" runat="server" DefaultButton="btnCreateAccount">
            
	            <table width="100%">
		            <tr>
		                <td align="left">				                
		                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />                                
		                    <asp:label runat="server" id="lblEmail" meta:resourcekey="lblEmailResource1"></asp:label>							    
		                </td>
		                <td align="right">
		                    <a href="#help" rel="facebox">
                                <asp:ImageButton ID="btnHelp" runat="server" ImageUrl="~/Images2/Login/help_card_off.png" />
                            </a>
		                </td>
		            </tr>
		        </table>
    		    
		        <div id="help" style="visibility:hidden;display:none;z-index:1000;" >                        
                    <div id="loginmoreinfo" style="width:300px;height:100px;">
                        <table width="100%" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td>                                
                                    <h4>
                                        <asp:Label ID="lblNoEmail" runat="server" meta:resourcekey="lblNoEmailResource1"></asp:Label>
                                    </h4>
                                    <asp:Label ID="lblNoEmailAnswer" runat="server" meta:resourcekey="lblNoEmailAnswerResource1"></asp:Label>                                
                                </td>
                            </tr>
                            <tr valign="middle">                        
                                <td align="right">                                                                                       
                                    <br /><br /> 
                                    <asp:ImageButton ID="btnClose2" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_close_off.jpg" style="margin-left:3px;" />                                                                                        
                                </td>
                            </tr>
                        </table>            
                    </div>
                </div>
                
		        <asp:textbox runat="server"	id="txtEmail" cssclass="textbox" accesskey="u" TabIndex="1" Width="100%" />
		        <asp:requiredfieldvalidator	runat="server" id="rfvEmail" controltovalidate="txtEmail" validationgroup="vgCreateAccount" meta:resourcekey="rfvEmailResource1" ></asp:requiredfieldvalidator>
    		    
		        <br />						    							    
		        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />                                
		        <asp:label runat="server" id="lblPassword" meta:resourcekey="lblPasswordResource1"></asp:label>							    
		        <asp:textbox runat="server"	id="txtPassword" textmode="password" accesskey="p" TabIndex="2" Width="100%" />
		        <asp:requiredfieldvalidator	runat="server" id="rfvPassword" controltovalidate="txtPassword" validationgroup="vgCreateAccount" meta:resourcekey="rfvPasswordResource1" ></asp:requiredfieldvalidator>
		        <br />						    							    
		        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />                                
		        <asp:label runat="server" id="lblConfirmPassword" meta:resourcekey="lblConfirmPasswordResource1"></asp:label>							    
		        <asp:textbox runat="server"	id="txtConfirmPassword" textmode="password" TabIndex="3" Width="100%" />
		        <asp:requiredfieldvalidator	runat="server" id="rfvConfirmPassword" controltovalidate="txtConfirmPassword" validationgroup="vgCreateAccount" meta:resourcekey="rfvConfirmPasswordResource1" ></asp:requiredfieldvalidator>		    
		        <table width="100%">
		            <tr>
		                <td align="left">				                
		                </td>
		                <td align="right">
		                    <asp:imagebutton runat="server"	id="btnCreateAccount" meta:resourcekey="btnCreateAccountResource1" TabIndex="4" OnClick="btnCreateAccount_Click" validationgroup="vgCreateAccount" />
		                </td>
		            </tr>
		        </table>				    						    		    
		        <asp:label runat="server" id="txtResult" forecolor="red"></asp:label>	
		    </asp:Panel>			
		</div>
		
		<div id="createaccountright">
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
            <asp:Image ID="Image5" runat="server" ImageUrl="~/Images2/Login/spacer_question.png" />
            <br />
            <h4>
                <asp:Label ID="lblQuestion3" runat="server" meta:resourcekey="lblQuestion3Resource1"></asp:Label>
            </h4>
            <asp:Label ID="lblAnswer3" runat="server" meta:resourcekey="lblAnswer3Resource1"></asp:Label>           
            
		</div>
	</div>
</asp:Content>

