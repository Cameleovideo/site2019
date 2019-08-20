<%@ control language="VB" autoeventwireup="false" inherits="Modules_CommonUser, App_Web_ugamw2jd" %>
<%@ Register Src="~/Modules/LocationSelector.ascx" TagName="LocationSelector" TagPrefix="uc1" %>

    <tr>
        
        <td>
            <asp:DetailsView AutoGenerateRows="False" DataSourceID="ObjectDataSource1" ID="DetailsView1" runat="server" OnItemUpdating="DetailsView1_ItemUpdating" width="415" BorderWidth="0">
                <RowStyle height="25"/>

                <fieldheaderstyle Width="140" />

                <Fields>
                    <asp:BoundField DataField="UserName" ItemStyle-Font-Bold="true" headertext="<%$ Resources: DetailsView1Resource1.UserNameLabel  %>" HeaderStyle-Font-Bold="true" ReadOnly="True" SortExpression="UserName"></asp:BoundField>
                    <asp:BoundField DataField="CreationDate" HeaderText="<%$ Resources: DetailsView1Resource1.CreationDateLabel%>" ReadOnly="True" SortExpression="CreationDate"></asp:BoundField>
                    <asp:BoundField DataField="LastPasswordChangedDate" HeaderText="<%$ Resources: DetailsView1Resource1.LastPasswordChangeDateLabel  %>" ReadOnly="True" SortExpression="LastPasswordChangedDate"></asp:BoundField>
                    
                    <asp:templatefield headertext="<%$ Resources: DetailsView1Resource1.EmailLabel  %>">
                        <itemtemplate>
                            <asp:TextBox id="Email" runat="server" text='<%# Eval("Email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator Runat="server" ControlToValidate="Email" >*</asp:RequiredFieldValidator>
                        </itemtemplate>
                    </asp:templatefield>
                    
                    <asp:templatefield  headertext="<%$ Resources: DetailsView1Resource1.SendMailLabel  %>">
                        <itemtemplate>
                            <asp:CheckBox ID="chkSendMail" checked='<%# Eval("SendMail")%>' runat="server" />
                        </itemtemplate>
                    </asp:templatefield>
                </Fields>
                
            </asp:DetailsView>
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="System.Web.Security.MembershipUser" SelectMethod="GetUser" TypeName="System.Web.Security.Membership">
                <SelectParameters>
                    <asp:Parameter Name="UserName" />
                </SelectParameters>
            </asp:ObjectDataSource> 
        </td> 
            
    </tr>
    <tr>
        <td>
            <table cellspacing="1" cellpadding="2" width="100%" >
                <tr>
                    <td style="width: 210px;">
                        <asp:label id="FirstNameLabel" runat="server" meta:resourcekey="FirstNameLabelResource1"></asp:label>
                    </td>
                    <td>
                        <asp:TextBox Runat="server" ID="txtBillFirst"></asp:TextBox>
                        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtBillFirst" ID="RequiredFieldValidator1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:label id="LastNameLabel" runat="server" meta:resourcekey="LastNameLabelResource1"></asp:label>
                    </td>
                    <td>
                        <asp:TextBox Runat="server" ID="txtBillLast"></asp:TextBox>
                        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtBillLast" ID="Requiredfieldvalidator5">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:label id="AddressLabel" runat="server" meta:resourcekey="AddressLabelResource1"></asp:label>
                    </td>
                    <td>
                        <asp:TextBox Runat="server" ID="txtBillAddress"></asp:TextBox>
                        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtBillAddress" ID="RequiredFieldValidator2">*</asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtBillCity" ID="RequiredFieldValidator3">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <uc1:LocationSelector id="LocationSelector1" runat="server" />

                <tr>
                    <td >
                        <asp:label id="PostalCodeLabel" runat="server" meta:resourcekey="PostalCodeLabelResource1"></asp:label>
                    </td>
                    <td>
                        <asp:TextBox Runat="server" ID="txtBillZip"></asp:TextBox>
                        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtBillZip" ID="RequiredFieldValidator6">*</asp:RequiredFieldValidator>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:label id="PhoneLabel" runat="server" meta:resourcekey="PhoneLabelResource1"></asp:label>
                    </td>
                    <td>
                        <asp:TextBox Runat="server" ID="txtBillPhone"></asp:TextBox>
                        <asp:RequiredFieldValidator Runat="server" ControlToValidate="txtBillPhone" ID="RequiredFieldValidator7">*</asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
            </table>
    	
        </td>
    </tr>