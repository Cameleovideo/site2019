<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_client_details, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<%@ Register Src="~/Modules/Client.ascx" TagName="Client" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ClientLogs.ascx" TagName="ClientLogs" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ClientAddresses.ascx" TagName="ClientAddresses" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ClientContacts.ascx" TagName="ClientContacts" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ClientCreate.ascx" TagName="ClientCreate" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ClientSearch.ascx" TagName="ClientSearch" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ParentOrganization.ascx" TagName="ParentOrganization" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ClientContracts.ascx" TagName="ClientContract" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/Client/ClientContractItems.ascx" TagName="ClientContractItems" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 
    <asp:Panel runat="server" ID="panelHeader"  CssClass="accordionHeader2"  Height="40" >
        <table style="width:65%">
            <tr>
                <td style="width:175px">    
                    <table>
                        <tr >
                            <td style="vertical-align:middle">
                                <asp:ImageButton ID="btnHome" runat="server" ImageUrl="~/App_Themes/Admin/Images/home.gif" />
                            </td>
                            <td style="vertical-align:middle">
                                <asp:Label ID="lblHeader" runat="server" Text="Accueil" ></asp:Label>
                            </td>
                        </tr>
                    </table>                    
                </td>
                <td style="text-align:right;vertical-align:middle">
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="imgSearch" runat="server" ImageUrl="~/App_Themes/Admin/Images/search.gif"/>                
                            </td>
                            <td style="vertical-align:middle">
                                <asp:linkButton ID="btnSearchClient" CausesValidation="false" text="Rechercher" CssClass="accordionHeader2" runat="server" OnClick="btnSearchClient_Click" Font-Underline="false"/>
                            </td>
                            <td>
                                <asp:Image ID="imgCreateClient" runat="server" ImageUrl="~/App_Themes/Admin/Images/addclient.gif"/>                
                            </td>
                            <td style="vertical-align:middle">
                                <asp:linkButton ID="btnCreateClient" CausesValidation="false" text="Créer un client" CssClass="accordionHeader2" runat="server" OnClick="btnCreateClient_Click"  Font-Underline="false"/>
                            </td>
                            <td>
                                <asp:Image ID="imgAddParentOrg" runat="server" ImageUrl="~/App_Themes/Admin/Images/addorg.gif" Visible="false" />
                            </td>
                            <td style="vertical-align:middle">
                                <asp:linkButton ID="btnAddParentOrg" CausesValidation="false" text="Ajouter une organisation" CssClass="accordionHeader2" runat="server" OnClick="btnAddParentOrg_Click" Visible="false" Font-Underline="false"/>
                            </td>
                        </tr>
                    </table>
                </td>                
            </tr>
        </table>        
    </asp:Panel>
    
    <ajaxToolkit:RoundedCornersExtender ID="rceHeader" runat="server"
        TargetControlID="PanelHeader"
        Color="#00713d"
        Radius="8"        
        Corners="top" />
            
    <asp:Panel runat="server" ID="panelClientCreate" Visible="false" >
        <br />
        <uc2:ClientCreate id="ucClientCreate" runat="server" />
    </asp:Panel>    
            
    <asp:Panel runat="server" ID="panelClientSearch" Visible="false">
        <br />
        <uc2:ClientSearch id="ucClientSearch" runat="server" />
    </asp:Panel>
    
    
    <table>
        <tr>
            <td >
                <asp:Panel runat="server" ID="panel1" Width="350" >                
                <asp:Panel runat="server" ID="panelClientInfo" Width="350" >                
                    <asp:Panel runat="server" ID="panelClientInfoHeader" CssClass="accordionHeader" >
                        <div style="background-color: #8CC63F;">
                            <table >
                                <tr>
                                    <td align="left" >
                                        <asp:Label ID="Label1" runat="server" text="> Fiche Client"></asp:Label>
                                    </td>                                    
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="panelClientInfoContent" BorderWidth="1" BorderColor="#8CC63F" BackColor="white">
                        <uc2:Client id="ClientDetail" runat="server" />
                    </asp:Panel>
                    <ajaxToolkit:AlwaysVisibleControlExtender ID="aceClientInfo" runat="server"
                        TargetControlID="panelClientInfo"         
                        VerticalSide="Top"
                        VerticalOffset="150"
                        HorizontalSide="Left"
                        HorizontalOffset="29"
                        ScrollEffectDuration=".1"/>
                    <ajaxToolkit:RoundedCornersExtender ID="rcepanelClientInfoHeader" runat="server"
                        TargetControlID="panelClientInfoHeader"
                        Color="#8CC63F"
                        Radius="8"
                        Corners="top" />                                        
                </asp:Panel>
                </asp:Panel>                
                
                <asp:Panel runat="server" ID="panel2" Width="350" >                
                <asp:Panel runat="server" ID="panelContracts" Width="350" >                
                    <asp:Panel runat="server" ID="panelContractsHeader" CssClass="accordionHeader" >
                        <div style="background-color: #8CC63F;">
                            <table >
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label2" runat="server" Text="> Contrats" ForeColor="#00713d" Font-Bold="true"></asp:Label>
                                    </td>                                    
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="panelContractsContent" BorderWidth="1" BorderColor="#8CC63F" BackColor="white">
                        <uc2:ClientContract id="ucContracts" runat="server" />
                    </asp:Panel>
                    <ajaxToolkit:AlwaysVisibleControlExtender ID="aceContracts" runat="server"
                        TargetControlID="panelContracts"         
                        VerticalSide="Top"
                        VerticalOffset="440"
                        HorizontalSide="Left"
                        HorizontalOffset="29"
                        ScrollEffectDuration=".1"/>
                    <ajaxToolkit:RoundedCornersExtender ID="rceContractsHeader" runat="server"
                        TargetControlID="panelContractsHeader"
                        Color="#8CC63F"
                        Radius="8"
                        Corners="top" />                                        
                </asp:Panel>
                </asp:Panel>                
            </td>
            <td>                
                <uc2:ClientLogs id="ucClientLogs" runat="server"/>                                
                <uc2:ClientAddresses id="ucClientAddresses" runat="server"/>                                             
                <uc2:ClientContacts id="ucClientContacts" runat="server"/>
                <uc2:ParentOrganization id="ucParentOrganizations" runat="server" Visible="false"/>
                <uc2:ClientContractItems id="ucClientContractItems" runat="server"/>
                
                
                
            </td>
        </tr>
    </table>       
    
    

</asp:Content>

