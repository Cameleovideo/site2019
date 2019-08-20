<%@ control language="VB" autoeventwireup="false" inherits="Modules_Desktop_MergeAccounts, App_Web_0t-wriki" %>
<%@ Register Src="~/Modules/NoAlbumsPanel.ascx" TagName="NoAlbumsPanel" TagPrefix="uc1" %>
    <asp:Panel ID="pnlMerge" runat="server" DefaultButton="btnMergeAccounts">    
        <table style="width: 100%;" id="tblMerge" runat="server"  >                      
            <tr>
                <td>
                    <h4>
                        <asp:literal ID="Literal1" meta:resourcekey="MergeAcountsHeaderResource1" runat="server"></asp:literal>
                    </h4> 
                    
                    <div>
                        <asp:literal ID="Literal2" meta:resourcekey="DescriptionResource1" runat="server"></asp:literal>         
                    </div>
                </td>
            </tr>
            <tr>                        
                <td>
                    <asp:Image runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />
                    <asp:literal ID="Literal4" meta:resourcekey="DestinationUserNameResource1" runat="server"></asp:literal>                                                    
                    <br />
                    <asp:textbox id="UserName" cssclass="textbox" width="100%" runat="server" autocomplete="off"></asp:textbox>
                    <asp:requiredfieldvalidator	runat="server" id="UserNameRequired" controltovalidate="UserName" >*</asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>                        
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />
                    <asp:literal ID="Literal5" meta:resourcekey="DestinationPasswordResource1" runat="server"></asp:literal>                            
                    <br />
                    <asp:textbox id="Password" cssclass="textbox" width="100%" textmode="Password" runat="server" autocomplete="off"></asp:textbox>
                    <asp:requiredfieldvalidator	runat="server" id="PasswordRequired" controltovalidate="Password">*</asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>
                <td style="color: red;">
                    <asp:Label ForeColor="red" id="errorMessage" runat="server"></asp:Label>
                </td>
            </tr>            
            <tr>
                <td>              
                    <table width="100%">
                        <tr valign="middle">
                            <td align="left">
                                <asp:LinkButton ID="btnLostAccount" runat="server" meta:resourcekey="btnLostAccountResource1" CausesValidation="false" OnClick="btnLostAccount_Click"></asp:LinkButton>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="btnMergeAccounts" runat="server" meta:resourcekey="btnMergeAccountsResource1" CausesValidation="true"  OnClick="btnMergeAccounts_Click" />                    
                            </td>
                        </tr>
                    </table>                                               
                </td>
            </tr>
            
            <tr id="trConfirm" runat="server" visible="false">
                <td >                
                    <asp:Label ID="lblConfirm"  ForeColor="red" runat="server" meta:resourcekey="lblConfirmResource1"></asp:Label><br />
                    <asp:Button ID="btnContinue" runat="server" Text="OK" onclick="btnContinue_Click" CausesValidation="false"/>
                    <asp:Button ID="btnCancel" runat="server" meta:resourcekey="btnCancelResource1" onclick="btnCancel_Click" CausesValidation="false"/>
                </td>
            </tr>
            <tr>
                <td>                                         
                    <asp:Image runat="server" ImageUrl="~/Images2/Albums/album_right_spacer.png" />   
                </td>
            </tr>                          
        </table>
    </asp:Panel>     
    
    <table style="width: 100%;" id="tblRegisterEmail" runat="server" visible="false">                      
        <tr>                        
            <td>
                <h4>
                    <asp:literal ID="Literal3" meta:resourcekey="MergeAcountsHeaderResource1" runat="server"></asp:literal>
                </h4>
                <uc1:NoAlbumsPanel id="NoAlbumsPanel1" runat="server" />    
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="btnReturn" runat="server" OnClick="btnReturn_Click" style="text-decoration:underline;" CausesValidation="false" meta:resourcekey="btnReturnResource1"></asp:LinkButton>
            </td>
        </tr>
    </table>
    
    
    <table style="width: 100%;" id="tblLostUserName" runat="server" visible="false">                      
        <tr>                        
            <td>
                <asp:panel ID="pnlUserNameRecovery" defaultbutton="btnHidden" runat="server" CssClass="pnlUserNameRecovery">
                    <h5>
                        <asp:Label ID="lblUserNameRecovery" runat="server" Text="<%$ Resources: lblUserNameRecoveryResource1.Text%>"></asp:Label>
                    </h5>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />
                    <asp:label runat="server" id="EmailLabel" CssClass="label" Text="<%$ Resources: PasswordRecovery2Resource1.EMailText%>"></asp:label>
                    <asp:textbox runat="server" id="txtEmail" cssclass="textbox"></asp:textbox>
                    <asp:requiredfieldvalidator validationgroup="PasswordRecovery2" runat="server" controltovalidate="txtEmail" id="EmailRequired">*</asp:requiredfieldvalidator>
                    <br />
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />
                    <asp:label runat="server" id="SubjectNameLabel" CssClass="label" Text="<%$ Resources: PasswordRecovery2Resource1.SubjectNameText%>"></asp:label>
                    <asp:textbox runat="server" id="txtSubjectName" cssclass="textbox"></asp:textbox>
                    <asp:requiredfieldvalidator validationgroup="PasswordRecovery2" runat="server" controltovalidate="txtSubjectName" id="SubjectNameRequired">*</asp:requiredfieldvalidator>
                    <br />
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />
                    <asp:label runat="server" id="EventLabel" CssClass="label" Text="<%$ Resources: PasswordRecovery2Resource1.EventText%>"></asp:label>                                
                    <asp:textbox runat="server" id="txtEvent" cssclass="textbox"></asp:textbox>
                    <asp:requiredfieldvalidator validationgroup="PasswordRecovery2" runat="server" controltovalidate="txtEvent" id="EventRequired">*</asp:requiredfieldvalidator>
                    <br />
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Images2/Albums/album_right_triangle.png" />
                    <asp:label runat="server" id="NotesLabel" CssClass="label" Text="<%$ Resources: PasswordRecovery2Resource1.NotesText%>"></asp:label>                                
                    <br />                    
                    <asp:textbox runat="server" id="txtNotes" cssclass="textbox"></asp:textbox>
                    <asp:requiredfieldvalidator validationgroup="PasswordRecovery2" runat="server" controltovalidate="txtNotes" id="Requiredfieldvalidator1">*</asp:requiredfieldvalidator>
                    <br />
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:Button ID="btnHidden" runat="server" OnClick="LostButton_Click" style="display:none;" />
                                <asp:linkbutton runat="server"	id="LostButton" meta:resourcekey="LostButtonResource1" OnClick="LostButton_Click" style="text-decoration:underline;" />
                            </td>
                            <td align="right">
                                <asp:linkbutton runat="server"	id="CancelButton" meta:resourcekey="CancelButtonResource1" OnClick="btnLostAccount_Click" style="text-decoration:underline;" />
                            </td>
                        </tr>                            
                    </table>                           
                    <asp:label runat="server" style="line-height:1;"  id="LostUserNameFailureText" enableviewstate="False" forecolor="red"></asp:label>
                </asp:panel> 
            </td>
        </tr>
    </table>
    
    <div id="moreinfo" class="moreinfo" runat="server">
        <asp:Image ID="imgMoreInfo" runat="server" meta:resourcekey="imgMoreInfoResource1" />
        <div id="moreinfobutton">
            <a href="#moreinfocontent" rel="facebox">
                <asp:ImageButton ID="btnMoreInfo" runat="server" meta:resourcekey="btnMoreInfoResource1" CausesValidation="false" />
            </a>
        </div>
        
        <div id="moreinfocontent" style="visibility:hidden;display:none;z-index:1000;" >                        
            <div id="loginmoreinfo" style="width:300px;height:220px;">
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
                        </td>
                    </tr>
                    <tr valign="middle">                        
                        <td align="right">                                                                                       
                            <br /><br /> 
                            <asp:ImageButton ID="btnClose2" runat="server" ImageUrl="~/Images2/Lightbox/lbprod_close_off.jpg" style="margin-left:3px;" CausesValidation="false" />
                        </td>
                    </tr>
                </table>            
            </div>
        </div>
    </div>
    
    