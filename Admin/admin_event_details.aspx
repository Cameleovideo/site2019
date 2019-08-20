<%@ page language="VB" masterpagefile="~/Admin/admin.master" autoeventwireup="false" inherits="Admin_admin_event_details, App_Web_kw1ulmho" stylesheettheme="Admin" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">

    
    <table>
        <tr>
            <td>
                <table >
                    <tr>
                        <th>
                            Albums de fonds disponibles
                        </th>
                        <th></th>
                        <th>
                            Albums de fonds configurés
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lstAlbums" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Button ID="btnAddAlbums" runat="server" Text=">>>" OnClick="btnAddAlbums_Click" /><br />
                            <asp:Button ID="btnRemoveAlbums" runat="server" Text="<<<" OnClick="btnRemoveAlbums_Click" />
                        </td>
                        <td>
                            <asp:ListBox ID="lstEventAlbums" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table >
                    <tr>
                        <th>
                            Albums de cadres disponibles
                        </th>
                        <th></th>
                        <th>
                            Albums de cadres configurés
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lstFrameAlbums" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Button ID="btnAddFrameAlbums" runat="server" Text=">>>" OnClick="btnAddFrameAlbums_Click" /><br />
                            <asp:Button ID="btnRemoveFrameAlbums" runat="server" Text="<<<" OnClick="btnRemoveFrameAlbums_Click" />
                        </td>
                        <td>
                            <asp:ListBox ID="lstEventFrameAlbums" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table >
                    <tr>
                        <th>
                            Modes de livraison
                        </th>
                        <th></th>
                        <th>
                            Modes de livraison configurés
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lstShipMethods" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Button ID="btnAddShipMethods" runat="server" Text=">>>" OnClick="btnAddShipMethods_Click" /><br />
                            <asp:Button ID="btnRemoveShipMethods" runat="server" Text="<<<" OnClick="btnRemoveShipMethods_Click" />
                        </td>
                        <td>
                            <asp:ListBox ID="lstEventShipMethods" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
    </table>
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <table>
                    <tr>                
                        <th>
                            Catégories disponibles
                        </th>
                        <th></th>
                        <th>
                            Catégories configurées
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lstCategories" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Button ID="btnAddCategories" runat="server" Text=">>>" OnClick="btnAddCategories_Click" /><br />
                            <asp:Button ID="btnRemoveCategories" runat="server" Text="<<<" OnClick="btnRemoveCategories_Click" />
                        </td>
                        <td>
                            <asp:ListBox ID="lstEventCategories" runat="server" Width="200" Height="250" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                    </tr>
                
                    <tr>
                        <td colspan="3">
                            <table>
                                <tr>
                                    <th>
                                        Produits disponibles
                                    </th>            
                                    <th>
                                        Prix configurés
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="lstProducts" AutoPostBack="True"  runat="server">
                                        </asp:DropDownList>                
                                    </td>            
                                    <td>
                                        <asp:GridView ID="detailsProducts" runat="server" AutoGenerateEditButton="true" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="ObjectDataSource1">
		                                    <Columns>			            
			                                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" Visible=False />
			                                    <asp:BoundField DataField="ModelNumber" HeaderText="ModelNumber" SortExpression="ModelNumber" ReadOnly="True"/>
			                                    <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName" ReadOnly="True"/>
			                                    <asp:BoundField DataField="UnitCost" HeaderText="DefaultUnitCost" SortExpression="UnitCost" ReadOnly="True"/>
			                                    <asp:BoundField DataField="ConfiguredUnitCost" HeaderText="ConfiguresUnitCost" SortExpression="ConfiguredUnitCost" />
	                                       </Columns>            		
	                                    </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                </table>
            </td>
            <td>
                <table>
                    <tr>                
                        <th>
                            Albums à partager
                        </th>                        
                        <th>
                            
                        </th>
                        <th>
                            Users 
                        </th>
                        
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lstAlbumsToShare" runat="server" Width="200" Height="250"></asp:ListBox>
                        </td>     
                        <td>
                            Groupe: <asp:TextBox ID="txtSubjectGroup" runat="server"></asp:TextBox>
                            <br />
                            Users de: <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox> <br />
                            à <asp:TextBox ID="txtTo" runat="server"></asp:TextBox><br />
                            
                            <asp:Button ID="btnRefreshUsers" onclick="btnRefreshUsers_click" runat="server" Text="refresh" />
                            <br /><br />
                            
                            PhotographUsername : <asp:TextBox ID="txtPhotographUserName" runat="server"></asp:TextBox><br />
                            
                            
                            <asp:CheckBox ID="chkGroupPhotoId" runat="server" Text="Photo de groupe" TextAlign="Left" />
                            PhotoID: <asp:TextBox ID="txtGroupPhotoID" runat="server"></asp:TextBox><br />
                            
                            <asp:Button ID="btnShareAlbum" runat="server" Text="Créer les albums" onclick="btnShareAlbum_click"/>
                        </td>                                         
                        <td>
                            <asp:GridView ID="gvUsersToShare" runat="server" AutoGenerateColumns="False" CellPadding="4" datakeynames="username"
                                 ForeColor="#333333" GridLines="None" >
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <Columns>                                    
                                    <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                                    <asp:BoundField DataField="SubjectGroup" HeaderText="Group" ReadOnly="True" SortExpression="SubjectGroup" />
                                    <asp:BoundField DataField="AlbumID" HeaderText="AlbumID" ReadOnly="True" SortExpression="AlbumID" />
                                </Columns>
                                <RowStyle BackColor="#E3EAEB" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </td>                        
                    </tr>                    
                </table>
            </td>
        </tr>
    </table>
    
    <br /><br />
    
    
    
    
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="CatalogManager"
		SelectMethod="GetEventProductsByCategory"
		UpdateMethod="UpdateEventProduct">
		<SelectParameters>
	        <asp:controlparameter Name="CategoryID" Type="Int32" controlid="lstProducts" propertyname="SelectedItem.Value" DefaultValue="14"/>
	        <asp:QueryStringParameter Name="EventUserName" QueryStringField="UserName" />
	        <asp:Parameter name="locale"  DefaultValue="fr"/>
        </SelectParameters>
		<UpdateParameters>		    
	        <asp:QueryStringParameter Name="EventUserName" QueryStringField="UserName" />
		</UpdateParameters>
	</asp:ObjectDataSource>

</asp:Content>

