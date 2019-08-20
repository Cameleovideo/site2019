<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="uqtr_Default, App_Web_tfojcnlv" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
   
    <div style="text-align:center;">
    
        <asp:loginview id="LoginArea" runat="server">
	        <AnonymousTemplate>
                <asp:Label ID="lblHome" runat="server" meta:resourcekey="lblHomeResource1"></asp:Label>
                <asp:HyperLink ID="lnkUQTR" NavigateUrl="~/Default.aspx" runat="server" meta:resourcekey="lnkUQTRResource1"></asp:HyperLink>
                <br /><br />
            </AnonymousTemplate>
        </asp:loginview>
        
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/UQTR_RVB.jpg" />
        <br /><br /><br/>    
        
        <asp:loginview id="Loginview1" runat="server">
	        <AnonymousTemplate>
                <table Width="100%">
                    <tr align="left">
                        <td style="width:35%;">
                            <asp:Label ID="lblFaculty" runat="server" meta:resourcekey="lblFacultyResource1"></asp:Label>                
                        </td>
                        <td>
                            <asp:DropDownList ID="lstFaculties" runat="server" Width="100%">
                                <asp:ListItem Value="UQTR 2010-2011" Text="(2011-06-18) - Collation des grades (UQTR)"></asp:ListItem>  
                                <asp:ListItem Value="UQTR 2010-2011" Text="(2011-06-17) - Collation des grades (UQTR)"></asp:ListItem>  
                                <asp:ListItem Value="UQTR 2009-2010" Text="(2010-06-19) - Collation des grades (UQTR)"></asp:ListItem>
                                <asp:ListItem Value="UQTR 2008-2009" Text="(2009-06-20) - Collation des grades (UQTR)"></asp:ListItem>                            
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr align="left">
                        <td>
                            <ajaxToolkit:Accordion ID="MyAccordion" runat="server" SelectedIndex="-1"
                                 ContentCssClass="accordionContent"
                                FadeTransitions="true" FramesPerSecond="40" TransitionDuration="200"
                                AutoSize="None" RequireOpenedPane="false" SuppressHeaderPostbacks="true">
                                <Panes>
                                    <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                                        <Header>
                                            <a href="" class="accordionLink">
                                                <asp:Label ID="lblID" runat="server" meta:resourcekey="lblIDResource1"></asp:Label>
                                            </a>
                                        </Header>
                                        <Content>                    
                                            <asp:Label ID="lblIDDescription" runat="server" meta:resourcekey="lblIDDescriptionResource1"></asp:Label>
                                        </Content>
                                    </ajaxToolkit:AccordionPane>                        
                                </Panes>
                            </ajaxToolkit:Accordion>
                                            
                        </td>
                        <td>
                            <asp:TextBox ID="txtStudentNumber" runat="server" Width="99%"></asp:TextBox>
                        </td>
                    </tr>             
                   
                    <tr>
                        <td colspan="2">
                            <asp:imagebutton runat="server"	id="LoginButton" meta:resourcekey="LoginButtonResource1" AlternateText="login"  CssClass="button" OnClick="LoginButton_Click"/>    
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <asp:Label ID="lblError" ForeColor="red" visible="false" runat="server" meta:resourcekey="lblErrorResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br /><br />
        
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblContact" runat="server" meta:resourcekey="lblLastContactResource1"></asp:Label>
                            <asp:HyperLink ID="lnkContact" NavigateUrl="~/Help/ContactUs.aspx" runat="server" meta:resourcekey="lnkContactResource1"></asp:HyperLink>
                        </td>
                    </tr>
                </table>            
                <br /><br />
            </AnonymousTemplate>
        </asp:loginview> 
    </div>      
    
</asp:Content>