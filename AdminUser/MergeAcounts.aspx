<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="AdminUser_MergeAcounts, App_Web_agak0ybl" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">
    <h3>
        <asp:literal meta:resourcekey="MergeAcountsHeaderResource1" runat="server"></asp:literal>
    </h3> 
    
    <div>
        <asp:literal meta:resourcekey="DescriptionResource1" runat="server"></asp:literal> 
        <asp:Label runat="server" meta:resourcekey="DescriptionResource2"  ForeColor="red"></asp:Label>
    </div><br /><br />
    
    <asp:panel defaultbutton="linkMergeAcounts" runat="server">
        <table style="width: 95%;">          
            <tr>                    
                <th align="left" colspan="2">
                    <asp:literal meta:resourcekey="DestinationResource1" runat="server"></asp:literal>                            
                </th>
            </tr>
            <tr>                        
                <td>
                    <asp:literal meta:resourcekey="DestinationUserNameResource1" runat="server"></asp:literal>                                                    
                </td>
                <td>
                    <asp:textbox id="UserName" cssclass="textbox" width="150" runat="server"></asp:textbox>
                    <asp:requiredfieldvalidator	runat="server" id="UserNameRequired" controltovalidate="UserName" >*</asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>                        
                <td>
                    <asp:literal meta:resourcekey="DestinationPasswordResource1" runat="server"></asp:literal>                            
                </td>
                <td>
                    <asp:textbox id="Password" cssclass="textbox" width="150" textmode="Password" runat="server" ></asp:textbox>
                    <asp:requiredfieldvalidator	runat="server" id="PasswordRequired" controltovalidate="Password">*</asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="color: red;">
                    <asp:Label ForeColor="red" id="errorMessage" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <asp:Label ForeColor="red" id="successMessage" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:linkbutton id="linkMergeAcounts" runat="server" CausesValidation="True" meta:resourcekey="MergeLinkResource1"></asp:linkbutton>                
                </td>
            </tr>
            
            <tr id="trConfirm" runat="server" visible="false">
                <td colspan="2">
                    <br />
                    <asp:Label ID="lblConfirm"  ForeColor="red" runat="server" meta:resourcekey="lblConfirmResource1"></asp:Label><br /><br />
                    <asp:Button ID="btnContinue" runat="server" Text="OK" onclick="btnContinue_Click" CausesValidation="false"/>
                    <asp:Button ID="btnCancel" runat="server" meta:resourcekey="btnCancelResource1" onclick="btnCancel_Click" CausesValidation="false"/>
                </td>
            </tr>
                    
        </table>
    </asp:panel>
    
    
</asp:Content>

