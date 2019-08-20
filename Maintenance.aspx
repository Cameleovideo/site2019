<%@ page language="VB" autoeventwireup="false" inherits="Maintenance, App_Web_uzpgk440" enableEventValidation="false" stylesheettheme="White" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Page de maintenance / Maintenance page</title>
</head>
<body bgproperties="fixed" background="images/maintain.jpg">
    <br><br>
    <div align="center">
      <center>
      <table border="2" cellpadding="6" cellspacing="0" style="border-collapse: collapse" bordercolor="#000000" width="490" id="AutoNumber1" bgcolor="#FFFFFF">
        <tr>
            <td align=left>
                <a href="http://www.cameleophoto.com"><img src="Images/cameleo-logo-AvecTexte.gif" border="0"></a>
            </td>
        <tr>
            <td>
                <p align="center"><b><font face="Verdana, Arial" size="6">MAINTENANCE</font></b>
            </td>
        </tr>        
        <tr>
          <td>
              Nous effectuons présentement une opération de maintenance 
              sur nos serveurs. L'application sera inaccessible pendant 
              quelques temps. Nous sommes désolés des inconvénients.<br>
              <br>
              
              <asp:Label ID="Label2" runat="server" BackColor="red" ForeColor="white">Retour en ligne estimée: 2009-07-08 19h<br /><br /></asp:Label>
              
              Caméléo Photo - Révolutionne le monde de la photographie numérique.<br>
              
          </td>
        </tr>
        <tr>
          <td>
              The server is being maintained or being upgraded. The site will
              be unavailable for a short time. We apologize for the inconvenience 
              it has caused you.<br>
              <br>
              
              <asp:Label ID="Label1" runat="server" BackColor="red" ForeColor="white">Estimated maintenance end time: 2009-07-08 7 pm<br /><br /></asp:Label>
              
              Cameleo Photo - Revolutionizes digital photography.<br>
              
          </td>
        </tr>
      </table>
      </center>
    </div>
    <p>&nbsp;</p>

</body>
</html>
