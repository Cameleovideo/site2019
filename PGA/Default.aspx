<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="PGA_Default, App_Web_8catrxcp" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/LoginWelcome.ascx" TagName="LoginWelcome" TagPrefix="ucLoginWelcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server"> 
    
    <div class="page" >
		<div id="sidebar">
			<asp:loginview id="LoginArea" runat="server">
				<AnonymousTemplate>
					<asp:login id="Login1" meta:resourcekey="Login1Resource1" runat="server" OnLoggedIn="LoggedID"  OnLoggingIn="LoggingIn" DisplayRememberMe="false" >					    
						<layouttemplate>
							<div class="login">
							    <h4><asp:literal ID="LoginHeader" runat="server" text="<%$ Resources: LoginHeader  %>"></asp:literal></h4>
								<asp:label runat="server" id="UserNameLabel" CssClass="label" associatedcontrolid="UserName" meta:resourcekey="UserNameLabelResource1"></asp:label>
								<asp:textbox runat="server"	id="UserName" cssclass="textbox" accesskey="u" TabIndex="1"/>
								<asp:requiredfieldvalidator	runat="server" id="UserNameRequired" controltovalidate="UserName" validationgroup="Login1" meta:resourcekey="UserNameRequiredResource1" >*</asp:requiredfieldvalidator>
								<asp:label runat="server" id="PasswordLabel" CssClass="label" associatedcontrolid="Password" meta:resourcekey="PasswordLabelResource1"></asp:label>
								<asp:textbox runat="server"	id="Password" textmode="Password" cssclass="textbox" accesskey="p" TabIndex="2"/>
								<asp:requiredfieldvalidator	runat="server" id="PasswordRequired" controltovalidate="Password" validationgroup="Login1" meta:resourcekey="PasswordRequiredResource1" >*</asp:requiredfieldvalidator>
								
								<asp:imagebutton runat="server"	id="LoginButton" meta:resourcekey="LoginButtonResource1" CommandName="Login" AlternateText="login"  CssClass="button" TabIndex="3"/>
								<asp:label runat="server" id="FailureText"	enableviewstate="False" forecolor="red"></asp:label>
							</div>							
						</layouttemplate>
					</asp:login>
					<hr />					
                   
					<asp:PasswordRecovery ID="PasswordRecovery1" Runat="server" meta:resourcekey="PasswordRecovery1Resource1" SubmitButtonType="Link" onsendingmail="PasswordRecovery1_SendingMail">
                        <MailDefinition From="support@cameleophoto.com" Subject="<%$ Resources: PasswordRecovery1Resource1.Subject%>"/>
                        <usernametemplate>
                            <div class="login">
                                <h4><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: PasswordRecovery1Resource1.UserNameTitleText%>"></asp:Literal></h4>
                                <asp:label runat="server" id="UserNameLabel" CssClass="label" Text="<%$ Resources: PasswordRecovery1Resource1.UserNameLabelText%>"></asp:label>                                
                                <asp:textbox runat="server" id="UserName" cssclass="textbox"></asp:textbox>
                                <asp:requiredfieldvalidator validationgroup="PasswordRecovery1" runat="server" controltovalidate="UserName" errormessage="User Name." id="UserNameRequired">*</asp:requiredfieldvalidator>
                                <div>
                                    <asp:imagebutton runat="server"	id="ForgotButton" commandname="Submit" meta:resourcekey="ForgotButtonResource1" CssClass="button"/>
                                </div>
                                <asp:label runat="server" CssClass="label" id="FailureText" enableviewstate="False" forecolor="red"></asp:label>
                            </div>
                        </usernametemplate>
                    </asp:PasswordRecovery>                   
                    <hr />                    
                    <asp:Image ID="imgVisa" runat="server" imageurl="~/Images/Visa.gif" Width="75px" />                      
                    <asp:Image ID="imgMC" runat="server" imageurl="~/Images/MC.gif" Width="75px" />                    
                    <asp:HyperLink ID="lnkInterac" runat="server" href="#" meta:resourcekey="INTERACResource1">
                        <asp:Image ID="imgInterac" runat="server" meta:resourcekey="INTERACResource1" />                                                            
                    </asp:HyperLink>
                    <br /><br />
                    <asp:Label ID="lblCheck" runat="server" meta:resourcekey="lblCheckResource1"></asp:Label>                      
				</anonymoustemplate>
				
				<LoggedInTemplate>
					<h4>
					    <ucLoginWelcome:LoginWelcome ID="LoginWelcome1" runat="server" />					    					 
					    <hr />
					</h4>				
			       
			        <table width="80" border="0" cellpadding="2" cellspacing="0" title="Click to Verify - This site chose Thawte SSL for secure e-commerce and confidential communications.">
                        <tr>
                            <td width="80" align="center" valign="top">
                                <script type="text/javascript" src="https://seal.thawte.com/getthawteseal?host_name=album.cameleophoto.com&amp;size=S&amp;lang=fr"></script>
                            </td>
                        </tr>
                        <tr>
                            <td  align="center" valign="top">
                                <a href="http://www.thawte.com/digital-certificates/" target="_blank" style="color:#000000; text-decoration:none; font:bold 10px arial,sans-serif; text-align:center; margin:0px; padding:0px;">&#192; propos des certificats SSL</a>
                            </td>
                            <td width="155">&nbsp;</td>
                        </tr>
                    </table>
			        
				</LoggedInTemplate>
			</asp:loginview>			
		</div>
		
		<div id="content">
		    <table>
		        <tr>
		            <td>
		                <h3 style="text-align:left">
			                <asp:ImageButton ID="lnkPGA" runat="server" ImageUrl="~/Images/PGA.png" meta:resourcekey="lnkPGAResource1" BorderColor="black" BorderWidth="10px" /> 
                        </h3>
		            </td>
		            <td>		                
		            </td>
		        </tr>
		        <tr>
		            <td colspan="2">
                        
		            </td>
		        </tr>
		        <tr>
		            <td colspan="2">
		                <asp:Panel ID="pnlCaptureAction" runat="server" Visible="false" >
                            <br />    
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblCaptureActionHeader" runat="server" meta:resourcekey="lblCaptureActionHeaderResource1"></asp:Label>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEmail" runat="server" meta:resourcekey="lblEmailResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" meta:resourcekey="rfvEmailResource1" />
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" meta:resourcekey="revEmailResource1"  ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>                            
                                        <asp:Label ID="lblLastName" runat="server" meta:resourcekey="lblLastNameResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" meta:resourcekey="rfvLastNameResource1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFirstName" runat="server" meta:resourcekey="lblFirstNameResource1"></asp:Label>                            
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" meta:resourcekey="rfvFirstNameResource1" />
                                    </td>
                                </tr>                                         
                                <tr>
                                    <td>                            
                                        <asp:ImageButton ID="btnSave" runat="server" meta:resourcekey="btnSaveResource1" OnClick="btnSave_Click" />
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnCancel" runat="server" meta:resourcekey="btnCancelResource1" OnClick="btnCancel_Click" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>        
                        </asp:Panel>
		            </td>
		        </tr>                   
            </table>         
                
            <table>                
                <asp:loginview id="LoginArea2" runat="server">
				    <AnonymousTemplate>
				      <tr>
                            <td>
                                
                                <br />
                                <table width="80" border="0" cellpadding="2" cellspacing="0" title="Click to Verify - This site chose Thawte SSL for secure e-commerce and confidential communications.">
                                    <tr>
                                        <td width="80" align="center" valign="top">
                                            <script type="text/javascript" src="https://seal.thawte.com/getthawteseal?host_name=album.cameleophoto.com&amp;size=S&amp;lang=fr"></script>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  align="center" valign="top">
                                            <a href="http://www.thawte.com/digital-certificates/" target="_blank" style="color:#000000; text-decoration:none; font:bold 10px arial,sans-serif; text-align:center; margin:0px; padding:0px;">&#192; propos des certificats SSL</a>
                                        </td>
                                        <td width="155">&nbsp;</td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
				    </AnonymousTemplate>
			    </asp:loginview> 
			    
			    
            </table>			
		</div>
	</div>
    
    <script language="javascript" type="text/javascript">
	    if(document.aspnetForm.ctl00_Main_LoginArea_Login1_UserName != null)
	    {
            document.aspnetForm.ctl00_Main_LoginArea_Login1_UserName.focus();
        }
    </script>
</asp:Content>