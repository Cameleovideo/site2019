<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ClientContractItems, App_Web_xsmy-jkx" %>
<%@ Register Src="~/Modules/ContractItems/CI_NbSubjects.ascx" TagName="CINbSubjects" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_NbPoses.ascx" TagName="CINbPoses" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_GreenScreen.ascx" TagName="CIGreenScreen" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_ShipToSchool.ascx" TagName="CIShipToSchool" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_FamilyPictures.ascx" TagName="CIFamilyPictures" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_GraduatePictures.ascx" TagName="CIGraduatePictures" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_GroupPicture.ascx" TagName="CIGroupPicture" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_GPI.ascx" TagName="CIGPI" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_AlbumCD.ascx" TagName="CIAlbumCD" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_GroupComposite.ascx" TagName="CIGroupComposite" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_PersonelGift.ascx" TagName="CIPersonelGift" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_VoluntaryGift.ascx" TagName="CIVoluntaryGift" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_IDCards.ascx" TagName="CIIDCards" TagPrefix="uc2" %>
<%@ Register Src="~/Modules/ContractItems/CI_Return.ascx" TagName="CIReturn" TagPrefix="uc2" %>

<br />
<asp:Panel runat="server" ID="panelContractItems" >    
    <ajaxToolkit:Accordion ID="Contract" runat="server" SelectedIndex="0" 
        HeaderCssClass="accordionHeader" ContentCssClass="accordionContent" 
        FadeTransitions="true" FramesPerSecond="40" TransitionDuration="200" width="1615px" 
        AutoSize="none" RequireOpenedPane="false" SuppressHeaderPostbacks="true" >
        <Panes>                                        
            <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server"  >
                <Header>                                
                    > Contrat
                </Header>
                <Content>                                                                                   
                        <asp:ImageButton ID="btnSaveContract" runat="server" ImageUrl="~/App_Themes/Admin/Images/sauvegarder.png" style="background-color:White;padding:10px" OnClick="btnSaveContract_Click" ValidationGroup="ContractItems" />
                        
                        <ajaxToolkit:Accordion ID="ContractItems" runat="server" SelectedIndex="-1"  
                            HeaderCssClass="accordionHeader" ContentCssClass="accordionContent" style="padding-left:10px"
                            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="200" width="98%" 
                            AutoSize="none" RequireOpenedPane="false" SuppressHeaderPostbacks="true" >
                            <Panes>
                                <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server"  >
                                    <Header>                                
                                        >> Logs
                                    </Header>
                                    <Content>
                                        <asp:GridView ID="gvLogs" runat="server" DataSourceID="odsLogs" Width="98%" GridLines="None"
                                            AllowPaging="False" AllowSorting="False" AutoGenerateColumns="false" BackColor="transparent" borderstyle="None">
                                            <HeaderStyle ForeColor="#00713d" BackColor="transparent" HorizontalAlign="Left"/>
                                            <Columns>			                                
                                                <asp:BoundField  DataField="logID" HeaderText="ID">                
                                                </asp:BoundField>	        
                                                <asp:BoundField  DataField="category" HeaderText="Catégorie">                
                                                </asp:BoundField>	                    
                                                <asp:BoundField  DataField="username" HeaderText="UserName">
                                                </asp:BoundField>	                    
                                                <asp:BoundField  DataField="message" HeaderText="Message">                
                                                </asp:BoundField>	        
                                                <asp:BoundField  DataField="event" HeaderText="Event">
                                                </asp:BoundField>	                                                        
                                                <asp:BoundField  DataField="logDate" HeaderText="Date">                
                                                </asp:BoundField>	        
                                            </Columns>
                                        </asp:GridView>
                                    </Content>   
                                </ajaxToolkit:AccordionPane>                                  
                            </Panes>
                        </ajaxToolkit:Accordion> 
                        <div style="padding-left:10px;width:98%">
                            <uc2:CINbSubjects id="ucNbSubjects" runat="server"/>
                            <uc2:CINbPoses id="ucNbPoses" runat="server"/>
                            <uc2:CIGreenScreen id="ucGreenScreen" runat="server"/>
                            <uc2:CIShipToSchool id="ucShipToSchool" runat="server"/>
                            <uc2:CIFamilyPictures id="ucFamilyPictures" runat="server"/>
                            <uc2:CIGraduatePictures id="ucGraduatePictures" runat="server"/>
                            <uc2:CIGroupPicture id="ucGroupPicture" runat="server"/>
                            <uc2:CIGPI id="ucGPI" runat="server"/>
                            <uc2:CIAlbumCD id="ucAlbumCD" runat="server"/>
                            <uc2:CIGroupComposite id="ucGroupComposite" runat="server"/>
                            <uc2:CIPersonelGift id="ucPersonelGift" runat="server"/>
                            <uc2:CIVoluntaryGift id="ucVoluntaryGift" runat="server"/>
                            <uc2:CIIDCards id="ucIDCards" runat="server"/>
                            <uc2:CIReturn id="ucReturn" runat="server"/>
                        </div>
                    
                </Content>   
            </ajaxToolkit:AccordionPane>            
        </Panes>
    </ajaxToolkit:Accordion>     
</asp:Panel>
<ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server"
    TargetControlID="PanelContractItems"
    Color="#8CC63F"
    Radius="8"
    Corners="top" />
    
<asp:ObjectDataSource ID="odsLogs" runat="server" TypeName="CameleoUtility.Log"  SelectMethod="GetLogsByItemID" >
    <SelectParameters>
        <asp:Parameter Name="ItemID" />
        <asp:Parameter Name="Category" />
    </SelectParameters>        
</asp:ObjectDataSource>