<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="Help_Default, App_Web_zmq_q979" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>


<asp:Content ID="Content1" ContentPlaceHolderID="infoZone" Runat="Server">   
    <br />
    <asp:label runat="server" meta:resourcekey="ContactResource1"></asp:label>
    <br /><br />
    <a href="ContactUs.aspx">
        <asp:label runat="server" meta:resourcekey="ContactResource2"></asp:label>
    </a>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Main2" Runat="Server">

    <h3>
        <asp:label runat="server" meta:resourcekey="HeaderResource1"></asp:label>
    </h3>
    
    <table width="99%">
        <tr style="vertical-align: top;">
            <td style="width: 50%;">
                <h4>
                    <asp:label runat="server" meta:resourcekey="ProfileHeaderResource1"></asp:label>
                </h4>
                <ul>
                    <li>
                        <a href="MyProfile.aspx#modifyinfo">
                            <asp:label runat="server" meta:resourcekey="ModifyProfileResource1"></asp:label>
                        </a>
                    </li>
                    <li>
                        <a href="MyProfile.aspx#modifypassword">
                            <asp:label runat="server" meta:resourcekey="ModifyPasswordResource1"></asp:label>
                        </a>
                    </li>
                    <li>
                        <a href="MyProfile.aspx#forgotpassword">
                            <asp:label runat="server" meta:resourcekey="ForgotPasswordResource1"></asp:label>
                        </a>
                    </li>
                    <li>
                        <a href="MyProfile.aspx#orderhistory">
                            <asp:label runat="server" meta:resourcekey="OrderHistoryResource1"></asp:label>
                        </a>
                    </li>
                </ul>
            </td>
            <td style="width: 50%;">
                <h4>
                    <asp:label runat="server" meta:resourcekey="MergeHeaderResource1"></asp:label>
                </h4>
                <ul>
                    <li>
                        <a href="Merge.aspx#merge">
                            <asp:label ID="Label1" runat="server" meta:resourcekey="MergeResource1"></asp:label>
                        </a>
                    </li>                    
                </ul>
            </td>
        </tr>
        <tr style="vertical-align: top;">
            <td>
                <h4>
                    <asp:label runat="server" meta:resourcekey="PhotoHeaderResource1"></asp:label>
                </h4>
                <ul>
                    <li>
                        <a href="PhotoProcessing.aspx#changebackground">
                            <asp:label runat="server" meta:resourcekey="ChangeBackgroundResource1"></asp:label>
                        </a>
                    </li>
                    <li>
                        <a href="PhotoProcessing.aspx#addframe">
                            <asp:label runat="server" meta:resourcekey="AddFrameResource1"></asp:label>
                        </a>
                    </li>                    
                    <li>
                        <a href="PhotoProcessing.aspx#digitalrights">
                            <asp:label runat="server" meta:resourcekey="DigitalRightsResource1"></asp:label>
                        </a>
                    </li>
                    <li>
                        <a href="PhotoProcessing.aspx#deletephoto">
                            <asp:label runat="server" meta:resourcekey="DeletePhotoResource1"></asp:label>
                        </a>
                    </li>
                </ul>
            </td>
            <td>
                <h4>
                    <asp:label runat="server" meta:resourcekey="OrderHeaderResource1"></asp:label>
                </h4>
                <ul>
                    <li>
                        <a href="Order.aspx#placeorder">
                            <asp:label runat="server" meta:resourcekey="PlaceOrderResource1"></asp:label>
                        </a>
                    </li> 
                    <li>
                        <a href="Order.aspx#paymenttype">
                            <asp:label runat="server" meta:resourcekey="PaymentTypeResource1"></asp:label>
                        </a>
                    </li>                    
                    <li>
                        <a href="MyProfile.aspx#orderhistory">
                            <asp:label runat="server" meta:resourcekey="OrderHistoryResource1"></asp:label>
                        </a>
                    </li>
                    <li>
                        <a href="Order.aspx#security">
                            <asp:label runat="server" meta:resourcekey="SecurityResource1"></asp:label>
                        </a>
                    </li>
                </ul>
            </td>
        </tr>
        <tr style="vertical-align: top;">
            <td>
                <h4><asp:Label ID="lblUploadPhotos" runat="server" meta:resourcekey="UploadPhotos" /></h4>
                <ul>
                    <li>
                        <a href="UploadPhoto.aspx#important">
                            <asp:Label ID="lblImportant" runat="server" meta:resourcekey="Important" />
                        </a>
                    </li>
                    <li>
                        <a href="UploadPhoto.aspx#thingstoknow">
                            <asp:Label ID="lblThingsToKnow" runat="server" meta:resourcekey="ThingsToKnow" />
                        </a>
                    </li>
                    <li>
                        <a href="UploadPhoto.aspx#howto">
                            <asp:Label ID="lblHowTo" runat="server" meta:resourcekey="HowTos" />
                        </a>
                    </li>
                    <li>
                        <a href="UploadPhoto.aspx#definitions">
                            <asp:Label ID="lblDefinition" runat="server" meta:resourcekey="Definitions" />
                        </a>
                    </li>
                </ul>
            </td>
            <td>
                <h4><asp:Label ID="lblPolicies" runat="server" meta:resourcekey="Policies" /></h4>
                <ul>
                    <li>
                        <a href="PurchaseConditions.aspx">
                            <asp:Label ID="PurchaseConditions" runat="server" meta:resourcekey="PurchaseConditions" />
                        </a>
                    </li>
                    <li>
                        <a href="UseConditions.aspx">
                            <asp:Label ID="UseConditions" runat="server" meta:resourcekey="UseConditions" />
                        </a>
                    </li>
                    <li>
                        <a href="Privacy.aspx">
                            <asp:Label ID="Privacy" runat="server" meta:resourcekey="Privacy" />
                        </a>
                    </li>                    
                </ul>
            </td>
        </tr>
    </table>
</asp:Content>

