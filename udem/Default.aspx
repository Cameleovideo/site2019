<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="udem_Default, App_Web_ivulio5h" title="Université de Montréal" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

    <div style="text-align:center;">    

        <asp:loginview id="LoginArea" runat="server">
	        <AnonymousTemplate>
                <asp:Label ID="lblHome" runat="server" meta:resourcekey="lblHomeResource1"></asp:Label>
                <asp:HyperLink ID="lnkUDEM" NavigateUrl="~/Default.aspx" runat="server" meta:resourcekey="lnkUDEMResource1"></asp:HyperLink>
                <br /><br />
            </AnonymousTemplate>
        </asp:loginview>
        
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/UdeM_RVB.gif" />
        <br /><br /><br/>    
        
        <asp:loginview id="Loginview1" runat="server">
	        <AnonymousTemplate>
                <table style="width:100%;">
                    <tr align="left">
                        <td style="width:35%;">
                            <asp:Label ID="lblFaculty" runat="server" meta:resourcekey="lblFacultyResource1"></asp:Label>                
                        </td>
                        <td>
                            <asp:DropDownList ID="lstFaculties" runat="server" Width="100%">                                                            
                                <asp:ListItem Value="AMEN 2010-2011" Text="(2010-11-05) - Collation des grades (Aménagement)"></asp:ListItem>
                                <asp:ListItem Value="SINF 2010-2011" Text="(2010-11-04) - Collation des grades (Soins infirmiers)"></asp:ListItem>
                                <asp:ListItem Value="KINE  2009-2010" Text="(2010-10-27) - Collation des grades (Kinésiologie)"></asp:ListItem>                         
                                <asp:ListItem Value="MUS 2010-2011" Text="(2010-10-22) - Collation des grades (Musique)"></asp:ListItem>
                                <asp:ListItem Value="PHARM 2009-2010" Text="(2010-10-15) - Collation des grades (Pharmacie)"></asp:ListItem>
                                <asp:ListItem Value="DROIT 2010-2011" Text="(2010-10-07) - Collation des grades (Droit)"></asp:ListItem>
                                <asp:ListItem Value="SCEDUC 2009-2010" Text="(2010-10-06) - Collation des grades (Sciences de l'éducation)"></asp:ListItem>
                                <asp:ListItem Value="MED 2009-2010" Text="(2010-06-23) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2009-2010" Text="(2010-06-22) - Collation des grades (Arts et sciences)"></asp:ListItem>
                                <asp:ListItem Value="MED 2009-2010" Text="(2010-06-21) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="MVET 2009-2010" Text="(2010-06-18) - Collation des grades (Médecine vétérinaire)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2009-2010" Text="(2010-06-17) - Collation des grades (Arts et sciences)"></asp:ListItem>
                                <asp:ListItem Value="MDENT 2009-2010" Text="(2010-06-16) - Collation des grades (Médecine dentaire)"></asp:ListItem>
                                <asp:ListItem Value="MED 2009-2010" Text="(2010-06-14) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="OPTO 2009-2010" Text="(2010-06-04) - Collation des grades (Optométrie)"></asp:ListItem>
                                <asp:ListItem Value="DOC 2009-2010" Text="(2010-05-28) - Collation des doctorats"></asp:ListItem>
                                <asp:ListItem Value="SINF 2009-2010" Text="(2009-11-05) - Collation des grades (Soins infirmiers)"></asp:ListItem>
                                <asp:ListItem Value="AMEN 2009-2010" Text="(2009-10-29) - Collation des grades (Aménagement)"></asp:ListItem>                          
                                <asp:ListItem Value="MUS 2009-2010" Text="(2009-10-16) - Collation des grades (Musique)"></asp:ListItem>
                                <asp:ListItem Value="DROIT 2009-2010" Text="(2009-10-15) - Collation des grades (Droit)"></asp:ListItem>
                                <asp:ListItem Value="PHARM 2008-2009" Text="(2009-10-09) - Collation des grades (Pharmacie)"></asp:ListItem>                        
                                <asp:ListItem Value="MED 2008-2009" Text="(2009-06-23) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="MED 2008-2009" Text="(2009-06-22) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="MVET 2008-2009" Text="(2009-06-19) - Collation des grades (Médecine vétérinaire)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2008-2009" Text="(2009-06-18) - Collation des grades (Arts et sciences)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2008-2009" Text="(2009-06-16) - Collation des grades (Arts et sciences)"></asp:ListItem>
                                <asp:ListItem Value="MED 2008-2009" Text="(2009-06-15) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="SCEDUC 2008-2009" Text="(2009-06-11) - Collation des grades (Sciences de l'éducation)"></asp:ListItem>
                                <asp:ListItem Value="OPTO 2008-2009" Text="(2009-06-05) - Collation des grades (Optométrie)"></asp:ListItem>
                                <asp:ListItem Value="MDENT 2008-2009" Text="(2009-06-04) - Collation des grades (Médecine dentaire)"></asp:ListItem>
                                <asp:ListItem Value="DOC 2008-2009" Text="(2009-05-29) - Collation des doctorats"></asp:ListItem>
                                <asp:ListItem Value="SINF 2008-2009" Text="(2008-11-14) - Collation des grades (Soins infirmiers)"></asp:ListItem>
                                <asp:ListItem Value="AMEN 2008-2009" Text="(2008-11-01) - Collation des grades (Aménagement)"></asp:ListItem>
                                <asp:ListItem Value="MUS 2008-2009" Text="(2008-10-17) - Collation des grades (Musique)"></asp:ListItem>
                                <asp:ListItem Value="THEO 2008-2009" Text="(2008-10-15) - Collation des grades (Théologie et sciences des religions)"></asp:ListItem>
                                <asp:ListItem Value="DROIT 2008-2009" Text="(2008-10-02) - Collation des grades (Droit)"></asp:ListItem>
                                <asp:ListItem Value="MED 2007-2008" Text="(2008-06-26) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="MVET 2007-2008" Text="(2008-06-20) - Collation des grades (Médecine vétérinaire)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2007-2008" Text="(2008-06-19) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="AETS 2007-2008" Text="(2008-06-18) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="AETS 2007-2008" Text="(2008-06-17) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="MED 2007-2008" Text="(2008-06-16) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2007-2008" Text="(2008-06-16) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="SCEDUC 2007-2008" Text="(2008-06-12) - Collation des grades (Sciences de l'éducation)"></asp:ListItem>
                                <asp:ListItem Value="KINE 2007-2008" Text="(2008-06-11) - Collation des grades (Kinésiologie)"></asp:ListItem>
                                <asp:ListItem Value="OPTO 2007-2008" Text="(2008-06-06) - Collation des grades (Optométrie)"></asp:ListItem>
                                <asp:ListItem Value="MDENT 2007-2008" Text="(2008-06-05) - Collation des grades (Médecine dentaire)"></asp:ListItem>                                             
                                <asp:ListItem Value="DOC 2007-2008" Text="(2008-05-30) - Collation des doctorats"></asp:ListItem>                        
                                <asp:ListItem Value="SINF 2007-2008" Text="(2007-11-09) - Collation des grades (Soins infirmiers)"></asp:ListItem>
                                <asp:ListItem Value="THEO 2007-2008" Text="(2007-10-17) - Collation des grades (Théologie et sciences des religions)"></asp:ListItem>
                                <asp:ListItem Value="AMEN 2007-2008" Text="(2007-10-13) - Collation des grades (Aménagement)"></asp:ListItem>
                                <asp:ListItem Value="MUS 2007-2008" Text="(2007-10-12) - Collation des grades (Musique)"></asp:ListItem>
                                <asp:ListItem Value="DROIT 2007-2008" Text="(2007-10-11) - Collation des grades (Droit)"></asp:ListItem>
                                <asp:ListItem Value="MED 2006-2007" Text="(2007-06-26) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="MVET 2006-2007" Text="(2007-06-22) - Collation des grades (Médecine vétérinaire)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2006-2007" Text="(2007-06-21) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="AETS 2006-2007" Text="(2007-06-20) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="AETS 2006-2007" Text="(2007-06-19) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="MED 2006-2007" Text="(2007-06-19) - Collation des grades (Médecine)"></asp:ListItem>
                                <asp:ListItem Value="AETS 2006-2007" Text="(2007-06-18) - Collation des grades (Arts et sciences)"></asp:ListItem>                     
                                <asp:ListItem Value="KINE 2006-2007" Text="(2007-06-13) - Collation des grades (Kinésiologie)"></asp:ListItem>
                                <asp:ListItem Value="SCEDUC 2006-2007" Text="(2007-06-12) - Collation des grades (Sciences de l'éducation)"></asp:ListItem>
                                <asp:ListItem Value="MDENT 2006-2007" Text="(2007-06-07) - Collation des grades (Médecine dentaire)"></asp:ListItem>                                             
                                <asp:ListItem Value="OPTO 2006-2007" Text="(2007-06-01) - Collation des grades (Optométrie)"></asp:ListItem>
                                <asp:ListItem Value="DOC 2006-2007" Text="(2007-05-25) - Collation des doctorats"></asp:ListItem>                                                                             
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
        
                <table >
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

