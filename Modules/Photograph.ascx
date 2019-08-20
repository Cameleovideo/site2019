<%@ control language="VB" autoeventwireup="false" inherits="Modules_Photograph, App_Web_ugamw2jd" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>

    <tr>
        <td>
            <asp:label id="CompanyNameLabel" runat="server" meta:resourcekey="CompanyNameLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtCompanyName" enabled="false"></asp:TextBox>                    
        </td>
    </tr>            
    <tr>
        <td >
            <asp:label id="FirstNameLabel" runat="server" meta:resourcekey="FirstNameLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtFirst"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtFirst" ID="RequiredFieldValidator1">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="LastNameLabel" runat="server" meta:resourcekey="LastNameLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtLast"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtLast" ID="Requiredfieldvalidator5">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="AddressLabel" runat="server" meta:resourcekey="AddressLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtAddress"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtAddress" ID="RequiredFieldValidator2">*</asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtCity" ID="RequiredFieldValidator3">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <uc1:LocationSelector id="LocationSelector1" runat="server" />

    <tr>
        <td >
            <asp:label id="PostalCodeLabel" runat="server" meta:resourcekey="PostalCodeLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtZip"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtZip" ID="RequiredFieldValidator6">*</asp:RequiredFieldValidator>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td >
            <asp:label id="PhoneLabel" runat="server" meta:resourcekey="PhoneLabelResource1"></asp:label>
        </td>
        <td>
            <asp:TextBox Runat="server" ID="txtPhone"></asp:TextBox>
            <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtPhone" ID="RequiredFieldValidator7">*</asp:RequiredFieldValidator>
            
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