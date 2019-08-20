<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" smartnavigation="true" inherits="RendezVous_grille_journee, App_Web_hsfuruo7" title="Rendez-vous : Grille de la journée" stylesheettheme="White" enableEventValidation="false" %>
<%@ Register Namespace="Cameleo" TagPrefix="sc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <div id="home" class="page">
        <h3 style="text-align: center;">
            <asp:Literal ID="grille_journeeHeader" runat="server" Text="<%$ Resources: grille_journeeHeader  %>"></asp:Literal></h3>
        <hr />
        <asp:Label ID="lblDateText" runat="server" meta:resourcekey="lblDateTextResource1"></asp:Label>
        <asp:Label ID="lblDate" runat="server" Font-Bold="true"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblInstructions" runat="server" meta:resourcekey="lblInstructionsResource1"></asp:Label>
        <table>
            <tr>
                <td>
                    <div style="width: 400px; clear: both; margin-left: 20px">
                        <sc:ClickableGridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="false"
                            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="RendezVousID, estOccupe, Heure"
                            DataSourceID="SqlDataSource1" EnableRowClick="true" GridLines="Horizontal" OnRowClicked="GridView1_RowClicked"
                            PageSize="50" ShowHeader="False" Width="300px">
                            <RowStyle Font-Bold="True" />
                            <Columns>
                                <asp:BoundField DataField="RendezVousID" HeaderText="RendezVousID" Visible="False" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" Visible="False" />
                                <asp:BoundField DataField="Heure" DataFormatString="{0:HH:mm}" HeaderText="Heure" HtmlEncode="False" SortExpression="Heure" />
                                <asp:CheckBoxField DataField="estOccupe" HeaderText="estOccupe" SortExpression="estOccupe" Visible="False" />
                                <asp:BoundField DataField="Note" HeaderText="Note" Visible="false" />
                            </Columns>
                        </sc:ClickableGridView>
                        &nbsp;
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" CancelSelectOnNullParameter="false"
                            ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>" SelectCommand="CMRC_RendezVous_GetAllInfo"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ScheduleId" QueryStringField="scheduleId" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <br />
                    <asp:Label ID="lblModificationRendezVous" runat="server" Font-Bold="true" meta:resourcekey="lblModificationRendezVousResource1"
                        Visible="false"></asp:Label>
                   
                </td>
                <td style="vertical-align:top">                    
                    <table style="padding: 5px; width:180px; height: 70px; border-right: black 1px solid;
                        border-top: black 1px solid; border-left: black 1px solid; border-bottom: black 1px solid;">
                        <tr>
                            <th colspan=2>
                                <asp:Label ID="lblLegende" runat="server" Font-Underline="True" meta:resourcekey="lblLegendeResource1"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <td>                        
                                <asp:Label ID="lblVert" runat="server" ForeColor="#8CC63F" meta:resourcekey="lblVertResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblVert2" runat="server" ForeColor="#8CC63F" meta:resourcekey="lblVertResource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRouge" runat="server" ForeColor="#FF0010" meta:resourcekey="lblRougeResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblRouge2" runat="server" ForeColor="#FF0010" meta:resourcekey="lblRougeResource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBleu" runat="server" ForeColor="DodgerBlue" meta:resourcekey="lblBleuResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblBleu2" runat="server" ForeColor="DodgerBlue" meta:resourcekey="lblBleuResource2"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br /><br />
                    <asp:LinkButton ID="lnkReturnCalendar" runat="server" meta:resourcekey="lnkReturnCalendarResource1" PostBackUrl="calendrier.aspx"></asp:LinkButton>                                   
                    
                     <br />
                    <br />
                    <asp:Button ID="btnAccepterModif" runat="server" meta:resourcekey="btnAccepterModifResource1" Visible="false" />
                    <asp:Button ID="btnRefuserModif" runat="server" meta:resourcekey="btnRefuserModifResource1" Visible="false" />
                    <asp:Label ID="lblErrorSameDay" ForeColor="red" runat="server" meta:resourcekey="lblErrorSameDayResource1" Visible="false"></asp:Label><br />
                    <asp:Label ID="lblErrorNotAvailable" ForeColor="red" runat="server" meta:resourcekey="lblErrorNotAvailableResource1" Visible="false"></asp:Label><br />
                    <asp:Label ID="lblError" runat="server" ForeColor="red" meta:resourcekey="lblErrorResource1" Visible="false"></asp:Label>
                </td>
            </tr>
        </table>
             
        
        

        
</asp:Content>

