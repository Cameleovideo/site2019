<%@ control language="VB" autoeventwireup="false" inherits="Modules_EventShoot, App_Web_ugamw2jd" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>

    <tr>
        <td>
            <asp:label id="EventCodeLabel" runat="server" meta:resourcekey="EventCodeLabelResource1"></asp:label>
        </td>
        <td>
            <asp:dropdownlist id="EventList" datasourceid="ObjectDataSource1" DataValueField="UserName" DataTextField="Code" runat="server" OnSelectedIndexChanged="EventList_SelectedIndexChanged" AutoPostBack="true">
            </asp:dropdownlist>
        </td>
    </tr>
    <tr>
        <td>
            <asp:label id="EventNameLabel" runat="server" meta:resourcekey="EventNameLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Label ID="txtEventName" runat="server" ></asp:Label>            
        </td>
    </tr>
    <tr>
        <td>
            <asp:label id="EventDescriptionLabel" runat="server" meta:resourcekey="EventDescriptionLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Label ID="txtEventDescription" runat="server" ></asp:Label>            
        </td>
    </tr>
    <tr>
        <td>
            <asp:label id="EventTypeLabel" runat="server" meta:resourcekey="EventTypeLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Label ID="txtEventType" runat="server" ></asp:Label>            
        </td>
    </tr>
    <tr>
        <td>
            <asp:label id="CreateDateLabel" runat="server" meta:resourcekey="CreateDateLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Label ID="txtCreateDate" runat="server" ></asp:Label>            
        </td>
    </tr>
    <tr>
        <td>
            <asp:label id="ScheduledShootDateLabel" runat="server" meta:resourcekey="ScheduledShootDateLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Label ID="txtScheduledShootDate" runat="server" ></asp:Label>            
        </td>
    </tr>
    <tr>
        <td>
            <asp:label id="ShootDateLabel" runat="server" meta:resourcekey="ShootDateLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Label ID="txtShootDate" runat="server" ></asp:Label>            
        </td>
    </tr>
    <tr>
        <td>
            <asp:label id="LastOrderScheduledDateLabel" runat="server" meta:resourcekey="LastOrderScheduledDateLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Label ID="txtLastOrderScheduledDate" runat="server" ></asp:Label>            
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="FirstNameLabel" runat="server" meta:resourcekey="FirstNameLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtFirst"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtFirst">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="LastNameLabel" runat="server" meta:resourcekey="LastNameLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtLast"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtLast">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="AddressLabel" runat="server" meta:resourcekey="AddressLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtAddress"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtAddress">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="Address2Label" runat="server" meta:resourcekey="Address2LabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtAddress2"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="CityLabel" runat="server" meta:resourcekey="CityLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtCity"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtCity">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <uc1:LocationSelector id="LocationSelector1" runat="server" />

    <tr>
        <td >
            <asp:label id="PostalCodeLabel" runat="server" meta:resourcekey="PostalCodeLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtZip"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtZip">*</asp:RequiredFieldValidator>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="PhoneLabel" runat="server" meta:resourcekey="PhoneLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtPhone"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtPhone">*</asp:RequiredFieldValidator>        
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="FaxLabel" runat="server" meta:resourcekey="FaxLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtFax"></asp:TextBox>                    
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="CellPhoneLabel" runat="server" meta:resourcekey="CellPhoneLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtCellPhone"></asp:TextBox>                    
        </td>
    </tr>            
    <tr>
        <td >
            <asp:label id="EmailLabel" runat="server" meta:resourcekey="EmailLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtEmail"></asp:TextBox>                    
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="WebSiteLabel" runat="server" meta:resourcekey="WebSiteLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtWebSite"></asp:TextBox>                    
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="ReturnTypeLabel" runat="server" meta:resourcekey="ReturnTypeLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Panel ID="panelReturnType" visible="false" runat="server">   
                ID: <asp:TextBox ID="idReturnType" runat="server"></asp:TextBox><br />
            </asp:Panel>
            <asp:label Runat="server" ID="txtReturnType" ></asp:label>                    
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="ReturnValueLabel" runat="server" meta:resourcekey="ReturnValueLabelResource1"></asp:label>
        </td>
        <td>
            <asp:Panel ID="panelReturnValue" visible="false" runat="server">   
                ID: <asp:TextBox ID="idReturnValue" runat="server"></asp:TextBox><br />
            </asp:Panel>
            <asp:label Runat="server" ID="txtReturnValue"></asp:label>                    
        </td>
    </tr>

    <asp:ObjectDataSource onobjectcreating="GetProvider" ID="ObjectDataSource1" runat="server" SelectMethod="FindEventShootsUsersByClientName" TypeName="Cameleo.CameleoMembershipProvider" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:Parameter Name="ClientUserName" Type="String" DefaultValue="" />
        </SelectParameters>
    </asp:ObjectDataSource>   