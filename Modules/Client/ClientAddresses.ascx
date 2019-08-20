<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ClientAddresses, App_Web_xsmy-jkx" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>
<br />
<asp:Panel runat="server" ID="panelAddresses" >
<ajaxToolkit:Accordion ID="Addresses" runat="server" SelectedIndex="-1" 
    HeaderCssClass="accordionHeader" ContentCssClass="accordionContent"
    FadeTransitions="true" FramesPerSecond="40" TransitionDuration="200"  width="1615px"
    AutoSize="none" RequireOpenedPane="false" SuppressHeaderPostbacks="true" >
    <Panes>                                
        <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server"  >
            <Header>
                > Adresses                                    
            </Header>
            <Content>                    
                <div style="overflow:auto;height:190px" >
                 <asp:GridView ID="gvAddresses" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="0" datakeynames="AddressId" OnrowDeleting="gvAddresses_RowDeleting" borderstyle="None"
                     ForeColor="#333333" BackColor="transparent" GridLines="none" DataSourceID="odsAdresses" Width="98%" ShowFooter="true" OnRowDataBound ="gvAddresses_RowDataBound" OnRowUpdating="gvAddresses_RowUpdating" >
                    <HeaderStyle ForeColor="#00713d" BackColor="transparent" HorizontalAlign="Left"/>
                    <FooterStyle BackColor="white" Font-Bold="True" ForeColor="White" />  
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="lbAdd" runat="server" CausesValidation="False" Text="Ajouter une adresse" OnClick="lbAdd_click" >
                        </asp:LinkButton>
                    </EmptyDataTemplate>                                                                 
                    <Columns>         
                        
                        <asp:TemplateField ShowHeader="False" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:ImageButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" imageurl="~/App_Themes/Admin/Images/modifier.png" >
                                </asp:ImageButton>  
                                <asp:ImageButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete" imageurl="~/App_Themes/Admin/Images/supprimer.png">
                                </asp:ImageButton>
                            </ItemTemplate>                                    
                            <EditItemTemplate>
                                <asp:ImageButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" imageurl="~/App_Themes/Admin/Images/sauvegarder.png" >
                                </asp:ImageButton> 
                                <asp:ImageButton ID="lbCancel" runat="server"  CausesValidation="False" CommandName="Cancel" imageurl="~/App_Themes/Admin/Images/annuler.png">
                                </asp:ImageButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="lbInsertAddress" runat="server" CommandName="Insert" ValidationGroup="addVal" OnClick="lbInsertAddress_Click" ImageUrl="~/App_Themes/Admin/Images/ajouter.png">                                                
                                </asp:ImageButton>                                             
                            </FooterTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Adresse primaire">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" id="AddressId" Value='<%# Bind("AddressId") %>'/>
                                <asp:Label ID="lblPrimaryAddress" runat="server" Text='<%# Bind("IsPrimary") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstEditPrimaryAddress" runat="server" SelectedValue='<%#Bind("IsPrimary")%>'>
                                    <asp:ListItem Value="True">Oui</asp:ListItem>
                                    <asp:ListItem  Value="False">Non</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="lstInsertPrimaryAddress" runat="server">
                                    <asp:ListItem Value="True">Oui</asp:ListItem>
                                    <asp:ListItem Selected="true" Value="False">Non</asp:ListItem>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pavillon/local">
                            <ItemTemplate>
                                <asp:Label ID="lblLocal" runat="server" Text='<%# Bind("Local") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditLocal" runat="server" Text='<%# Bind("Local") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsertLocal" runat="server" Text=""></asp:TextBox>
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
                </div>
             </Content>   
        </ajaxToolkit:AccordionPane>  
    </Panes>
</ajaxToolkit:Accordion> 
</asp:Panel>
<ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server"
    TargetControlID="PanelAddresses"
    Color="#8CC63F"
    Radius="8"
    Corners="top" />
    
<asp:ObjectDataSource ID="odsAdresses" runat="server" TypeName="Cameleo.CameleoMembershipProvider" OnInserting="odsAdresses_Inserting" OnInserted ="odsAdresses_Inserted"
    SelectMethod="GetAddressesForUser" DeleteMethod="DeleteAddress" InsertMethod="CreateAddress" UpdateMethod="UpdateAddress" >
    <SelectParameters>
        <asp:Parameter Name="UserID" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="AddressID" Type="Int32" />            
    </DeleteParameters>  
    <InsertParameters>
        <asp:Parameter name="UserID" />
        <asp:Parameter name="IsPrimary" type="Boolean" />
        <asp:Parameter name="Number"  />
        <asp:Parameter name="City"  />            
        <asp:Parameter name="PostalCode"  />
        <asp:Parameter name="Province"  />
        <asp:Parameter name="Country"  />
        <asp:Parameter name="Local"  />
        <asp:Parameter name="Phone"  />
        <asp:Parameter name="Fax"  />
        <asp:Parameter name="WebSite" /> 
        <asp:Parameter name="LastUpdateUserName"  />
    </InsertParameters>      
    <UpdateParameters>
        <asp:Parameter name="AddressID" />
        <asp:Parameter name="IsPrimary" type="Boolean" />
        <asp:Parameter name="Number"  />
        <asp:Parameter name="City"  />            
        <asp:Parameter name="PostalCode"  />
        <asp:Parameter name="Province"  />
        <asp:Parameter name="Country"  />
        <asp:Parameter name="Local"  />
        <asp:Parameter name="Phone"  />
        <asp:Parameter name="Fax"  />
        <asp:Parameter name="WebSite" /> 
        <asp:Parameter name="LastUpdateUserName"  defaultvalue='<% Profile.UserName %>'/>
    </UpdateParameters>
</asp:ObjectDataSource>