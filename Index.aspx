<%@ page language="VB" autoeventwireup="false" inherits="Index, App_Web_uzpgk440" enableEventValidation="false" stylesheettheme="White" %>

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
                <h4>
                    Choose your country by clicking on the map.
                </h4>            
                <h4>
                    Choisissez votre pays en cliquant sur la carte.
                </h4>                
                <img name="mapCameleo" id="mapCameleo" usemap="#region-map" alt="map" src="Images/map-base.png" />                        
                <map name="region-map" id="region-map">
                    <area alt="Canada" shape="poly" coords="51,77,53,46,77,23,123,8,168,1,197,-2,168,14,176,41,165,51,172,92,149,101,123,100,104,85," 
                        href="indexca.aspx"
                        onmouseover="changeImagemap('canada');self.status='Red Square';return true"
                        onmouseout="changeImagemap('nocountry');self.status='';return true" />   
                    <area shape="poly" coords="-1,56,44,20,67,18,77,22,51,46," alt="USA"
                        href="indexus.aspx"
                        onmouseover="changeImagemap('usa');self.status='Red Square';return true"
                        onmouseout="changeImagemap('nocountry');self.status='';return true" />   
                    <area shape="poly" coords="50,79,38,106,36,121,51,130,64,137,69,148,76,138,97,140,103,152,137,100,121,102,102,86," alt="USA"
                        href="indexus.aspx"
                        onmouseover="changeImagemap('usa');self.status='Red Square';return true"
                        onmouseout="changeImagemap('nocountry');self.status='';return true" />
                </map>       
                
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
        
        //ImageMap
        nocountry = new Image();
        nocountry.src  = "Images/map-base.png";

        canada = new Image();
        canada.src  = "Images/map-canada.png";
        
        usa = new Image();
        usa.src  = "Images/map-usa.png";

        function changeImagemap(newImage) {
            document ['mapCameleo'].src = eval(newImage + ".src");
        }


        // --> 
        </script>
    
</body>
</html>
