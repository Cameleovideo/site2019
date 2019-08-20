<%@ page language="VB" autoeventwireup="false" inherits="indexca, App_Web_uzpgk440" enableEventValidation="false" stylesheettheme="White" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head id="Head1" runat="server">
	<title>
        
    </title>
	<meta http-equiv="ImageToolBar" content="no"> 
	
	<link rel="SHORTCUT ICON" href="favicon.ico">
</head>

    
<body>
    <form id="form1" runat="server">  
        <div class="header">
            <asp:imagemap id="Shop"  runat="Server" ImageUrl="App_Themes/White/Images/header_neutral.gif">                    
                <asp:rectanglehotspot navigateurl="Default.aspx" bottom="60" right="215" AlternateText="Cameleo Photo">           
                </asp:rectanglehotspot> 
            </asp:imagemap> 
        </div> 
            
        <div>
            <div>
                <br /><br />
                <asp:ImageMap ID="mapCameleo" runat="server" OnClick="mapCameleo_Click" ImageUrl="~/Images/bulle-canada.png" HotSpotMode="PostBack">                    
                    <asp:RectangleHotSpot PostBackValue="en" AlternateText="english" Left="193" Bottom="74" Right="279" Top="93"/>
                    <asp:RectangleHotSpot PostBackValue="fr" AlternateText="français" Left="193" Bottom="95" Right="279" Top="113"/>
                    <asp:RectangleHotSpot PostBackValue="cancel" AlternateText="" Left="264" Bottom="36" Right="289" Top="54"/>
                </asp:ImageMap>                
                <br /><br /><br />                
            </div>            
        </div>
        
        <div class="footerbg">
            <div class="footer">
                <table style="width: 95%;">                
                    <tr>
                        <td align="left"><br />
                            <a target="_blank" href="http://www.cameleophoto.com"><font color="#000000">http://www.cameleophoto.com</font></a>                            
                            
                        </td>
                        <td align="right" ><br />
                            <a href="mailto:info@cameleophoto.com"><font color="#000000">info@cameleophoto.com</font></a>                            
                        </td>
                    </tr>
                </table>                
            </div>
        </div>

    
    </form>
    
    <script type="text/javascript" language="JavaScript"><!--
        var message="Interdit/Forbidden";

        ///////////////////////////////////
        function clickIE4(){
            if (event.button==2){
                alert(message);
                return false;
            }
        }

        function clickNS4(e){
            if (document.layers||document.getElementById&&!document.all){
                if (e.which==2||e.which==3){
                    alert(message);
                    return false;
                }
            }
        }

        if (document.layers){
            document.captureEvents(Event.MOUSEDOWN);
            document.onmousedown=clickNS4;
        }
        else if (document.all&&!document.getElementById){
            document.onmousedown=clickIE4;
        }
        
        document.oncontextmenu=new Function("return false")
              


        // --> 
        </script>
    
</body>
</html>