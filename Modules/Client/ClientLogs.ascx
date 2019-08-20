<%@ control language="VB" autoeventwireup="false" inherits="Modules_Client_ClientLogs, App_Web_xsmy-jkx" %>
<br />
<asp:Panel runat="server" ID="panelLogs" >
<ajaxToolkit:Accordion ID="Logs" runat="server" SelectedIndex="-1" 
    HeaderCssClass="accordionHeader" ContentCssClass="accordionContent"
    FadeTransitions="true" FramesPerSecond="40" TransitionDuration="200" width="1615px" 
    AutoSize="none" RequireOpenedPane="false" SuppressHeaderPostbacks="true">
    <Panes>                                
        <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server"  >
            <Header>                                
                > Logs                                                               
            </Header>
            <Content>                                                                   
                <div style="overflow:auto;height:200px" >                                
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
                </div>
            </Content>   
        </ajaxToolkit:AccordionPane>  
    </Panes>
</ajaxToolkit:Accordion> 
</asp:Panel>
<ajaxToolkit:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server"
    TargetControlID="PanelLogs"
    Color="#8CC63F"
    Radius="8"
    Corners="top" />
    
<asp:ObjectDataSource ID="odsLogs" runat="server" TypeName="CameleoUtility.Log"  SelectMethod="GetLogsByItemID" >
    <SelectParameters>
        <asp:Parameter Name="ItemID" />
    </SelectParameters>        
</asp:ObjectDataSource>