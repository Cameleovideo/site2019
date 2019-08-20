<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ClientContacts, App_Web_xsmy-jkx" %>

<br />   
<asp:Panel runat="server" ID="panelContacts" >
<ajaxToolkit:Accordion ID="Contacts" runat="server" SelectedIndex="-1" 
    HeaderCssClass="accordionHeader" ContentCssClass="accordionContent" 
    FadeTransitions="true" FramesPerSecond="40" TransitionDuration="200" 
    AutoSize="none" RequireOpenedPane="false" SuppressHeaderPostbacks="true" >
    <Panes>                                
        <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server" >
            <Header>
                > Contacts
            </Header>
            <Content>    
                <div style="overflow:auto;height:190px;">     
                <asp:GridView ID="gvContacts" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="0" datakeynames="ContactId" ShowFooter="true" BackColor="transparent"
                     ForeColor="#333333" GridLines="none" DataSourceID="odsContacts" Width="100%" OnrowUpdating="gvContacts_RowUpdating" OnrowDeleting="gvContacts_RowDeleting">
                    <FooterStyle BackColor="white" Font-Bold="True" ForeColor="White"  />
                    <HeaderStyle BackColor="transparent" ForeColor="#00713d" HorizontalAlign="Left" />
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="lbAdd" runat="server" CausesValidation="False" Text="Ajouter un contact" OnClick="lbAdd_click" >
                        </asp:LinkButton>
                    </EmptyDataTemplate>
                    <Columns>                            
                        <asp:TemplateField ShowHeader="False" ItemStyle-Width="250" FooterStyle-Width="125" >
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
                                <asp:ImageButton ID="lbInsertContact" runat="server" CommandName="Insert" ValidationGroup="addVal" OnClick="lbInsertContact_Click" ImageUrl="~/App_Themes/Admin/Images/ajouter.png">
                                </asp:ImageButton>                                             
                            </FooterTemplate>
                        </asp:TemplateField>     
                        <asp:TemplateField HeaderText="Prénom">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" id="ContactId" Value='<%# Bind("ContactId") %>'/>
                                <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsertFirstName" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>   
                        <asp:TemplateField HeaderText="Nom">
                            <ItemTemplate>
                                <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsertLastName" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Poste/Responsabilité">
                            <ItemTemplate>
                                <asp:Label ID="lblRole" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditRole" runat="server" Text='<%# Bind("Role") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsertRole" runat="server" Text=""></asp:TextBox>
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
                        <asp:TemplateField HeaderText="Courriel">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtInsertEmail" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Personne contact">
                            <ItemTemplate>
                                <asp:Label ID="lblIsContact" runat="server" Text='<%# Bind("IsContact") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstEditIscontact" runat="server" SelectedValue='<%#Bind("IsContact")%>'>
                                    <asp:ListItem Value="True">Oui</asp:ListItem>
                                    <asp:ListItem  Value="False">Non</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="lstInsertIsContact" runat="server">
                                    <asp:ListItem Value="True">Oui</asp:ListItem>
                                    <asp:ListItem Selected="true" Value="False">Non</asp:ListItem>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Personne décisionnelle">
                            <ItemTemplate>
                                <asp:Label ID="lblIsDecisionMaker" runat="server" Text='<%# Bind("IsDecisionMaker") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="lstEditIsDecisionMaker" runat="server" SelectedValue='<%#Bind("IsDecisionMaker")%>'>
                                    <asp:ListItem Value="True">Oui</asp:ListItem>
                                    <asp:ListItem  Value="False">Non</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="lstInsertIsDecisionMaker" runat="server">
                                    <asp:ListItem Value="True">Oui</asp:ListItem>
                                    <asp:ListItem Selected="true" Value="False">Non</asp:ListItem>
                                </asp:DropDownList>
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
<ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server"
    TargetControlID="PanelContacts"
    Color="#8CC63F"
    Radius="8"
    Corners="top" />
    
<asp:ObjectDataSource ID="odsContacts" runat="server" TypeName="Cameleo.CameleoMembershipProvider"  OnInserting="odsContacts_Inserting" OnInserted="odsContacts_Inserted"
    SelectMethod="GetContactsForUser" DeleteMethod="DeleteContact" InsertMethod="CreateContact" UpdateMethod="UpdateContact">
    <SelectParameters>
        <asp:Parameter Name="UserID" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="ContactID" Type="Int32" />            
    </DeleteParameters>    
    <InsertParameters>
        <asp:Parameter name="UserID" />            
        <asp:Parameter name="FirstName"  />
        <asp:Parameter name="LastName"  />            
        <asp:Parameter name="Role"  />            
        <asp:Parameter name="Phone"  />
        <asp:Parameter name="Email"  />            
        <asp:Parameter name="IsContact" type="Boolean" />
        <asp:Parameter name="IsDecisionMaker" type="Boolean" />
        <asp:Parameter name="LastUpdateUserName"  />
    </InsertParameters>       
    <UpdateParameters>
        <asp:Parameter name="ContactID" />
        <asp:Parameter name="FirstName"  />
        <asp:Parameter name="LastName"  />            
        <asp:Parameter name="Role"  />            
        <asp:Parameter name="Phone"  />
        <asp:Parameter name="Email"  />            
        <asp:Parameter name="IsContact" type="Boolean" />
        <asp:Parameter name="IsDecisionMaker" type="Boolean" />
        <asp:Parameter name="LastUpdateUserName" defaultvalue='<% Profile.UserName %>' />
    </UpdateParameters>   
</asp:ObjectDataSource>