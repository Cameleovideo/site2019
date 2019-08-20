<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ClientSearch, App_Web_xsmy-jkx" %>

<asp:Panel runat="server" ID="panelSearchClient" Width="1000" CssClass="accordionHeader2">
    <asp:Panel runat="server" ID="panel1">
        <div style="background-color: #00713d;">
            <table>
                <tr>
                    <td align="left">
                        <asp:Label runat="server" ID="textLabel" ForeColor="#8CC63F" Font-Bold="false" Text="Liste des clients" />
                    </td>                    
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="panel2" BorderStyle="Dashed" BorderWidth="1" style="border-top:none" >
        <div style="background-color: white;overflow:auto;height:auto">
            <asp:GridView ID="gvClients" runat="server" AutoGenerateColumns="False" CellPadding="4" datakeynames="username" Width="100%" BackColor="transparent"
                 ForeColor="#333333" GridLines="None" AllowPaging="false"  OnRowDataBound="gvClients_RowDataBound" OnSelectedIndexChanged="gvClients_SelectedIndexChanged">
                <FooterStyle BackColor="transparent" Font-Bold="True" ForeColor="White"  />
                <HeaderStyle BackColor="transparent" ForeColor="#00713d" HorizontalAlign="Left" />
                <Columns>            
                    <asp:TemplateField  >            
                        <ItemTemplate>
                            <asp:LinkButton BackColor="transparent" ForeColor="#00713d" ID="btnSelect" CommandName="Select" runat="server" CausesValidation="false">Détails</asp:LinkButton>
                        </ItemTemplate>                
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserName" HeaderText="Numéro d'établissement" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Nom" >            
                        <ItemTemplate>
                            <asp:HiddenField runat="server" Id="UserID" Value='<%# Bind("ProviderUserKey") %>' />
                            <asp:HiddenField runat="server" Id="UserName" Value='<%# Bind("UserName") %>' />
                            <asp:Label id="lblName" runat="server" ></asp:Label>                    
                        </ItemTemplate>                
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type" >            
                        <ItemTemplate>                                        
                            <asp:DropDownList  ID="lstClientTypes" runat="server" Enabled="false" DataTextField="ClientType" DataValueField="ClientTypeID"  >
                            </asp:DropDownList>                  
                        </ItemTemplate>                
                    </asp:TemplateField>          
                    <asp:TemplateField HeaderText="Catégorie" >
                        <ItemTemplate>                    
                            <asp:Label id="lblCategory" runat="server" ></asp:Label>                    
                        </ItemTemplate>                
                    </asp:TemplateField>          
                </Columns>                                
                <HeaderStyle ForeColor="#00713d" HorizontalAlign="Left"/>
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
</asp:Panel>
</asp:Panel>

<ajaxToolkit:RoundedCornersExtender ID="rcePanelSearchClient" runat="server"
        TargetControlID="panelSearchClient"
        Color="#00713d"
        Radius="8"
        Corners="top" />
