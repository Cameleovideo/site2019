<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="RendezVous_creerCompte, App_Web_hsfuruo7" title="CreationCompte" enableEventValidation="false" stylesheettheme="White" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <h3><asp:Literal ID="creationHeader" runat="server" Text="<%$ Resources: CreationHeader  %>"></asp:Literal></h3>
    <asp:Panel ID="pnlCreateAccount" runat="server">        
        <asp:Label ID="exactInfoLabel" runat="server" Font-Bold="true" meta:resourcekey="exactInfoResource1"></asp:Label>
        <h4><asp:Label ID="errorCreationLabel" runat="server" meta:resourcekey="errorCreationLabelResource1" Style="color: Red" Visible="false"></asp:Label></h4>
        <h4><asp:Label ID="errorClientUniqueIdLabel" runat="server" meta:resourcekey="errorClientUniqueIdLabelResource1" Style="color: Red" Visible="false"></asp:Label></h4>
        <h4><asp:Label ID="errorRegisteredLabel" runat="server" meta:resourcekey="errorRegisteredLabelResource1" Style="color: Red" Visible="false"></asp:Label></h4>
        <table cellpadding="2" cellspacing="1" width="100%">
            <tr>
                <td style="width: 210px;">
                    <asp:Label ID="EventLabel" runat="server" meta:resourcekey="EventLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="EventDDL" runat="server" DataTextField="Name" DataValueField="Code" AutoPostBack="true" OnSelectedIndexChanged="EventDDL_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="trClientUniqueId" visible="false" runat="server">
                <td>
                    <asp:Label ID="ClientUniqueIdLabel" runat="server" meta:resourcekey="ClientUniqueIdLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtClientUniqueId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="PasswordLabel" runat="server" meta:resourcekey="PasswordLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="PasswordConfirmLabel" runat="server" meta:resourcekey="PasswordConfirmLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPasswordConfirm">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword"
                        ControlToValidate="txtPasswordConfirm" Operator="Equal" Type="String">
                        <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: errorPasswordMustMatch  %>"></asp:Literal></asp:CompareValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EmailLabel" runat="server" meta:resourcekey="EmailLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator id="valRegEx" runat="server" ControlToValidate="txtEmail" ValidationExpression=".*@.*\..*" display="dynamic">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: emailInvalide  %>"></asp:Literal>
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="FirstNameLabel" runat="server" meta:resourcekey="FirstNameLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBillFirst" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBillFirst">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LastNameLabel" runat="server" meta:resourcekey="LastNameLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBillLast" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="txtBillLast">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <!-- Pas necessaire pour le moment
                        <tr>
                            <td >
                                <asp:label id="AddressLabel" runat="server" meta:resourcekey="AddressLabelResource1"></asp:label>
                            </td>
                            <td>
                                <asp:TextBox Runat="server" ID="txtBillAddress"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:label id="Address2Label" runat="server" meta:resourcekey="Address2LabelResource1"></asp:label>
                            </td>
                            <td>
                                <asp:TextBox Runat="server" ID="txtBillAddress2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:label id="CityLabel" runat="server" meta:resourcekey="CityLabelResource1"></asp:label>
                            </td>
                            <td>
                                <asp:TextBox Runat="server" ID="txtBillCity"></asp:TextBox>
                            </td>
                        </tr>
                        <uc1:LocationSelector id="LocationSelector1" runat="server" />

                        <tr>
                            <td >
                                <asp:label id="PostalCodeLabel" runat="server" meta:resourcekey="PostalCodeLabelResource1"></asp:label>
                            </td>
                            <td>
                                <asp:TextBox Runat="server" ID="txtBillZip"></asp:TextBox>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:label id="PhoneLabel" runat="server" meta:resourcekey="PhoneLabelResource1"></asp:label>
                            </td>
                            <td>
                                <asp:TextBox Runat="server" ID="txtBillPhone"></asp:TextBox>
                                
                            </td>
                        </tr>             
                        !-->
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Button ID="btnCreateAccount" runat="server" meta:resourcekey="btnCreateAccountResource1"
                        OnClick="btnCreateAccount_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    
    <h4><asp:Label ID="lblNoEvent" runat="server" meta:resourcekey="lblNoEventResource1" Visible="false"></asp:Label></h4>
</asp:Content>

