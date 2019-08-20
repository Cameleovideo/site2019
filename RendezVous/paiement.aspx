<%@ page language="VB" masterpagefile="~/general.master" smartnavigation="true" autoeventwireup="false" inherits="RendezVous_paiement, App_Web_hsfuruo7" title="Rendez-vous : Paiement" stylesheettheme="White" enableEventValidation="false" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    
     <div id="home" class="page">
        <div id="divPaiement" runat="server">
            <h3 style="text-align:center;"><asp:literal ID="paiementHeader" runat="server" text="<%$ Resources: paiementHeader  %>"></asp:literal></h3>
            <hr />
            <asp:Label ID="lblFraisPose" runat="server" meta:resourcekey="lblFraisPoseResource1"></asp:Label>
            <asp:Label ID="lblMontantFraisPose" runat="server" Font-Bold="true" ></asp:Label>
            <br /><br />
            <asp:Label ID="lblModePaiement" runat="server" meta:resourcekey="lblModePaiementResource1"></asp:Label>
            <br /><br />
            <div style="margin-left: 20px">
                <asp:RadioButton ID="EnLigne" runat="server" GroupName="ModePaiement" meta:resourcekey="lblEnLigneResource1" />
                <br />
                <asp:RadioButton ID="SurPlace" runat="server" GroupName="ModePaiement"  meta:resourcekey="lblSurPlaceResource1" />
                <br />
                <asp:RadioButton ID="Reprise" runat="server" GroupName="ModePaiement" meta:resourcekey="lblRepriseResource1" />
                <br /><br /><br />
                <asp:Button ID="btnValiderMode" runat="server" OnClick="btnValiderMode_Click" Text="Valider" meta:resourcekey="btnValiderModeResource1" />
            </div>
        </div>
        <div id="divModifierProfile" runat="server" visible="false">
        <table cellpadding="2" cellspacing="1" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="TitleLabel" runat="server" meta:resourcekey="TitleLabelResource1" Font-Bold="true"></asp:Label>
                    <br /><br />
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
            <tr>
                <td>
                    <asp:Label ID="AddressLabel" runat="server" meta:resourcekey="AddressLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBillAddress" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBillAddress">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Address2Label" runat="server" meta:resourcekey="Address2LabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBillAddress2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="CityLabel" runat="server" meta:resourcekey="CityLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBillCity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBillCity">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <uc1:LocationSelector ID="LocationSelector1" runat="server" />
            <tr>
                <td>
                    <asp:Label ID="PostalCodeLabel" runat="server" meta:resourcekey="PostalCodeLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBillZip" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBillZip">*</asp:RequiredFieldValidator>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="PhoneLabel" runat="server" meta:resourcekey="PhoneLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBillPhone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBillPhone">*</asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                 <td colspan="2">
                     <br />
                     <asp:Button ID="btnModProfile" runat="server" meta:resourcekey="btnModProfileResource1" OnClick="btnModProfile_Click" />
                 </td>
             </tr>
         </table>
        </div>
    </div>
       
</asp:Content>

