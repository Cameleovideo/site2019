<%@ page language="VB" autoeventwireup="false" inherits="indexus, App_Web_uzpgk440" enableEventValidation="false" stylesheettheme="White" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
                <asp:ImageMap ID="mapCameleo" runat="server" OnClick="mapCameleo_Click" ImageUrl="~/Images/bulle-usa.png" HotSpotMode="PostBack">                    
                    <asp:RectangleHotSpot PostBackValue="en-us" AlternateText="english" Left="144" Bottom="125" Right="235" Top="143"/>
                    <asp:RectangleHotSpot PostBackValue="sp-us" AlternateText="spanish" Left="144" Bottom="145" Right="235" Top="165"/>
                    <asp:RectangleHotSpot PostBackValue="cancel" AlternateText="" Left="213" Bottom="85" Right="238" Top="105"/>
                </asp:ImageMap>                
                <br /><br /><br />
            </div>
            <asp:Label ID="lblLanguage" runat="server"></asp:Label>
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
