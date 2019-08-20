<%@ page validaterequest="false" language="vb" masterpagefile="admin.master" autoeventwireup="true" inherits="admin_order_details, App_Web_kw1ulmho" title="Order details" stylesheettheme="Admin" enableEventValidation="false" %>
<%@ Register Src="../Modules/ResultMessage.ascx" TagName="ResultMessage" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminPlaceHolder" Runat="Server">
    <h1>
        Order Detail<br />
    </h1>

    <uc1:ResultMessage ID="uResult" runat="server" visible="false" />

    <table border="0" cellpadding="0" cellspacing="0" width="100%" >
        <tr>
            <td valign="top">    
	            <table cellspacing="1" cellpadding="2" width="100%" bgcolor="white">
		            <tr>
				        <td height="25"  class="sectionheader">
				            <b>Administrative Detail</b>
				        </td>
				        <td height="25"  class="sectionheader">
				            <b>Suivi</b>
				        </td>
			        </tr>
			        <tr >
				        <td >
					        <table class="admin">
						        <tr class="d0">
							        <td style="width: 131px" valign="top">
								        Order ID:
						            </td>
							        <td valign="top">
								        <b><asp:Label ID="lblID" ForeColor="red" runat="server" Text=""></asp:Label></b>
                                        <asp:LinkButton ID="btnShowReceipt" runat="server" OnClick="btnShowReceipt_Click">Reçu</asp:LinkButton>
							        </td>
						        </tr>
						        <tr class="d1"> 
							        <td style="width: 131px" valign="top">
								        Username:
						            </td>
							        <td valign="top">							        
								        <b><asp:HyperLink ID="lnkUserName" runat="server" Text=""></asp:HyperLink></b>
							        </td>
						        </tr>
						        <tr class="d0">
							        <td style="width: 131px" valign="top">
								        User Email:
						            </td>
							        <td valign="top">
								        <b><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></b>
							        </td>
						        </tr>
						        <tr class="d1">
							        <td style="width: 131px" valign="top">
								        User Phone:
						            </td>
							        <td valign="top">
								        <b><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></b>
							        </td>
						        </tr>
						        <tr class="d0">
							        <td valign="top" style="width: 131px">
								        Status:
							        </td>
							        <td valign="top" >
							            <asp:DropDownList ID="cboOrderStatus" runat="server" ></asp:DropDownList>							            
							        </td>
							        <td valign="top" >							            
							            <asp:Button ID="btnSetStatus" runat="server" Text="SetStatus" OnClick="btnSetStatus_Click" Width="100"/>								        
							        </td>
						        </tr>
						        <tr class="d1">
							        <td valign=top >
							            Issue Refund:
							        </td>
							        <td>
							        </td>
							        <td valign=top>
								        <asp:Button ID="btnRefundFull" runat="server" Text="Refund" OnClick="btnRefundFull_Click" Width="100"/>
							        </td>
						        </tr>
						        <tr class="d0">
							        <td valign="top">
								        Mark as Shipped:
							        </td>
							        <td>
								        Shipped Date:
								        <asp:TextBox ID="txtShipDate" runat="server" ></asp:TextBox>
								        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtShipDate"
									        Display="Dynamic" ErrorMessage="Invalid Date" MaximumValue="2050/1/1" MinimumValue="1990/1/1"
									        Type="Date"></asp:RangeValidator>
								        Tracking Number:
								        <asp:TextBox ID="txtTrackingNumber" runat="server"></asp:TextBox>
							        </td>
							        <td>								        
								        <asp:Button ID="btnSetShipped" runat="server" Text="Shipped" OnClick="btnSetShipped_Click" Width="100"/>
							        </td>
						        </tr>		   
				            </table>               
				        </td>
				        <td >
				            <table class="admin" width="100%" >
						        <tr class="d0">
							        <td valign="top" style="width: 50px">
								        Suivi requis:
							        </td>			
							        <td>
                                        <asp:CheckBox ID="chkFollowup" AutoPostBack="true" runat="server" OnCheckedChanged="chkFollowup_CheckedChanged"/>
							        </td>				        
						        </tr>
						        <tr >
							        <td valign="top" >
							            Notes:
							        </td>	
							        <td>
                                        <asp:TextBox ID="txtNewNote" Columns="75" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnAddNote" runat="server" Text="Add Note" OnClick="btnAddNote_Click"/><br /><br />
                                        
							        </td>						        
						        </tr>	
						        <tr>
						            <td colspan="2">
						                <asp:GridView ID="dgNotes" DataSourceID="ObjectDataSource1" Runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="OrderNoteID" CssClass="">
					                        <AlternatingRowStyle BackColor="LightGray" />
					                        <Columns>
					                            <asp:BoundField DataField="Date" HeaderText="Date">
					                                <ItemStyle Width="25%"/>
					                            </asp:BoundField>
						                        <asp:BoundField DataField="Note" HeaderText="Note">
						                        </asp:BoundField>
					                        </Columns>
				                        </asp:GridView>	
						            </td>
						        </tr>
						        <tr >
							        <td valign="top" >
							            Reorder:
							        </td>	
							        <td>
							            <asp:TextBox ID="txtReorderReason" Columns="75" runat="server"></asp:TextBox>                                        
                                        <asp:Button ID="btnReorder" runat="server" Text="Reorder" OnClick="btnReorder_Click"/><br /><br />
							        </td>						        
						        </tr>
				            </table>
				        </td>
			        </tr>       
	            </table>
		           <br />
		        <table width=100%>
		            <tr>
				        <td height="25"  class="sectionheader" colspan="2">
				            <b>Order Details</b>
				        </td>
			        </tr>
			        <tr>
				        <td bgColor="white">
					        <asp:GridView ID="dgItems" Runat="server" AutoGenerateColumns="False" Width="100%" datakeynames="photoID, productID">
						        <EmptyDataTemplate>
							        &nbsp;-- No items  --
						        </EmptyDataTemplate>
						        <Columns>
							        <asp:BoundField DataField="productID" Visible="False"></asp:BoundField>
							        <asp:BoundField HeaderText="Number" DataField="modelNumber"></asp:BoundField>
							        <asp:BoundField HeaderText="Item" DataField="modelName"></asp:BoundField>
							        <asp:TemplateField HeaderText="Aperçu">			                            
			                            <ItemTemplate>
				                            <img src="../Handler.ashx?PhotoID=<%# Eval("PhotoID") %>&Size=S"  class="photo_198"  alt='<%# Eval("PhotoID") %>' />
			                            </ItemTemplate>
			                        </asp:TemplateField>	
							        <asp:BoundField HeaderText="Event" DataField="EventUserName"></asp:BoundField>
							        <asp:BoundField HeaderText="Photograph" DataField="PhotographUserName"></asp:BoundField>
							        <asp:BoundField HeaderText="Client" DataField="ClientUserName"></asp:BoundField>
							        <asp:BoundField HeaderText="Lab" DataField="LabUserName"></asp:BoundField>
							        <asp:BoundField HeaderText="FirstName" DataField="SubjectFirstName"></asp:BoundField>
							        <asp:BoundField HeaderText="LastName" DataField="SubjectLastName"></asp:BoundField>
							        <asp:BoundField HeaderText="Email" DataField="SubjectEMail"></asp:BoundField>
							        <asp:BoundField HeaderText="group" DataField="SubjectGroup"></asp:BoundField>
							        <asp:TemplateField HeaderText="Quantity">			                            
			                            <ItemTemplate>
				                            <asp:TextBox id="txtQuantity" runat="server"  Text='<%#Eval("quantity")%>'  autopostback="True" causesvalidation="True" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
				                            <asp:RangeValidator id="RangeValidator2" runat="server" meta:resourcekey="RangeValidator1Resource1"
					                            ControlToValidate="txtQuantity"  MinimumValue="0" MaximumValue="1000000" Type="Integer" Display="Dynamic">
					                            *
				                            </asp:RangeValidator>
			                            </ItemTemplate>
			                        </asp:TemplateField>
							        
							        <asp:TemplateField HeaderText="UnitPrice">
			                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
			                            <ItemTemplate>
				                            <asp:TextBox id="txtPrice" runat="server" Text='<%#Eval("price")%>' Columns="10" autopostback="True" causesvalidation="True" OnTextChanged="txtUnitPrice_TextChanged"></asp:TextBox>
				                            <asp:RangeValidator id="RangeValidator1" runat="server" ControlToValidate="txtPrice" MinimumValue="-1000" Type="Double" Display="Dynamic">
				                                *
				                            </asp:RangeValidator>
			                            </ItemTemplate>
			                        </asp:TemplateField>							        
							        <asp:BoundField HeaderText="Total" DataField="LineTotal" DataFormatString="{0:c}" HtmlEncode="false">
								        <ItemStyle HorizontalAlign="Right"></ItemStyle>
							        </asp:BoundField>
						        </Columns>
					        </asp:GridView>
        					
				        </td>
			        </tr>
			        <tr>
				        <td>
					        <table width="100%">
					            <tr>
							        <td align="right">
							            Tax:
							        </td>
							        <td width="100" style="text-align: right;">
								        <asp:Label ID="lblTax" Runat="server"></asp:Label>
							        </td>
						        </tr>
						        <tr>
							        <td align="right">
							            Shipping:
							        </td>
							        <td width="100" style="text-align: right;">
								        <asp:Label ID="lblShipping" Runat="server"></asp:Label>
							        </td>
						        </tr>
						        <tr>
							        <td align="right">
							            <b>Total:</b>
							        </td>
							        <td width="100" style="text-align: right;">
								        <b><asp:Label ID="lblTotal" Runat="server"></asp:Label></b>
							        </td>
						        </tr>
				            </table>
				        </td>
			        </tr>
		        </table>      
		         <br />
        	   
		        <table cellspacing="1" cellpadding="2"  >
			        <tr >
				        <td height="25"  class="sectionheader">
				            <b>Shipping Information</b>
				        </td>
				        <td height="25"  class="sectionheader">
				            <b>Billing Information</b>
				        </td>
			        </tr>
			        <tr >
				        <td>
					        <table class="admin">						        
					            <tr class="d0">
							        <td valign="top" style="width: 131px">
							            Shipping Method:
							        </td>
							        <td valign="top">
								        <asp:Label ID="lblShippingMethod" runat="server" Text="Label"></asp:Label><br />
								        Nouveau mode de shipping: 
								        <asp:DropDownList Runat="server" ID="lstShipService">
                                        </asp:DropDownList>
                                        <asp:LinkButton ID="btnChangeShipping" runat="server" OnClick="btnUpdateShipping_Click1">Modifier</asp:LinkButton>
							        </td>
						        </tr>               
						        <tr class="d1">
							        <td valign="top" style="width: 131px; height: 41px;">
							            Shipping Address:
							        </td>
							        <td valign="top" style="height: 41px">
								        <asp:TextBox ID="txtShippingAddress" runat="server" TextMode="MultiLine" Height="96px" Width="585px"></asp:TextBox><br />
								        <asp:Button ID="btnUpdateShipping" runat="server" Text="UpdateAddress" OnClick="btnUpdateShipping_Click" /><br />
							        </td>
						        </tr>
				            </table>               
				        </td>
				        <td >
					        <table  class="admin">
						        <tr class="d0"> 
							        <td valign="top" style="width: 131px">
							            Payment Method:
							        </td>
							        <td valign="top">
								        <asp:DropDownList ID="cboPaymentMethod" runat="server" ></asp:DropDownList>							            
						            </td>
						            <td valign="top">
						                <asp:Button ID="btnSetPaymentMethod" runat="server" Text="SetPayMethod" OnClick="btnSetPaymentMethod_Click" />
						            </td>
						        </tr>
					           <tr class="d1">
							        <td valign="top" style="width: 131px">
							            Transaction ID:
							        </td>
							        <td valign="top">
                                        <asp:TextBox ID="txtTransactionID" runat="server"></asp:TextBox>                                        
							        </td>
							        <td valign="top">
							            <asp:Button ID="btnUpdateTransactionID" runat="server" Text="Update" OnClick="btnUpdateTransactionID_Click" Width="120"/><br />
								        <asp:Label ID="lblTransactionID" runat="server" Text=""></asp:Label>
						            </td>
						        </tr>               
				            </table>               
				        </td>
			        </tr>
		        </table>

                
	        </td>
	    </tr>
    </table>

    <script>
        function CheckRefund(){		
	        return confirm("Refund this transaction? This action cannot be undone...");
        }
    </script>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="OrdersManager"  
        SelectMethod="GetNotes" InsertMethod="AddNote">
        
        <InsertParameters>
	        <asp:QueryStringParameter Name="OrderID" QueryStringField="t" Type="Int32"  />		    
	        <asp:ControlParameter  Name="Note" ControlID="txtNewNote" PropertyName="text"/>		    
	    </InsertParameters>
	    
	    <SelectParameters>
	        <asp:QueryStringParameter Name="OrderID" QueryStringField="t" Type="Int32"  />		    
	    </SelectParameters>
    </asp:ObjectDataSource>
    
    

</asp:Content>

