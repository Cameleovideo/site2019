<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_event_calendar, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <h1>Événements</h1><br />
    
    <table border="1">
        <tr>
            <td>
                <h1>Ajouter un événement</h1>
            </td>
        </tr>
        <tr>
            <td>
                <table Id="tblInsertInfo" runat="server" visible="false">
                    <tr>
                        <th>
                            Client
                        </th>
                        <th>
                            Laboratoire
                        </th>
                        <th>
                            Photographe
                        </th>
                        <th>
                            WebDiscountPercentage
                        </th>
                        <th>
                            Rendez-Vous
                        </th>
                        <th>
                            FraisDePose
                        </th>
                        <th>
                            MontantFraisDePose
                        </th>
                        <th>
                            MinimumSale
                        </th>
                        <th>
                            FreeShippingAmount
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:dropdownlist id="ClientList" DataValueField="providerUserKey" DataTextField="UserName" runat="server"  AutoPostBack="true">
                            </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:dropdownlist id="LabList" DataValueField="providerUserKey" DataTextField="UserName" runat="server"  AutoPostBack="true">
                            </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:dropdownlist id="PhotographList" DataValueField="providerUserKey" DataTextField="UserName" runat="server"  AutoPostBack="true">
                            </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebDiscount" runat="server" >
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfWebDiscount" ControlToValidate="txtWebDiscount" runat="server" ErrorMessage="Requis">
                            </asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvWebDiscount" ControlToValidate="txtWebDiscount" runat="server" ErrorMessage="0 à 100" 
                                MinimumValue="0" MaximumValue="100">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:dropdownlist id="Appointments" runat="server"  AutoPostBack="false">
                                <asp:ListItem Value="False" Selected="True">Non</asp:ListItem>
                                <asp:ListItem Value="True">Oui</asp:ListItem>
                            </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:dropdownlist id="SittingFee" runat="server"  AutoPostBack="false">
                                <asp:ListItem Value="False" Selected="True">Non</asp:ListItem>
                                <asp:ListItem Value="True">Oui</asp:ListItem>
                            </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSittingFeeAmount" runat="server" Text="0">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="frSittingFeeAmount" ControlToValidate="txtSittingFeeAmount" runat="server" ErrorMessage="Requis">
                            </asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvSittingFeeAmount" Type="Double" ControlToValidate="txtSittingFeeAmount" runat="server" ErrorMessage="0 à 100" 
                                MinimumValue="0" MaximumValue="100">
                            </asp:RangeValidator>
                        </td>
                        
                        <td>
                            <asp:TextBox ID="txtMinimumSale" runat="server" Text="7">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="frMinimumSale" ControlToValidate="txtMinimumSale" runat="server" ErrorMessage="Requis">
                            </asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvMinimumSale" Type="Double" ControlToValidate="txtMinimumSale" runat="server" ErrorMessage="0 à 1000" 
                                MinimumValue="0" MaximumValue="1000">
                            </asp:RangeValidator>
                        </td>
                        
                        <td>
                            <asp:TextBox ID="txtFreeShippingAmount" runat="server" Text="50">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="frFreeShippingAmount" ControlToValidate="txtFreeShippingAmount" runat="server" ErrorMessage="Requis">
                            </asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvFreeShippingAmount" Type="Double" ControlToValidate="txtFreeShippingAmount" runat="server" ErrorMessage="0 à 1000" 
                                MinimumValue="0" MaximumValue="1000">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:dropdownlist id="CashOnly" runat="server"  AutoPostBack="false">
                                <asp:ListItem Value="False" Selected="True">Non</asp:ListItem>
                                <asp:ListItem Value="True">Oui</asp:ListItem>
                            </asp:dropdownlist>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:linkbutton id="btnAddNewEvent" text="Add"  runat="server" CausesValidation="false" OnClick="btnAddNewEvent_Click"/>
                <asp:FormView ID="fvAddEvent" runat="server" DataKeyNames="EventID" DataSourceID="ObjectDataSource1"
		            DefaultMode="ReadOnly" >		            
		             <InsertItemTemplate>
		                <asp:linkbutton id="btnCancel" text="Cancel" CommandName="cancel" runat="server" CausesValidation="false" OnClick="btnCancelNewEvent_Click"/>
		                <table>
		                    <tr>
		                        <th>
		                            Name:
		                        </th>
		                        <th>
		                            Code:
		                        </th>
		                        <th>
		                            Description:
		                        </th>
		                        <th>
		                            Type:
		                        </th>
		                        <th>
		                            ScheduledShootDate:
		                        </th>
		                        
		                    </tr>
		                    <tr>
		                        <td>
		                            <asp:TextBox ID="txtName" runat="server" Text='<%#Bind("Name")%>'>
			                        </asp:TextBox>
		                        </td>
		                        <td>
		                            <asp:TextBox ID="txtCode" runat="server" Text='<%#Bind("Code")%>'>
			                        </asp:TextBox>
		                        </td>
		                        <td>
		                            <asp:TextBox ID="txtDescription" runat="server" Text='<%#Bind("Description")%>'>
			                        </asp:TextBox>
		                        </td>
		                        <td>
		                            <asp:TextBox ID="txtType" runat="server" Text='<%#Bind("Type")%>'>
			                        </asp:TextBox>
		                        </td>
		                        <td>
		                            <asp:TextBox ID="txtScheduledDate" runat="server" Text='<%#Bind("ScheduledShootDate")%>'>
		                            </asp:TextBox>
                                    <asp:ImageButton ID="btnScheduledDate" ImageUrl="~/Images/Calendar_scheduleHS.png" runat="server" /><br />
		                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                        TargetControlID="txtScheduledDate"                
                                        Format="yyyy-MM-dd"
                                        PopupButtonID="btnScheduledDate">
		                            </ajaxToolkit:CalendarExtender>
		                        </td>
		                        
		                    </tr>
		                </table>
            			
			            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert">
			            </asp:LinkButton>
		            </InsertItemTemplate>
	            </asp:FormView>
            </td>
        </tr>
        
    </table><br /><br />
    
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <th colspan="3" align="left">
                            Statut (0=fermé, 1=actif)
                        </th>            
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click"/>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkOpen" runat="server" Text="Actifs" Checked="true"/>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkClosed" Text="Fermés" runat="server"/>
                        </td>                        
                    </tr>
                </table>            
            </td>
            <td style="vertical-align:bottom;">
                <table>
                    <tr>
                        <th colspan="3" align="left">
                            Rapport de ventes partiel
                        </th>            
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSalesReport" runat="server" Text="Lancer le rapport" OnClick="btnSalesReport_Click" />
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
    </table>
    
    <asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="1" datakeynames="EventId"
         ForeColor="#333333" GridLines="Vertical" DataSourceID="ObjectDataSource1" AutoGenerateEditButton="true" >
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        
        <Columns>            
            <asp:TemplateField HeaderText="Event">
                <ItemTemplate>
                    <asp:HiddenField  ID="HiddenField4"  Value='<%# Bind("UserId") %>' runat="server"/>                 
                    <asp:HyperLink ID="lnkEvent" runat="server" NavigateUrl='<%# "admin_event_details.aspx?UserName=" & Membership.GetUser(Eval("UserId")).UserName%>' ><%# Membership.GetUser(Eval("UserId")).UserName %></asp:HyperLink>                    
                    <br />
                    <asp:HyperLink ID="lnkRapport" runat="server" NavigateUrl='<%# "admin_return_report.aspx?EventUserName=" & Membership.GetUser(Eval("UserId")).UserName%>' >Rapport ristourne</asp:HyperLink>                    
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Statut" >
                <itemstyle Width="75">
                </itemstyle>
                
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label><br>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:dropdownlist id="lstStatus" runat="server"  AutoPostBack="false" DataValueField="Status" SelectedValue='<%# Bind("Status") %>'>
                        <asp:ListItem Value="0">Fermé</asp:ListItem>
                        <asp:ListItem Value="1">Actif</asp:ListItem>
                    </asp:dropdownlist>
                </EditItemTemplate>
            </asp:TemplateField>    
            
            <asp:BoundField DataField="Code" HeaderText="Code" >
                <itemstyle Width="75">
                </itemstyle>
            </asp:BoundField>    
            
            <asp:BoundField DataField="Name" HeaderText="Nom" />
            
            <asp:BoundField DataField="Description" HeaderText="Description" >    
                <itemstyle Width="200">
                </itemstyle>
            </asp:BoundField>        
            
            <asp:BoundField DataField="Type" HeaderText="Type" />
            
            <asp:TemplateField HeaderText="ScheduledDate" >
                <ItemTemplate>
                    <asp:Label ID="lblScheduledShootDate"  runat="server" Text='<%# Bind("ScheduledShootDate") %>'></asp:Label>
                </ItemTemplate>                
            </asp:TemplateField>            
            
            <asp:TemplateField HeaderText="ShootDate">
                <ItemTemplate>
                    <asp:Label ID="lblShootDate" runat="server" Text='<%# Eval("ShootDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>            
            
            <asp:TemplateField HeaderText="Client">
                <ItemTemplate>
                    <asp:HiddenField  ID="HiddenField3"  Value='<%# Bind("ClientUserId") %>' runat="server"/>
                    <asp:Label ID="lblClientName" runat="server" ></asp:Label><br>
                    (<asp:Label ID="lblClientUserName" runat="server" Text='<%# Eval("ClientUserName") %>'></asp:Label>)
                    
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Lab" >
                <ItemTemplate >
                    <asp:HiddenField ID="HiddenField1"  Value='<%# Bind("LabUserId") %>' runat="server"/>
                    <asp:Label ID="lblLabName" runat="server" ></asp:Label><br>
                    (<asp:Label ID="lblLabUserName" runat="server" Text='<%# Eval("LabUserName") %>'></asp:Label>)
                </ItemTemplate>                
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Photograph">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField2"  Value='<%# Bind("PhotographUserId") %>' runat="server"/>
                    <asp:Label ID="lblPhotographName" runat="server" ></asp:Label><br>
                    (<asp:Label ID="lblPhotographUserName" runat="server" Text='<%# Eval("PhotographUserName") %>'></asp:Label>)
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="WebDiscountPercentage" HeaderText="%Rabais" />            
            
             <asp:TemplateField HeaderText="Rendez-Vous">
                <ItemTemplate>
                    <asp:Label ID="lblAppointments" runat="server" Text='<%# Eval("Appointments") %>'></asp:Label><br>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:dropdownlist id="Appointments" runat="server"  AutoPostBack="false" DataValueField="Appointments" SelectedValue='<%# Bind("Appointments") %>'>
                        <asp:ListItem Value="False">Non</asp:ListItem>
                        <asp:ListItem Value="True">Oui</asp:ListItem>
                    </asp:dropdownlist>
                </EditItemTemplate>
            </asp:TemplateField> 
            
            <asp:TemplateField HeaderText="FraisDePose">
                <ItemTemplate>
                    <asp:Label ID="lblSittingFee" runat="server" Text='<%# Eval("SittingFee") %>'></asp:Label><br>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:dropdownlist id="SittingFee" runat="server"  AutoPostBack="false" DataValueField="SittingFee" SelectedValue='<%# Bind("SittingFee") %>'>
                        <asp:ListItem Value="False">Non</asp:ListItem>
                        <asp:ListItem Value="True">Oui</asp:ListItem>
                    </asp:dropdownlist>
                </EditItemTemplate>
            </asp:TemplateField>            
            
            <asp:TemplateField HeaderText="MontantFraisDePose">
                <ItemTemplate>                    
                    <asp:Label ID="lblSittingFeeAmount" runat="server" Text='<%# String.Format("{0:C}",  cdbl(Eval("SittingFeeAmount"))) %>' ></asp:Label>                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" id="txtSittingFeeAMount" Text='<%# Bind("SittingFeeAmount", "{0:N}") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="MinimumSale">
                <ItemTemplate>                    
                    <asp:Label ID="lblMinimumSale" runat="server" Text='<%# String.Format("{0:C}",  CDBL(Eval("MinimumSale"))) %>' ></asp:Label>                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" id="txtMinimumSale" Text='<%# Bind("MinimumSale", "{0:N}") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="FreeShippingAmount">
                <ItemTemplate>                    
                    <asp:Label ID="lblFreeShippingAmount" runat="server" Text='<%# String.Format("{0:C}",  Cdbl(Eval("FreeShippingAmount"))) %>' ></asp:Label>                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" id="txtFreeShippingAmount" Text='<%# Bind("FreeShippingAmount", "{0:N}") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="CashOnly">
                <ItemTemplate>
                    <asp:Label ID="lblCashOnly" runat="server" Text='<%# Eval("CashOnly") %>'></asp:Label><br>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:dropdownlist id="CashOnly" runat="server"  AutoPostBack="false" DataValueField="CashOnly" SelectedValue='<%# Bind("CashOnly") %>'>
                        <asp:ListItem Value="False">Non</asp:ListItem>
                        <asp:ListItem Value="True">Oui</asp:ListItem>
                    </asp:dropdownlist>
                </EditItemTemplate>
            </asp:TemplateField> 
        </Columns>
        
        
        <RowStyle BackColor="#E3EAEB" />
        <EditRowStyle BackColor="#7C6F57" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView><br />
    
    
    
    
    
    <asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="Cameleo.CameleoMembershipProvider"		
        SelectMethod="GetEventsByStatus"
		InsertMethod="AddEvent"
		UpdateMethod="UpdateEvent">
		
		<SelectParameters>
		    <asp:Parameter Name="StatusOpen" Type="Boolean"/>
		    <asp:Parameter Name="StatusClosed" Type="Boolean"/>
		</SelectParameters>
		
		<InsertParameters>
		    <asp:ControlParameter  Name="ClientUserId" ControlID="ClientList" PropertyName="SelectedItem.Value" />
		    <asp:ControlParameter  Name="LabUserId" ControlID="LabList" PropertyName="SelectedItem.Value" />
		    <asp:ControlParameter  Name="PhotographUserId" ControlID="PhotographList" PropertyName="SelectedItem.Value" />
		    <asp:ControlParameter  Name="WebDiscountPercentage" ControlID="txtWebDiscount" PropertyName="Text" />
		    <asp:ControlParameter  Name="Appointments" ControlID="Appointments" PropertyName="SelectedItem.Value" Type="Boolean"/>
		    <asp:ControlParameter  Name="SittingFee" ControlID="SittingFee" PropertyName="SelectedItem.Value" Type="Boolean"/>
		    <asp:ControlParameter  Name="SittingFeeAmount" ControlID="txtSittingFeeAmount" PropertyName="Text"  />
		    <asp:ControlParameter  Name="MinimumSale" ControlID="txtMinimumSale" PropertyName="Text"  />
		    <asp:ControlParameter  Name="FreeShippingAmount" ControlID="txtFreeShippingAmount" PropertyName="Text"  />
            <asp:ControlParameter  Name="CashOnly" ControlID="CashOnly" PropertyName="SelectedItem.Value" Type="Boolean"/>		    
            <asp:Parameter Name="ContractId" DefaultValue="" />
            <asp:Parameter Name="AddressId" DefaultValue="" />
		</InsertParameters>		
		
		
	</asp:ObjectDataSource>
	

</asp:Content>

