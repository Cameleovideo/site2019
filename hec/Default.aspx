<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="hec_Default, App_Web_0yqlzapp" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

    <div style="text-align:center;">
       
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/HEC_RVB.gif" />
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
                                <asp:ListItem Value="HEC 2010-2011"  meta:resourcekey="EventResource1"></asp:ListItem> 
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
                    <tr>
                        <td colspan="2" >
                            <asp:Image ID="imgMarasport" runat="server" meta:resourcekey="imgMarasportResource1" />
                        </td>
                    </tr>
                </table>
                <br /><br />
        
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblContact" runat="server" meta:resourcekey="lblLastContactResource1"></asp:Label>                            
                        </td>
                    </tr>
                </table>            
                <br /><br />
            </AnonymousTemplate>
        </asp:loginview>   
    </div>

</asp:Content>
