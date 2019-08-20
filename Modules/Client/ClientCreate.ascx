<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ClientCreate, App_Web_xsmy-jkx" %>


    <asp:Panel runat="server" ID="panelAddClient" Width="1000" >
        <asp:Panel runat="server" ID="panel1" CssClass="accordionHeader2" >
            <div style="background-color: #00713d;">
                <table>
                    <tr>
                        <td align="left">
                            <asp:Label runat="server" ID="textLabel" ForeColor="#8CC63F" Font-Bold="false" Text="Créer un client" />
                        </td>                    
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="panel2" BorderStyle="Dashed" BorderWidth="1" style="border-top:none;" >
            <div style="background-color: white;">
                 <table  cellspacing="1" cellpadding="2">        
                    <tr align="left">
                        <th>
                            <asp:label id="lblCameleoRep" ForeColor="#00713d" runat="server" text="Directeur de compte (Caméléo)"></asp:label>
                        </th>
                        <th>
                            <asp:label id="lblPhotograph" ForeColor="#00713d" runat="server" text="Directeur de compte (Territoire)"></asp:label>
                        </th>   
                        <th>
                            <asp:label id="lblClientType" ForeColor="#00713d" runat="server" text="Type d'établissement"></asp:label>
                        </th>    
                        <th>
                            <asp:label id="ClientNameLabel"  ForeColor="#00713d" runat="server" text="Nom"></asp:label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtClientName" Text="***" runat="server"></asp:RequiredFieldValidator>
                        </th>  
                        <th>
                            <asp:label id="lblParentOrganization"  ForeColor="#00713d" runat="server" Text="Comission scolaire, faculté ou association"></asp:label>
                        </th>    
                        <th>
                            <asp:label id="lblClientCategory" ForeColor="#00713d" runat="server" text="Catégorie de client"></asp:label>
                        </th>       
                    </tr>        
                    <tr>
                        <td >
                            <asp:DropDownList ID="lstCameleoRep" runat="server" Width="100%" >
                            </asp:DropDownList>                  
                        </td>
                        <td>
                            <asp:DropDownList ID="lstPhotograph" runat="server"  Width="100%">
                            </asp:DropDownList>                  
                        </td>
                        <td>
                            <asp:DropDownList  ID="lstClientTypes" runat="server" Width="100%" DataTextField="ClientType" DataValueField="ClientTypeID" OnSelectedIndexChanged="lstClientTypes_SelectedIndexChanged" AutoPostBack="true" >
                            </asp:DropDownList>                  
                        </td>
                        <td>
                            <asp:TextBox Runat="server" ID="txtClientName" ></asp:TextBox>                                            
                        </td>
                        <td>
                            <asp:DropDownList  ID="lstParentOrganization" Width="100%" runat="server" DataTextField="Name" DataValueField="OrganizationID" >
                            </asp:DropDownList>                            
                        </td>
                         <td>
                            <asp:DropDownList ID="lstClientCategories" Width="100%" runat="server" >
                            </asp:DropDownList>                  
                        </td>
                    </tr>   
                    <tr>
                        <td colspan="6">                  
                            <asp:ImageButton ID="btnInsert" runat="server"  OnClick="btnInsert_Click" ImageUrl="~/App_Themes/Admin/Images/ajouter.png" />
                        </td>
                    </tr> 
                </table> 
            </div>
        </asp:Panel>
        
        
    </asp:Panel>
    
    <ajaxToolkit:RoundedCornersExtender ID="rcePanelAddClient" runat="server"
        TargetControlID="panelAddClient"
        Color="#00713d"
        Radius="8"
        Corners="top" />
        
    
    