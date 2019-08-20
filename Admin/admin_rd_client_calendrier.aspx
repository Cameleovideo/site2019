<%@ page autoeventwireup="true" inherits="Admin_admin_client_rendezvous, App_Web_kw1ulmho" language="VB" masterpagefile="~/Admin/admin.master" smartnavigation="true" stylesheettheme="Admin" title="Client : Rendez-vous" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">

    <h1>Gestion des rendez-vous d'un client</h1>
    Sélectionner l'événement :
    <asp:DropDownList ID="EventDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="EventDDL_SelectedIndexChanged">
    </asp:DropDownList>
    <br /><br />
    Sélectionner le client :
    <asp:DropDownList ID="ClientDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ClientDDL_SelectedIndexChanged">
    </asp:DropDownList>
    <br /><br />
    Sélectionner la journée désirée : 
    <br /><br />
    <div style="height: 100%;">
        <div style="float: left; width: 425px; height: 100%; margin-left: 20px;">
            <asp:Calendar ID="Calendar" runat="server" BackColor="White" BorderColor="Black"
                BorderStyle="Solid" CellSpacing="1" FirstDayOfWeek="Sunday" Font-Bold="True"
                Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="292px" NextPrevFormat="ShortMonth"
                OnDayRender="Calendar_DayRender" OnSelectionChanged="Calendar_SelectionChanged" 
                Style="color: green" Width="371px">
                <TitleStyle BackColor="#8CC63F" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" BorderWidth="3px" VerticalAlign="Middle" BorderColor="#27972D" />
                <NextPrevStyle Font-Bold="False" Font-Size="Medium" Font-Underline="False" ForeColor="White" VerticalAlign="Middle" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <DayHeaderStyle BorderColor="Transparent" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" Wrap="True" />
                <DayStyle BackColor="#CCCCCC" verticalalign="Middle" />
                <SelectedDayStyle VerticalAlign="Middle" />
                <TodayDayStyle VerticalAlign="Middle" />
            </asp:Calendar>
            <br />            
            <asp:Label ID="lblErrorDate" runat="server" Font-Size="9pt" Style="color: Red" Visible="false">Date requise</asp:Label>
        </div>
        <div style="height: 100%; font-size: 9pt">
            Les dates des journées disponibles sont :
            <br />
            &nbsp; &nbsp;     
            <asp:Label ID="lblListeDate" runat="server" ></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblDejaRendezVousInfo" runat="server" ForeColor="red"></asp:Label>
            <asp:Button ID="btnCancelRendezVous" runat="server" Text="L'annuler" OnClick="btnCancelRendezVous_Click" />
        </div>
    </div>
    <br /><br />
    
</asp:Content>

