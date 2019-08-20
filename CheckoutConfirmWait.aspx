<%@ page language="VB" masterpagefile="~/general.master" autoeventwireup="false" inherits="CheckoutConfirmWait, App_Web_-wqcg8fv" title="Untitled Page" enableEventValidation="false" stylesheettheme="White" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main2" Runat="Server">

    <table style="width: 90%;">
        <tr>
            <td style="text-align: center;">
                <h4>
                    <b><asp:label forecolor="red" runat="server" meta:resourcekey="WaitMessageResource1"></asp:label></b>
                </h4>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <img src="images/wait.gif" style="border-right: #000000 2px solid; border-top: #000000 2px solid; border-left: #000000 2px solid; border-bottom: #000000 2px solid;"/>
            </td>
        </tr>
    </table>   
    
<%
    Response.Flush()
    
    'Order ID
    Dim orderID As Integer = Request("OrderID")
    
    ' is this a resubmit (back from payment page for example)?
    If orderID = Session("LastOrderID") Then
        'Yes
        
        'Go back to checkoutpage
        Response.Redirect("CheckoutConfirm.aspx", False)
    Else
        'Else, continue with checkout
        Dim cart As ShoppingCart = ShoppingCartManager.GetCart

        'Keep submitted orderid to prevent resubmit
        Session("LastOrderID") = orderID
    End If
    
    
%>
<script language="javascript" type="text/javascript">
    location.href = "<%= Session("PaymentURL")%>";
</script> 

</asp:Content>

