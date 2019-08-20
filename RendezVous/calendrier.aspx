<%@ page autoeventwireup="false" inherits="RendezVous_calendrier, App_Web_hsfuruo7" language="VB" masterpagefile="~/general.master" smartnavigation="true" stylesheettheme="White" title="Rendez-vous : Calendrier" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

    <div id="home" class="page">
        <h3 style="text-align: center;">
            <asp:Literal ID="calendrierHeader" runat="server" Text="<%$ Resources: calendrierHeader  %>"></asp:Literal></h3>
        <hr />
        
        <table>
            <tr>
                <td>
                    <asp:Calendar ID="Calendar" runat="server" BackColor="White" BorderColor="Black"
                        BorderStyle="Solid" CellSpacing="1" FirstDayOfWeek="Sunday" Font-Bold="True"
                        Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="292px" NextPrevFormat="ShortMonth"
                        OnDayRender="Calendar_DayRender" OnSelectionChanged="Calendar_SelectionChanged"
                        Style="color: green" Width="371px">
                        <TitleStyle BackColor="#8CC63F" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True"
                            Font-Size="12pt" ForeColor="White" Height="12pt" BorderColor="#27972D" />
                        <NextPrevStyle Font-Bold="False" Font-Size="Medium" Font-Underline="False" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <DayHeaderStyle BorderColor="Transparent" Font-Bold="True" Font-Size="8pt" ForeColor="#333333"
                            Height="8pt" Wrap="True" />
                        <DayStyle BackColor="#CCCCCC" VerticalAlign="Middle" />
                    </asp:Calendar>
                    <br />
                    <asp:Label ID="lblDateSelectionneText" runat="server" meta:resourcekey="lblDateSelectionneTextResource1"></asp:Label>
                    <asp:Label ID="lblDateSelectionne" runat="server"></asp:Label>
                    <asp:Label ID="lblErrorDate" runat="server" meta:resourcekey="lblErrorDateResource1"
                        Style="color: Red" Visible="false"></asp:Label>
                </td>
                <td style="vertical-align:top; margin-left:20">
                    <table>
                        <tr valign="top">
                            <td style="width: 75px">
                                <asp:Label ID="lblNomEventTitle" runat="server" meta:resourcekey="lblNomEventTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNomEvent" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td style="width: 75px">
                                <asp:Label ID="lblDescEventTitle" runat="server" meta:resourcekey="lblDescEventTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDescEvent" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br /><br />
                    <asp:Label ID="lblDateDisponible" runat="server" meta:resourcekey="lblDateDisponibleResource1"></asp:Label>
                    <br />
                    &nbsp; &nbsp;
                    <asp:Label ID="lblListeDate" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblDejaRendezVousText" runat="server" ForeColor="red" meta:resourcekey="lblDejaRendezVousTextResource1"></asp:Label>
                    <asp:Label ID="lblDejaRendezVousInfo" runat="server" ForeColor="red"></asp:Label>
                </td>
            </tr>
        </table>
        
        
    </div>
    
</asp:Content>


