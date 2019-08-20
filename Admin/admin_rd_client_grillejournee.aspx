<%@ page autoeventwireup="true" inherits="Admin_admin_client_grillejournee, App_Web_kw1ulmho" smartnavigation="true" language="VB" masterpagefile="~/Admin/admin.master" stylesheettheme="Admin" title="Grille de la journée" enableEventValidation="false" %>
<%@ Register Namespace="Cameleo" TagPrefix="sc" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="AdminPlaceHolder" >
    
    <h1>Grille de la journée</h1>
    Date du rendez-vous : <asp:Label ID="lblDate" runat="server" Font-Bold="true"></asp:Label>
    <br /><br />
    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Width="300"></asp:TextBox>
    <br /><br />
    Sélectionner l'heure du rendez-vous :
    <br /><br />
    <div style="height: 100%;">
        <div style="float: left; width: 425px; height: 100%; margin-left: 20px">
            <sc:ClickableGridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="false"
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" DataKeyNames="RendezVousID, estOccupe, Heure"
                DataSourceID="SqlDataSource1" EnableRowClick="true" GridLines="Horizontal" OnRowClicked="GridView1_RowClicked"
                PageSize="50" ShowHeader="False" Width="300px">
                <RowStyle Font-Bold="True" />
                <Columns>
                    <asp:BoundField DataField="RendezVousID" HeaderText="RendezVousID" Visible="False" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" Visible="False" />
                    <asp:BoundField DataField="Heure" DataFormatString="{0:HH:mm}" HeaderText="Heure" HtmlEncode="False" SortExpression="Heure"/>
                    <asp:CheckBoxField DataField="estOccupe" HeaderText="estOccupe" SortExpression="estOccupe" Visible="False" />
                    <asp:BoundField DataField="Note" HeaderText="Note" Visible="false" />
                </Columns>
            </sc:ClickableGridView>
            &nbsp;
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" CancelSelectOnNullParameter="false"
                ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>" 
                SelectCommand="CMRC_RendezVous_GetAllInfo" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ScheduleId" QueryStringField="scheduleId" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div style="height: 100%; font-size: 9pt">
            <asp:LinkButton ID="lnkReturnCalendar" runat="server" PostBackUrl="~/Admin/admin_rd_client_calendrier.aspx">Retourner au calendrier</asp:LinkButton><br />
            <asp:Label ID="lblErrorSameDay" ForeColor="red" runat="server" text="Impossible de prendre un rendez-vous la journée même ou dans le passé" Visible="false"></asp:Label><br />
    <asp:Label ID="lblErrorNotAvailable" ForeColor="red" runat="server" text="Non disponible, choisissez une autre heure" Visible="false"></asp:Label><br />
        </div>    
    </div>
    
    <asp:Label ID="lblModificationRendezVous" runat="server" Font-Bold="true" Visible="false">Voulez-vous vraiment annuler votre rendez-vous précédent et le remplacer par celui-ci ?</asp:Label>
    <br /><br />
    <asp:Button ID="btnAccepterModif" runat="server" Text="Accepter" Visible="false" OnClick="btnAccepterModif_Click"/>
    <asp:Button ID="btnRefuserModif" runat="server" Text="Refuser" Visible="false" onclick="btnRefuserModif_Click"/>
    
    
</asp:Content>

