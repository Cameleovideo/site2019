<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ClientContracts, App_Web_xsmy-jkx" %>

<asp:Panel runat="server" ID="panelContracts" >
    <table style="width:100%">
        <tr>
            <td>                
            </td>
            <td align="left" style="color:#00713d;font-size:large"  >
                Sans contrat
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="width:55%">
                <asp:GridView ID="gvNoContractEvents" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="0" datakeynames="UserId" DataSourceid="odsEventsWithoutContract" OnRowDataBound="gvNoContractEvents_RowDataBound" 
                     ForeColor="#333333" GridLines="none" Width="100%" ShowHeader="false" ShowFooter="false" BackColor="transparent" OnSelectedIndexChanged="gvNoContractEvents_SelectedIndexChanged" >                        
                    <SelectedRowStyle  BackColor="#00713d" />
                    <EmptyDataTemplate>                                                        
                        Aucun événement
                    </EmptyDataTemplate>
                    <Columns>                                                        
                        <asp:TemplateField >    
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />                  
                            <ItemTemplate>   
                                <asp:HiddenField id="EventUserID" Value='<%# Eval("UserId") %>' runat="server" />                                                    
                                <asp:LinkButton ID="lbSelectEvent" CommandName="select" runat="server">
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Code") %>' ></asp:Label>
                                </asp:LinkButton>
                            </ItemTemplate>                                
                        </asp:TemplateField>
                        <asp:TemplateField >    
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />                  
                            <ItemTemplate>                        
                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("ScheduledShootDate", "{0:yyyy-MM-dd}") %>' ></asp:Label>
                            </ItemTemplate>                                
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    
    <asp:GridView ID="gvContracts" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="0" datakeynames="ContractId" ShowFooter="true" BackColor="transparent" 
         ForeColor="#333333" GridLines="none" DataSourceID="odsContracts" Width="100%" OnrowUpdating="gvContracts_RowUpdating" OnRowDataBound="gvContracts_RowDataBound">
        <FooterStyle BackColor="transparent" Font-Bold="True" ForeColor="White"  />
        <HeaderStyle BackColor="transparent" ForeColor="#00713d" HorizontalAlign="Left" />
        <EditRowStyle BackColor="#dddddd" />        
        <EmptyDataTemplate>
            <asp:LinkButton ID="lbAdd" runat="server" CausesValidation="False" Text="Ajouter un contrat" OnClick="lbAdd_click" >
            </asp:LinkButton>
        </EmptyDataTemplate>
        <Columns>                            
            <asp:TemplateField ShowHeader="False" FooterStyle-Width="95" >                
                <ItemStyle VerticalAlign="middle" />  
                <ItemTemplate>                                        
                    <asp:ImageButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" imageurl="~/App_Themes/Admin/Images/modifier.png" >
                    </asp:ImageButton>
                </ItemTemplate>                                    
                <EditItemTemplate>
                    <asp:ImageButton ID="lbUpdate" runat="server" CausesValidation="True" ValidationGroup="vgEditContract" CommandName="Update" imageurl="~/App_Themes/Admin/Images/sauvegarder.png" >
                    </asp:ImageButton> 
                    <asp:ImageButton ID="lbCancel" runat="server"  CausesValidation="False" CommandName="Cancel" imageurl="~/App_Themes/Admin/Images/annuler.png">
                    </asp:ImageButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:ImageButton ID="lbInsertContract" runat="server" CommandName="Insert" ValidationGroup="vgAddContract" OnClick="lbInsertContract_Click" ImageUrl="~/App_Themes/Admin/Images/contrat.png">
                    </asp:ImageButton>                                             
                </FooterTemplate>
            </asp:TemplateField>     
            <asp:TemplateField >    
                <ItemStyle VerticalAlign="Middle" />                  
                <ItemTemplate>                        
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>' ForeColor="#00713d" Font-Size="Large"></asp:Label>                            
                    <asp:HiddenField runat="server" id="ContractId" Value='<%# Bind("ContractId") %>'/>
                    <asp:GridView ID="gvContractEvents" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="0" datakeynames="UserId" OnRowDataBound="gvNoContractEvents_RowDataBound" 
                         ForeColor="#333333" GridLines="none" Width="100%" ShowHeader="false" ShowFooter="false" BackColor="transparent" OnSelectedIndexChanged="gvContractEvents_SelectedIndexChanged">                        
                        <EmptyDataTemplate>                                                        
                            Aucun événement
                        </EmptyDataTemplate>
                        <SelectedRowStyle  BackColor="#00713d" />
                        <Columns>                                                        
                            <asp:TemplateField >    
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />                  
                                <ItemTemplate>  
                                    <asp:HiddenField id="EventUserID" Value='<%# Eval("UserId") %>' runat="server" />                                                    
                                    <asp:LinkButton ID="lbSelectEvent" CommandName="select" runat="server">
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Code") %>' ></asp:Label>
                                    </asp:LinkButton>                                                          
                                </ItemTemplate>                                
                            </asp:TemplateField>
                            <asp:TemplateField >    
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />                  
                                <ItemTemplate>                        
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("ScheduledShootDate", "{0:yyyy-MM-dd}") %>' ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>   
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:HiddenField runat="server" id="ContractId" Value='<%# Bind("ContractId") %>'/>
                    <asp:TextBox ID="txtEditDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvDescription" ValidationGroup="vgEditContract" ControlToValidate="txtEditDescription" Text="*" runat="server"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtInsertDescription" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvDescription" ValidationGroup="vgAddContract" ControlToValidate="txtInsertDescription" Text="*" runat="server"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
                       
</asp:Panel>

    
<asp:ObjectDataSource ID="odsContracts" runat="server" TypeName="Cameleo.CameleoMembershipProvider"  OnInserting="odsContracts_Inserting" OnInserted="odsContracts_Inserted" OnUpdating="odsContracts_Updating"
    SelectMethod="GetContractsForUser" InsertMethod="CreateContract" UpdateMethod="UpdateContract">
    <SelectParameters>
        <asp:Parameter Name="UserID" />
    </SelectParameters>    
    <InsertParameters>
        <asp:Parameter name="UserID" />            
        <asp:Parameter name="Description"  />
        <asp:Parameter name="Signed" Type="Boolean" DefaultValue="false" />            
        <asp:Parameter name="SignerName" DefaultValue="" />            
        <asp:Parameter name="SignerPosition" DefaultValue="" />
        <asp:Parameter name="SignatureDate" DefaultValue="" />                    
        <asp:Parameter name="LastUpdateUserName" defaultvalue='<% Profile.UserName %>' />
    </InsertParameters>       
    <UpdateParameters>
        <asp:Parameter name="ContractID" />        
        <asp:Parameter name="Description"  />
        <asp:Parameter name="Signed" Type="Boolean" DefaultValue="false" />            
        <asp:Parameter name="SignerName" DefaultValue="" />            
        <asp:Parameter name="SignerPosition" DefaultValue="" />
        <asp:Parameter name="SignatureDate"  DefaultValue="" />                            
        <asp:Parameter name="LastUpdateUserName" defaultvalue='<% Profile.UserName %>' />
    </UpdateParameters>   
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsEventsWithoutContract" runat="server" TypeName="Cameleo.CameleoMembershipProvider"  OnInserting="odsContracts_Inserting" OnInserted="odsContracts_Inserted" OnUpdating="odsContracts_Updating"
    SelectMethod="GetEventsByContract">
    <SelectParameters>
        <asp:Parameter Name="ClientUserID" />
        <asp:Parameter Name="ContractID"  DefaultValue="0" />
    </SelectParameters>    
    
</asp:ObjectDataSource>