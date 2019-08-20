    function SaveDivScrollPosition() 
    {         
        var myDivs = document.getElementsByTagName("div"); 
        for(var i = 0; i < myDivs.length; i++) 
        { 
            if(myDivs[i].id.length > 0 && myDivs[i].scrollTop > 0) 
            { 
                document.cookie = myDivs[i].id + "=" + myDivs[i].scrollTop;  
            } 
        } 
    } 
    function SetDivScrollPosition() 
    {         
        var strCook = document.cookie; 
        if(strCook.length > 0) 
        { 
            var cookies = strCook.split(";"); 
            for(var i = 0; i < cookies.length; i++) 
            { 
                var mySplit = cookies[i].split("="); 
                try 
                { 
                    document.getElementById(mySplit[0].replace(" ", "")).scrollTop = mySplit[1]; 
                } 
                catch(e) 
                { 
                } 
             } 
        } 
    }