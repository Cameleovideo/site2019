<%@ page language="VB" masterpagefile="~/login.master" inherits="Default_aspx, App_Web_-wqcg8fv" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>        

<%@ Register Src="Modules/LoginWelcome.ascx" TagName="LoginWelcome" TagPrefix="ucLoginWelcome" %>
<asp:content id="Content1" contentplaceholderid="Main2" runat="server">

	<div class="page" style="overflow:hidden;">
	    <div id="loginheader">
            <asp:Label ID="lblLoginHeader" runat="server" Font-Italic="true" meta:resourcekey="lblLoginHeaderResource1"></asp:Label>	    
	    </div>
	    
	    <div id="loginheader2">
            <asp:Label ID="lblAccessAccount" runat="server" Font-Bold="true" ForeColor="#00703C" meta:resourcekey="lblAccessAccountResource1"></asp:Label>	    
            <asp:Label ID="lblAccessAccount2" runat="server" Font-Bold="true" ForeColor="#8CC63F" meta:resourcekey="lblAccessAccount2Resource1"></asp:Label>	    
	    </div>
	
	
		<div id="loginleft">	    				
			<asp:loginview id="LoginArea" runat="server"   >
				<AnonymousTemplate>
					<asp:login ID="Login1" runat="server" DisplayRememberMe="true" meta:resourcekey="Login1Resource1" OnLoggedIn="LoggedID" OnLoggingIn="LoggingIn">					    
						<layouttemplate>							
						    <asp:panel ID="Panel1" defaultbutton="LoginButton" runat="server" >
						        <h4><asp:literal ID="LoginHeader2" runat="server" text="<%$ Resources: LoginHeader2  %>"></asp:literal></h4>
						        <h5><asp:literal ID="LoginHeader" runat="server" text="<%$ Resources: LoginHeader  %>"></asp:literal></h5>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />                                
							    <asp:label runat="server" id="UserNameLabel" CssClass="label" associatedcontrolid="UserName" meta:resourcekey="EmailLabelResource1"></asp:label>							    
							    <asp:textbox runat="server"	id="UserName" cssclass="textbox" accesskey="u" TabIndex="1" Width="100%" />
							    <asp:requiredfieldvalidator	runat="server" id="UserNameRequired" controltovalidate="UserName" validationgroup="Login1" meta:resourcekey="UserNameRequiredResource1" >*</asp:requiredfieldvalidator>
							    <br />						    							    
							    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />                                
							    <asp:label runat="server" id="PasswordLabel" CssClass="label" associatedcontrolid="Password" meta:resourcekey="PasswordLabelResource1"></asp:label>							    
							    <asp:textbox runat="server"	id="password" textmode="password" cssclass="textbox" accesskey="p" TabIndex="2" Width="100%" />
							    <asp:requiredfieldvalidator	runat="server" id="PasswordRequired" controltovalidate="Password" validationgroup="Login1" meta:resourcekey="PasswordRequiredResource1" >*</asp:requiredfieldvalidator>
							    
							    <table width="100%" >
							        <tr>
							            <td align="left">
							                <asp:LinkButton ID="btnPwdRecovery" runat="server" OnClick="btnPwdRecovery_Click" Text="<%$ Resources: PasswordRecovery1Resource1.UserNameTitleText%>" style="text-decoration:underline;"></asp:LinkButton>
							            </td>
							            <td align="right">
							                <asp:imagebutton runat="server"	id="LoginButton" meta:resourcekey="LoginButtonResource1" CommandName="Login" AlternateText="login"  CssClass="button" TabIndex="3"/>
							            </td>
							        </tr>
							    </table>				    						    
							    
							    <asp:CheckBox ID="RememberMe" runat="server" meta:resourcekey="RememberMeResource1" />								        								
							    <asp:label runat="server" id="FailureText"	enableviewstate="False" forecolor="red"></asp:label>							    
							</asp:panel>							
						</layouttemplate>
					</asp:login>				
					
                    <asp:PasswordRecovery ID="PasswordRecovery1" Runat="server" meta:resourcekey="PasswordRecovery1Resource1" SubmitButtonType="Link" onsendingmail="PasswordRecovery1_SendingMail" Visible="false" CssClass="pnlUserNameRecovery" Width="100%">
                        <MailDefinition From="support@cameleophoto.com" Subject="<%$ Resources: PasswordRecovery1Resource1.Subject%>"/>
                        <usernametemplate>
                            <div class="login"> 
                                <asp:panel ID="Panel1" defaultbutton="ForgotButton" runat="server">                                                   
                                    <h4>
                                        <asp:Label ID="lblUserNameRecovery" runat="server" Text="<%$ Resources: lblUserNameRecoveryResource1.Text%>"></asp:Label>
                                    </h4>
                                    <asp:label runat="server" id="UserNameLabel" CssClass="label" Text="<%$ Resources: PasswordRecovery1Resource1.UserNameLabelText%>"></asp:label>                                
                                    <asp:textbox runat="server" id="UserName" cssclass="textbox"></asp:textbox>
                                    <asp:requiredfieldvalidator validationgroup="PasswordRecovery1" runat="server" controltovalidate="UserName" errormessage="User Name." id="UserNameRequired">*</asp:requiredfieldvalidator>                                                                        
                                    
                                    <table width="100%">
                                        <tr>
                                            <td align="left">
                                                <asp:LinkButton runat="server"	id="ForgotButton" commandname="Submit" meta:resourcekey="LostButtonResource1" style="text-decoration:underline;" />
                                            </td>
                                            <td align="right">
                                                <asp:linkbutton runat="server"	id="CancelButton" meta:resourcekey="CancelButtonResource1" OnClick="btnPwdRecovery_Click" style="text-decoration:underline;" />
                                            </td>
                                        </tr>                            
                                    </table>                           
                                    <asp:label runat="server" CssClass="label" id="FailureText" enableviewstate="False" forecolor="red"></asp:label>
                                </asp:panel>
                            </div>
                        </usernametemplate>
                    </asp:PasswordRecovery>                                     
				</anonymoustemplate>				
			</asp:loginview>		
		</div>
		
		<div id="loginright">
		    <asp:loginview id="LoginArea2" runat="server" >
				<AnonymousTemplate>						                       
                    <h5>
                        <asp:Label ID="lblNoAccountResource1" runat="server" Font-Bold="true" text="<%$ Resources: lblNoAccountResource1.Text  %>"></asp:Label>
                        <br />
                        <asp:ImageButton ID="btnCreateAccount" runat="server" meta:resourcekey="btnCreateAccountResource1" OnClick="btnCreateAccount_Click" />
                    </h5>
                    
                    <div style="position:relative;margin:20px 0 0 3px;">
                        <asp:Image ID="imgCardbox" runat="server" meta:resourcekey="imgCardboxResource1" />
                    </div>
                    <div style="position:absolute;bottom: -5px;left: 120px;">
                        <a href="#moreinfo" rel="facebox">
                            <asp:ImageButton ID="btnMore" meta:resourcekey="btnMoreResource1" runat="server" />    
                        </a>                        
                    </div>
				</anonymoustemplate>				
			</asp:loginview>
		</div>           
        
        <div id="moreinfo" style="visibility:hidden;display:none;z-index:1000;" >                        
            <div id="loginmoreinfo">
                <table width="100%" cellpadding="0" cellspacing="0" >
                    <tr>
                        <td>
                            <h4>
                                <asp:Label ID="lblMoreInfoHeader" runat="server" meta:resourcekey="lblMoreInfoResource1" Font-Bold="true"></asp:Label>
                            </h4>                            
                            <h4>
                                <asp:Label ID="lblQuestion1" runat="server" meta:resourcekey="lblQuestion1Resource1"></asp:Label>
                            </h4>
                            <asp:Label ID="lblAnswer1" runat="server" meta:resourcekey="lblAnswer1Resource1"></asp:Label>
                            <br />
                            <h4>
                                <asp:Label ID="lblQuestion2" runat="server" meta:resourcekey="lblQuestion2Resource1"></asp:Label>
                            </h4>
                            <asp:Label ID="lblAnswer2" runat="server" meta:resourcekey="lblAnswer2Resource1"></asp:Label>
                            <br />
                            <h4>
                                <asp:Label ID="lblQuestion3" runat="server" meta:resourcekey="lblQuestion3Resource1"></asp:Label>
                            </h4>
                            <asp:Label ID="lblAnswer3" runat="server" meta:resourcekey="lblAnswer3Resource1"></asp:Label>
                            <br />
                            <h4>
                                <asp:Label ID="lblQuestion4" runat="server" meta:resourcekey="lblQuestion4Resource1"></asp:Label>
                            </h4>
                            <asp:Label ID="lblAnswer4" runat="server" meta:resourcekey="lblAnswer4Resource1"></asp:Label>
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
		
        
		<br style="clear:both;" />
		
		<div id="graduationheader" class="graduationheader" runat="server" meta:resourcekey="btnGraduationResource1" >		    
            <asp:Label ID="lblGraduationHeader" runat="server" Font-Bold="true" ForeColor="#00703C" meta:resourcekey="lblGraduationHeaderResource1"></asp:Label>
            <asp:Label ID="lblGraduationHeader2" runat="server" Font-Bold="true" ForeColor="#8CC63F" meta:resourcekey="lblGraduationHeader2Resource1"></asp:Label>		    
		</div>
		
		<br style="clear:both;" />
		
		<div id="graduation" class="graduation" runat="server" meta:resourcekey="btnGraduationResource1" >
	        <cc1:OboutDropDownList ID="cboGraduations" runat="server"  OnSelectedIndexChanged="cboGraduations_SelectedIndexChanged" AutoPostBack="true" FolderStyle="obout/Interface/styles/grand_gray/OboutDropDownList" Width="100%">		        
            </cc1:OboutDropDownList>		                    
		</div>
		
		<br style="clear:both;" />
		
		<div id="appointmentheader" class="appointmentheader" runat="server" meta:resourcekey="lnkRendezVousResource1">		    
            <asp:Label ID="lblAppointmentHeader" runat="server" Font-Bold="true" ForeColor="#00703C" meta:resourcekey="lblAppointmentHeaderResource1"></asp:Label>
            <asp:Label ID="lblAppointmentHeader2" runat="server" Font-Bold="true" ForeColor="#8CC63F" meta:resourcekey="lblAppointmentHeader2Resource1"></asp:Label>		    
            <asp:Label ID="lblAppointmentHeader3" runat="server" Font-Bold="true" ForeColor="#00703C" meta:resourcekey="lblAppointmentHeader3Resource1"></asp:Label>
		</div>	
		
		<br style="clear:both;" />
		
		<div id="appointment" class="appointment" runat="server" meta:resourcekey="lnkRendezVousResource1">
            <asp:ImageButton ID="lnkRendezVous" runat="server" PostBackUrl="~/RendezVous/CreerCompte.aspx" meta:resourcekey="lnkRendezVousResource1" />            
		</div>		
		

        <div id="board">
            <asp:Image ID="imgBoard" runat="server" meta:resourcekey="imgBoardResource1" />
        </div>		
	</div>
    
	<script language="javascript" type="text/javascript">
	    if(document.aspnetForm.ctl00_Main_LoginArea_Login1_UserName != null)
	    {
            document.aspnetForm.ctl00_Main_LoginArea_Login1_UserName.focus();
        }
    </script>
</asp:content>

