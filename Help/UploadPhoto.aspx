<%@ page language="VB" masterpagefile="~/mastercart.master" autoeventwireup="false" inherits="Help_UploadPhoto, App_Web_zmq_q979" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="infoZone" Runat="Server">
    <br />
    <asp:label ID="Label1" runat="server" meta:resourcekey="ContactResource1"></asp:label>
    <br /><br />
    <a href="ContactUs.aspx">
        <asp:label ID="Label2" runat="server" meta:resourcekey="ContactResource2"></asp:label>
    </a>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Main2" Runat="Server">
    <h3>
        <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1"/>
    </h3>
    
    <table width="95%">
        <tr style="vertical-align: top;">
            <td>
                <a name="howto" ></a>
                <asp:Label ID="lblHowTo" runat="server" meta:resourcekey="lblHowTo" />
                <ol>
                    <li>
                        <a href="<%=Utility.GetSiteRoot()%>/admin/gallery/Albums.aspx">
                            <asp:Label ID="lblStep1" runat="server" meta:resourcekey="lblStep1" />
                        </a>
                    </li>
                    <li><asp:Label ID="lblStep2" runat="server" meta:resourcekey="lblStep2" /></li>
                    <li><asp:Label ID="lblStep3" runat="server" meta:resourcekey="lblStep3" /></li>
                    <li><asp:Label ID="lblStep4" runat="server" meta:resourcekey="lblStep4" /></li>
                </ol>
                
                <hr /><br /><br />
                
                <a name="important" ></a>
                <asp:Label ID="lblImportant" runat="server" meta:resourcekey="lblImportant" />
                <ul>
                    <li><asp:Label ID="lblImportant1" runat="server" meta:resourcekey="lblImportant1" /></li>
                    <li><asp:Label ID="lblImportant2" runat="server" meta:resourcekey="lblImportant2" /></li>
                </ul>
                
                <a name="thingstoknow" ></a>
                <asp:Label ID="lblToKnow" runat="server" meta:resourcekey="lblToKnow" />
                <p><asp:Label ID="lblToKnow1" runat="server"  meta:resourcekey="lblToKnow1" /></p>
                <p><asp:Label ID="lblToKnow2" runat="server"  meta:resourcekey="lblToKnow2" /></p>
                <p><asp:Label ID="lblToKnow3" runat="server"  meta:resourcekey="lblToKnow3" /></p>
                <p><asp:Label ID="lblToKnow4" runat="server"  meta:resourcekey="lblToKnow4" /></p>
                
                <br /><br />

                <a name="definitions" ></a>
                <asp:Label ID="lblDefinitions" runat="server" meta:resourcekey="lblDefinitions" />
                <dl>
                    <dt><asp:Label ID="lblPixels" runat="server" Text="Label" meta:resourcekey="lblPixels" /></dt>
                    <dd><asp:Label ID="lblPixelsDef" runat="server" Text="Label" meta:resourcekey="lblPixelsDef" /></dd>
                    <dt><asp:Label ID="lblResolution" runat="server" Text="Label" meta:resourcekey="lblResolution" /></dt>
                    <dd><asp:Label ID="lblResolutionDef" runat="server" Text="Label" meta:resourcekey="lblResolutionDef" /></dd>
                </dl>
            </td>
        </tr>
    </table>    
</asp:Content>
