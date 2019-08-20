<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ParentOrganization, App_Web_xsmy-jkx" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>
<br />  
<asp:Panel runat="server" ID="panelAddParentOrg"  style="border-top:none;overflow:auto" >
    <asp:Panel runat="server" ID="panel1">
        <div style="background-color: #00713d;">
            <table>
                <tr>
                    <td align="left">
                        <asp:Label runat="server" ID="textLabel" ForeColor="#8CC63F" Font-Bold="false" Text="Créer une organisation" />
                    </td>                    
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="panel2" BorderStyle="Dashed" BorderWidth="1" style="border-top:none;" >
        <asp:GridView ID="gvParentOrg" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="0" datakeynames="OrganizationId" 
             ForeColor="#333333" GridLines="none" DataSourceID="odsParentOrg" Width="90%" ShowFooter="true" OnRowDataBound ="gvParentOrg_RowDataBound" OnRowUpdating="gvParentOrg_RowUpdating">
            <HeaderStyle ForeColor="#00713d" HorizontalAlign="Left"/>
            <FooterStyle BackColor="#dddddd" Font-Bold="True" ForeColor="White" />                                                                          
            <EmptyDataTemplate>Vide</EmptyDataTemplate>
            <Columns>                                         
                <asp:TemplateField ShowHeader="False" ItemStyle-Wrap="false">            
                    <ItemTemplate>
                        <asp:ImageButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/App_Themes/Admin/Images/modifier.png" >
                        </asp:ImageButton>                              
                    </ItemTemplate>                                    
                    <EditItemTemplate>
                        <asp:ImageButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/App_Themes/Admin/Images/sauvegarder.png" >
                        </asp:ImageButton> 
                        <asp:ImageButton ID="lbCancel" runat="server"  CausesValidation="False" CommandName="Cancel" ImageUrl="~/App_Themes/Admin/Images/annuler.png">
                        </asp:ImageButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ID="lbInsertParentOrg" runat="server" CommandName="Insert" ValidationGroup="addVal" OnClick="lbInsertParentOrg_Click" ImageUrl="~/App_Themes/Admin/Images/ajouter.png">
                        </asp:ImageButton>  
                        <br /><br />
                        <asp:CheckBox ID="chkForCurrentUser" Text="Associé au client courant" ForeColor="#00713d" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type de client">
                    <ItemTemplate>                            
                        <asp:Label ID="lblClientType" runat="server" Text='<%# Bind("ClientType") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="lstEditClientType" DataSourceID="odsClientTypes" DataTextField="ClientType" DataValueField="ClientTypeID"  selectedvalue='<%# Bind("ClientType") %>' runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="lstInsertClientType" DataSourceID="odsClientTypes" DataTextField="ClientType" DataValueField="ClientTypeID"   runat="server">
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Nom">
                    <ItemTemplate>
                        <asp:HiddenField runat="server" id="AddressId" Value='<%# Bind("OrganizationId") %>'/>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertName" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>                    
                <asp:TemplateField HeaderText="Téléphone">
                    <ItemTemplate>
                        <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txtEditPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertPhone" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fax">
                    <ItemTemplate>
                        <asp:Label ID="lblFax" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txtEditFax" runat="server" Text='<%# Bind("Fax") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertFax" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Numéro">
                    <ItemTemplate>
                        <asp:Label ID="lblNumber" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txtEditNumber" runat="server" Text='<%# Bind("Number") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertAddress" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ville">
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txtEditCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertCity" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code Postal">
                    <ItemTemplate>
                        <asp:Label ID="lblPostalCode" runat="server" Text='<%# Bind("PostalCode") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txtEditPostalCode" runat="server" Text='<%# Bind("PostalCode") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertPostalCode" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Province/État & Pays">
                    <ItemTemplate>
                        <asp:Label ID="lblProvince" runat="server" Text='<%# Bind("Province") %>'></asp:Label>
                        <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>                                                
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:HiddenField id="province" Value='<%# Bind("Province") %>' runat="server"/>
                        <asp:HiddenField id="country" Value='<%# Bind("Country") %>' runat="server"/>
                        <table>
                            <uc1:LocationSelector id="EditAddressLocationSelector" runat="server"></uc1:LocationSelector>
                        </table>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:HiddenField id="province" Value='<%# Bind("Province") %>' runat="server"/>
                        <asp:HiddenField id="country" Value='<%# Bind("Country") %>' runat="server"/>
                        <table >
                            <uc1:LocationSelector id="InsertAddressLocationSelector" runat="server" OnInit="InsertAddressLocationSelector_Init"></uc1:LocationSelector>
                        </table>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Courriel">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertEmail" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>                                    
                <asp:TemplateField HeaderText="Site WEB">
                    <ItemTemplate>
                        <asp:Label ID="lblWebSite" runat="server" Text='<%# Bind("WebSite") %>'></asp:Label>
                    </ItemTemplate>
                     <EditItemTemplate>
                        <asp:TextBox ID="txtEditWebSite" runat="server" Text='<%# Bind("WebSite") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtInsertWebSite" runat="server" Text=""></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Panel>

<ajaxToolkit:RoundedCornersExtender ID="rcePanelAddParentOrg" runat="server"
    TargetControlID="panelAddParentOrg"
    Color="#00713d"
    Radius="8"
    Corners="top" />

<asp:ObjectDataSource ID="odsParentOrg" runat="server" TypeName="Cameleo.CameleoMembershipProvider" OnInserting="odsParentOrg_Inserting" OnInserted ="odsParentOrg_Inserted"
    SelectMethod="GetParentOrganizationList" InsertMethod="CreateParentOrg" UpdateMethod="UpdateParentOrg" >
    <SelectParameters>
        <asp:Parameter Name="UserID" />
        <asp:Parameter Name="ClientType" />
    </SelectParameters>        
    <InsertParameters>
        <asp:Parameter name="UserID" />
        <asp:Parameter name="ClientType"/>
        <asp:Parameter name="Name"/>
        <asp:Parameter name="Number"  />
        <asp:Parameter name="City"  />            
        <asp:Parameter name="PostalCode"  />
        <asp:Parameter name="Province"  />
        <asp:Parameter name="Country"  />            
        <asp:Parameter name="Phone"  />
        <asp:Parameter name="Fax"  />
        <asp:Parameter name="email"  />
        <asp:Parameter name="WebSite" />             
    </InsertParameters>      
    <UpdateParameters>
        <asp:Parameter name="OrganizationID" />
        <asp:Parameter name="ClientType" />
        <asp:Parameter name="Name" />
        <asp:Parameter name="Number"  />
        <asp:Parameter name="City"  />            
        <asp:Parameter name="PostalCode"  />
        <asp:Parameter name="Province"  />
        <asp:Parameter name="Country"  />            
        <asp:Parameter name="Phone"  />
        <asp:Parameter name="Fax"  />
        <asp:Parameter name="email"  />
        <asp:Parameter name="WebSite" />             
    </UpdateParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsClientTypes" runat="server" TypeName="Cameleo.Client" 
    SelectMethod="GetClientTypeList" >        
</asp:ObjectDataSource>