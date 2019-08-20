<%@ page autoeventwireup="false" inherits="Admin_admin_horaire_details, App_Web_kw1ulmho" language="VB" masterpagefile="~/Admin/admin.master" smartnavigation="true" stylesheettheme="Admin" title="Horaire details" enableEventValidation="false" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="AdminPlaceHolder">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <h1>Détails de l'horaire</h1>
    <div style="width: 100%;">
        <div style="float: left; width: 30%;">
            Pour la journée du <asp:Label ID="lblDate" runat="server"></asp:Label>
        </div>
        <div style="float: right; padding-right:20px">
            <input type="button" value="Rapport imprimable" onclick="imprime_zone('Rapport', 'zoneaimprimer');"/>   
        </div>
    </div> 
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="false" AutoGenerateEditButton="True" DataKeyNames="RendezVousID"
        DataSourceID="SqlDataSource1" PageSize="200"
        OnRowEditing="GridView1_RowEditing">
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField DataField="RendezVousID" HeaderText="RendezVousID" Visible="false" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"/>
            <asp:BoundField DataField="lastName" HeaderText="Nom" SortExpression="lastName"/>
            <asp:BoundField DataField="firstName" HeaderText="Prenom" SortExpression="firstName"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>
            <asp:BoundField DataField="Heure" DataFormatString="{0:HH:mm}" HeaderText="Heure" HtmlEncode="False" SortExpression="Heure" />
            <asp:CheckBoxField DataField="estOccupe" HeaderText="estOccupe"  SortExpression="estOccupe" />
            <asp:BoundField DataField="Note" HeaderText="Note" />
            <asp:BoundField DataField="SittingFee" HeaderText="SittingFee" />            
            <asp:CheckBoxField DataField="SittingFeePaid" HeaderText="Paid" SortExpression="SittingFeePaid" />
            <asp:CheckBoxField DataField="SittingFeeRebateApplied" HeaderText="RebateApplied" SortExpression="SittingFeeRebateApplied" />
            <asp:CheckBoxField DataField="SittingFeePaidOnline" HeaderText="PaidOnline" SortExpression="SittingFeePaidOnline" />
            <asp:CheckBoxField DataField="SittingFeeToPayOnSite" HeaderText="ToPayOnSite" SortExpression="SittingFeeToPayOnSite" />
            <asp:CheckBoxField DataField="Reprise" HeaderText="Reprise" SortExpression="Reprise" />
        </Columns>
        <EditRowStyle BackColor="#FFFAE0" />
    </asp:GridView>
    &nbsp;
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" CancelSelectOnNullParameter="false"
        ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>" 
        SelectCommand="CMRC_RendezVous_GetAllInfo" SelectCommandType="StoredProcedure"
        UpdateCommand="CMRC_RendezVous_Update" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleId" QueryStringField="scheduleId" Type="string" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="RendezVousId" Type="Object" />
            <asp:QueryStringParameter Name="ScheduleId" QueryStringField="scheduleId" Type="string" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Heure" Type="Datetime" />
            <asp:Parameter Name="estOccupe" Type="Boolean" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="SittingFee" Type="decimal" />
            <asp:Parameter Name="SittingFeePaid" Type="Boolean" />
            <asp:Parameter Name="SittingFeeRebateApplied" Type="Boolean" />
            <asp:Parameter Name="SittingFeePaidOnline" Type="Boolean" />
            <asp:Parameter Name="SittingFeeToPayOnSite" Type="Boolean" />
            <asp:Parameter Name="Reprise" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    
    <!-- Code pour le rapport a imprimer !-->
    <div id="zoneaimprimer" style="display:none;">
        <a href="javascript:window.print()" style="font-size:xx-small;">Imprimer</a>
        <div style="margin-bottom:10px; width:100%; padding-left:50px;">
            <table width="100%">
                    <tr valign="top">
                        <td style="width:15%;">
                            Événement :
                        </td>
                        <td>
                            <asp:Label ID="lblNomEvent" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            Description :
                        </td>
                        <td>
                            <asp:Label ID="lblDescEvent" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            Date :
                        </td>
                        <td>
                            <asp:Label ID="lblDate2" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>              
        </div>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="False" AllowSorting="True"
            AutoGenerateColumns="false" DataKeyNames="RendezVousID"
            DataSourceID="SqlDataSource2" PageSize="200" GridLines="horizontal">
            <RowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="RendezVousID" HeaderText="RendezVousID" Visible="False" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" Visible="False"/>
                <asp:BoundField DataField="Heure" DataFormatString="{0:HH:mm}" HeaderText="Heure" HtmlEncode="False" ><ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="lastName" HeaderText="Nom"><ItemStyle Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="firstName" HeaderText="Pr&#233;nom"><ItemStyle Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email"  Visible="False"/>
                <asp:CheckBoxField DataField="estOccupe" HeaderText="Occupe"   Visible="False" />
                <asp:BoundField DataField="SittingFee" HeaderText="SittingFee" Visible="False" />            
                <asp:TemplateField HeaderText="En ligne">                        
                        <ItemTemplate>
                             <asp:CheckBox ID="SittingFeePaidOnline" runat="server" Width="60px" Checked='<%#Bind("SittingFeePaidOnline")%>'></asp:CheckBox>
                        </ItemTemplate>                      
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sur place">                        
                        <ItemTemplate>
                             <asp:CheckBox ID="SittingFeeToPayOnSite" runat="server" Width="60px" Checked='<%#Bind("SittingFeeToPayOnSite")%>'></asp:CheckBox>
                        </ItemTemplate>                      
                </asp:TemplateField>             
                <asp:TemplateField HeaderText="Reprise">                        
                        <ItemTemplate>
                             <asp:CheckBox ID="Reprise" runat="server" Width="60px" Checked='<%#Bind("Reprise")%>'></asp:CheckBox>
                        </ItemTemplate>                      
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pay&#233;" >                        
                        <ItemTemplate>
                             <asp:CheckBox ID="SittingFeePaid" Width="60px" runat="server" Checked='<%# GetSittingFeePaid(Eval("SittingFeePaid"))%>' ></asp:CheckBox>
                        </ItemTemplate>                      
                </asp:TemplateField>
                <asp:CheckBoxField DataField="SittingFeeRebateApplied" HeaderText="RebateApplied" SortExpression="SittingFeeRebateApplied" Visible="False" />
                <asp:BoundField DataField="Note" HeaderText="Note" ><ItemStyle Width="140px" />
                </asp:BoundField>
            </Columns>         
        </asp:GridView>
        &nbsp;
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" CancelSelectOnNullParameter="false"
        ConnectionString="<%$ ConnectionStrings:CommerceTemplate %>" 
        SelectCommand="CMRC_RendezVous_GetAllInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleId" QueryStringField="scheduleId" Type="string" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script language="JavaScript">
        function imprime_zone(titre, obj)
        {
            // Définie la zone à imprimer
            var zi = document.getElementById(obj).innerHTML;
            // Ouvre une nouvelle fenetre
            var f = window.open("", "ZoneImpr", "height=768, width=1024,toolbar=0, menubar=0, scrollbars=1, resizable=1,status=0, location=0, left=1, top=1");
            // Définit le Style de la page
            f.document.body.style.color = '#000000';
            f.document.body.style.backgroundColor = '#FFFFFF';
            // Ajoute les Données
            f.document.title = titre;
            f.document.body.innerHTML += " " + zi + " ";
            return true;
        }
     
    </script>
    
</asp:Content>

