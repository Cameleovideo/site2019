<%@ page language="VB" inherits="Download_aspx, App_Web_uzpgk440" enableEventValidation="false" stylesheettheme="White" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
    <head id="Head1" runat="server">	
    </head>
        
    <body >        
        <form id="form1" runat="server">
            <div class="header">
                <asp:Image ID="Shop" runat="server" meta:resourcekey="ShopResource1" /> 
            </div>
        
            <div style="text-align:center;width:100%;">
		        <p>            
                    <a HREF="javascript:window.history.back(1)">
			             <asp:Image ID="imgReturn" runat="server" meta:resourcekey="imgReturnResource1" ImageUrl="Images/btn_return.gif" />
			        </a>           
		        </p>

                <asp:Panel ID="pnlDisclaimer" runat="server" Visible="false" Width="25%">        
                    <asp:Label ID="lblDisclaimer" runat="server" meta:resourcekey="lblDisclaimerResource1"></asp:Label>
                    <br /><br />            
                    <asp:LinkButton ID="btnConfirm" runat="server" meta:resourcekey="btnConfirmResource1" OnClick="btnConfirm_Click"></asp:LinkButton>
                    
                    <a HREF="javascript:window.history.back(1)">
                        <asp:Label ID="btnCancel" runat="server" meta:resourcekey="btnCancelResource1"></asp:Label>			    
			        </a>             
                </asp:Panel>        
        		
		        <asp:formview id="FormView1" runat="server" datasourceid="ObjectDataSource1" borderstyle="none" borderwidth="0" CellPadding="0" cellspacing="0"  DataKeyNames="PhotoID" OnDataBound="FormView1_DataBound" Width="100%"  >
			        <itemtemplate>
                        <asp:Panel ID="panelGranted" visible='<%# Eval("DigitalRights") %>' runat="server" >                
                            <asp:Literal ID="DownloadHeader" meta:resourcekey="DownloadHeaderResource1" runat="server"></asp:Literal><br /><br /><br />
                            <asp:Panel ID="pnlTradImage" runat="server" visible='<%# not Eval("IsGreenScreen") %>'>                
				                <img src="Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=O" alt='Photo Number <%# Eval("PhotoID") %>' style="height:400px;" />
				            </asp:Panel>
				            
				            <asp:Panel ID="pnlGreenScreenImage" runat="server" visible='<%# Eval("IsGreenScreen") %>'>                
                                <img id="imgSelectedPose" src='HandlerGreenScreen.ashx?PhotoID=<%# Eval("PhotoID") %>&BackdropPhotoID=<%# Cameleo.DesktopInfo.BackdropPhotoID %>&FramePhotoID=<%# Cameleo.DesktopInfo.FramePhotoID %>&Size=O' alt='<%# Eval("PhotoID") %>' style="height:400px;" />                
                            </asp:Panel>
				        </asp:Panel>
				        <asp:Panel ID="panelForbidden" visible='<%# not Eval("DigitalRights") %>' runat="server" >
				            <img src="Handler.ashx?Size=L" alt='Photo Number <%# Eval("PhotoID") %>' style="height:400px;" />
				        </asp:Panel>
	                </itemtemplate>
		        </asp:formview>

		        <asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="PhotoManager" 
			        SelectMethod="GetPhotos">
			        <SelectParameters>
				        <asp:Parameter Name="AlbumID" Type="Int32" DefaultValue="0"/>
			        </SelectParameters>
		        </asp:ObjectDataSource>

            </div>
        </form>
              
            
    </body>
</html>    
