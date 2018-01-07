function loadIndexPage() { 
    if (!isLocationEnable()) { 
    	
      // promptForLocation(); 
    	var loc = getCookie("location");
			var loc11 = getUrlVars()["location"];
			if(typeof loc11 !== "undefined"){
	   			if(loc11 != ""){
	   				loc = loc11;
	   			}
			}
			if(loc == ""){
				setCookieWithOutReload("location", "chennai", 365);
				loc = getCookie("location");
			}else{			
				console.log("Home Page : location is "+loc);
				setCookieWithOutReload("location", loc, 365);
			}    	
    } else {
        var location = getCookie("location");
        if (location != "") {
            selectCityInIndexPage();
        }
    }
    updateLocationinSearchBox();
}
function updateLocationinSearchBox() {
	//alert(getCookie("searchCity"))
	/*if(getCookie("searchCity") != null){
		if(getCookie("searchCity") != ''){
			document.getElementById("searchCity").value = getCookie("searchCity");
		}else{
			document.getElementById("searchCity").value = getCookie("locAddress");
		}
	}else{*/
			document.getElementById("searchCity").value = getCookie("locAddress");
	/*}*/
}
function getLatLogByIp() {
	var u = getWebsiteURL();
	$.getJSON(u + "rest/get/getaddress", function(data) {
		//alert(data);
		setCookieWithOutReload("clattitude", data.latitude, 365);
    	setCookieWithOutReload("clongitude", data.longitude, 365);
    	setAddressForSearchBox(data);
        initializeCurrent(data.latitude, data.longitude);        
     });
	
	/*$.ajax({
		    type: "GET",
		    dataType: 'json',
		    url: "http://freegeoip.net/json/",
		    crossDomain : true,
		    xhrFields: {
		        withCredentials: true
		    }
		}).done(function( data ) {
	    	setCookieWithOutReload("clattitude", data.latitude, 365);
	    	setCookieWithOutReload("clongitude", data.longitude, 365);
	    	setAddressForSearchBox(data);
	        initializeCurrent(data.latitude, data.longitude);
	    }).fail( function(xhr, textStatus, errorThrown) {
	        console.log("getLatLogByIp:xhr.responseText"+xhr.responseText);
	        console.log("getLatLogByIp:textStatus"+textStatus);
	    });*/
	}
function setCookieWithOutReload(cname, cvalue, exdays) {
    try {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        
        var loloc = getCookie("location");
        document.getElementById('locationHome').innerHTML = loloc;
        selectCityInIndexPage();
        
    } catch (e) {
        alert(e);
    }
}

function isLocationEnable() {
    updateGPSLocation();
    var location = getCookie("location");
    if (location != "") {
        document.getElementById('locationHome').innerHTML = location;
        locationFlag = true;
        return locationFlag;
    } else {
        return locationFlag;
    }
}

function setCookie(cname, cvalue, exdays) {
    try {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        if (cname.trim().toLowerCase() == "location")
            window.location.href = getWebsiteURL();
    } catch (e) {
        alert(e);
    }
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function promptForLocation() {
	setLocation("chennai");
    /*document.getElementById('myModal').style.display = "block";
    var close = document.getElementById('close');
    close.style.display = "none";*/
}

function selectCityInIndexPage() {
    if (document.getElementById("locationHome") != null) {
        if (document.getElementById("locationHome").innerText != "") {

            try {
                var selectCheck = document.getElementById('searchCategories');
                if (selectCheck.options.length < 2) {
                    var loc1 = document.getElementById("locationHome").innerText;
                    var e1 = document.getElementById("searchCity");
                    var select = document.getElementById('searchCategories');
                    select.disabled = false;
                    for (var option in select) {
                        select.remove(option);
                    }
                    for (var ii = 0; ii <= e1.options.length; ii++) {
                        var secLoc = e1.options[ii].text;
                        if (loc1.trim().toLowerCase() == secLoc.trim().toLowerCase()) {
                            e1.selectedIndex = ii;
                            var ess = document.getElementById("searchCity");
                            var strUser = ess.options[ess.selectedIndex].value;
                            var u = getWebsiteURL();
                            $.getJSON(u + "rest/get/getCat/" + strUser.toLowerCase(), function(data) {
                                console.log(JSON.stringify(data));
                                data = sortObject(data);
                                var opt = document.createElement('option');
                                opt.value = 'all';
                                opt.innerHTML = 'All';
                                select.appendChild(opt);
                                $.each(data, function(key, val) {
                                    if (key != "undefined") {
                                        if (val != '999999') {
                                            var opt1 = document.createElement('option');
                                            opt1.value = key;
                                            opt1.innerHTML = addSpaces(key);
                                            select.appendChild(opt1);
                                        }
                                    }
                                });
                                //selectCategory(select);
                            });
                            break;
                        }
                    }
                }
            } catch (e) {
                console.log("indexPage setCity() : " + e);
            }
        }
    }
}

function getWebsiteURL() {
    var str = window.location.href;
    var url = "";
    if (str.indexOf("https://") >= 0) {
        url = str.substring(str.indexOf("https://"), str.indexOf(".com")) + ".com/";
    }
    if (str.indexOf("http://") >= 0) {
        url = str.substring(str.indexOf("http://"), str.indexOf(".com")) + ".com/";
    }
    if (str.indexOf("https://") == -1 && str.indexOf("http://") == -1) {
        url = str.substring(0, str.indexOf(".com")) + ".com/";
    }
    if (str.indexOf("localhost") != -1) {
        url = "/";
    }
    return url;
}

function setLocation(place) {
    var modal = document.getElementById('myModal');
    modal.style.display = "none";
    setCookie("location", place, 365);
}

function getUrlVars() {
    var vars = {};
    window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m, key, value) {
        vars[key] = value;
    });
    return vars;
}

function changeLocation() {
    var modal = document.getElementById('myModal');
    document.getElementById("navPanel").classList.remove("visible");
    modal.style.display = "block";
    var span = document.getElementsByClassName("close")[0];
    span.style.display = "block";
    span.onclick = function() {
        modal.style.display = "none";
    };
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
}

function viewSearchBox() {
    if (document.getElementById('searchBlock').style.display == 'none') {
        document.getElementById('searchBlock').style.display = 'block';
        document.getElementById('searchClose').style.display = 'inline-block';
        document.getElementById('searchView').style.display = 'none';
        document.getElementById("header").style.position = "inherit";
        
        try {
        	 if(typeof getUrlVars()["city"] !== "undefined"){
	   			if(getUrlVars()["city"] != ""){
	   				document.getElementById('searchCity').value = decodeURIComponent((getUrlVars()["city"].trim()).replace(/\+/g, '%20'));
	   	        }
   			}else{
   				document.getElementById('searchCity').value = decodeURIComponent((getCurAdd().trim()).replace(/\+/g, '%20'));
   			}
        	
        	 if(typeof getUrlVars()["category"] !== "undefined"){
 	   			if(getUrlVars()["category"] != ""){
		 	   			var select = document.getElementById('searchCategories');
		 				for (var ii = 0; ii < select.options.length; ii++) {
		 	                var secLoc = select.options[ii].value;
		 	                if (getUrlVars()["category"].trim().toLowerCase() == secLoc.trim().toLowerCase()) {
		 	                	select.selectedIndex = ii;
		 	                }
		 				}
        			}
    			}
        	 
        	 if(typeof getUrlVars()["searchContent"] !== "undefined"){
  	   			if(getUrlVars()["searchContent"] != ""){
	  	   			var searchContent = getUrlVars()["searchContent"].trim();
	  	            if(searchContent == "" || searchContent == null){
	  	         	   searchContent = "qwertyqwerty";
	  	            }
	  	            var sf = searchContent.split("%2B");
	  	            //alert(sf.length);
	  	            searchContent = "";
	  	            for(var i = 0; i < sf.length; i++){
	  	         	   if(sf.length >1){
	  		            	var tf = sf[i] + '+';
	  		         	   searchContent = searchContent + tf;
	  	         	   }else{
	  	         		  searchContent = sf[0]
	  	         	   }
	  	            }
	  	            if(document.getElementById("searchBoxInput") != null ){
	  	            	document.getElementById("searchBoxInput").value = addSpaces(searchContent).trim();
	  	            }
  	   			}
  	   			
  	   		}
			
            
            
            
        } catch (e) {
            console.log("viewSearchBox: " + e);
        }
    } else {
    	document.getElementById('searchBlock').style.display = 'none';
    	document.getElementById('searchClose').style.display = 'none';
        document.getElementById('searchView').style.display = 'inline-block';
        document.getElementById("header").style.position = "fixed";
    }

}

function selectCategory(select) {
    try {
        for (var i = 0; i <= select.options.length; i++) {
            var value = select.options[i].value;
            if (getUrlVars()["category"].trim().toLowerCase() == value.trim().toLowerCase()) {
                select.selectedIndex = i;
                break;
            }
        }
        var searchContent = getUrlVars()["searchContent"].trim();
        var sf = searchContent.split("%2B");
        searchContent = "";
        for (var i = 0; i < sf.length; i++) {
            var tf = sf[i] + ' ';
            searchContent = searchContent + tf;
        }


        document.getElementById("searchBoxInput").value = searchContent.trim();
        document.getElementById("searchBoxInput").focus();
    } catch (e) {
        console.log("selectCategory" + e);
    }
}

function addStarsToString(str) {
    var s = str.trim();
    var temp = "";
    for (var i = 0; i < s.length; i++) {
        if (s[i] == " ") {
            temp = temp + "+";
        } else {
            if (s[i] == '/') {
                temp = temp + "-";
            } else {
                temp = temp + s[i].toLowerCase();
            }
        }
    }
    //console.log(temp);
    return temp;
}

function removeAmbers(str) {
    var s = str.trim();    
    var temp = "";
    for (var i = 0; i < s.length; i++) {
    	if (s[i] == '&') {
            temp = temp + "";
        }else{
        	temp = temp + s[i];
        }
    }
    return temp;
}

function removeSpaces(str) {
    var s = str.trim();
    var temp = "";
    for (var i = 0; i < s.length; i++) {
        if (s[i] == " ")
            temp = temp + "_";
        else
            temp = temp + s[i].toLowerCase();
    }
    return temp;
}

function sortObject(o) {
    var sorted = {},
        key = "",
        a = [];

    for (key in o) {
        if (o.hasOwnProperty(key)) {
            a.push(key);
        }
    }

    a.sort();

    for (key = 0; key < a.length; key++) {
        sorted[a[key]] = o[a[key]];
    }
    return sorted;
}

function addSpaces(str) {
    var s = str.trim();
    var temp = "";
    for (var i = 0; i < s.length; i++) {
        if (s[i] == "_" || s[i] == "+")
            temp = temp + " ";
        else
            temp = temp + s[i].toLowerCase();
    }
    return temp;
}

function normalizePhno(str) {
    var s = str.trim();
    var temp = "";
    for (var i = 0; i < s.length; i++) {
        if (s[i] == " ")
            temp = temp + "";
        else
            temp = temp + s[i].toLowerCase();
    }
    return temp;
}

function findDistance(lat1, lon1, lat2, lon2){
  var R = 6371; // km
  var dLat = (lat2-lat1)* Math.PI / 180;
  var dLon = (lon2-lon1)* Math.PI / 180;
  var lat1 = (lat1)* Math.PI / 180;
  var lat2 = (lat2)* Math.PI / 180;

  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c;
  return d;
}

function changeCity() {
    try {
        var e = document.getElementById("searchCity");
        var strUser = e.options[e.selectedIndex].value;
        var select = document.getElementById('searchCategories');
        select.disabled = true;
        for (var option in select) {
            select.remove(option);
        }
        if (strUser != -1) {
            var u = getWebsiteURL();
            $.getJSON(u + "rest/get/getCat/" + strUser.toLowerCase(), function(data) {
                data = sortObject(data);
                var opt = document.createElement('option');
                opt.value = 'all';
                opt.innerHTML = 'All';
                select.appendChild(opt);
                var flag = true;
                $.each(data, function(key, val) {
                    flag = false;
                    if (key != "undefined") {
                        if (val != '999999') {
                            var opt1 = document.createElement('option');
                            opt1.value = key;
                            opt1.innerHTML = addSpaces(key);
                            select.appendChild(opt1);
                        }
                    }
                });
                if (flag) {
                    var opt1 = document.createElement('option');
                    opt1.value = -1;
                    opt1.innerHTML = "no data!";
                    select.appendChild(opt1);
                    select.disabled = true;
                }
                if (!flag) {
                    select.disabled = false;
                }
            });
        }
        if (strUser == -1) {
            for (var option1 in select) {
                select.remove(option1);
            }
            select.disabled = true;
            var opt2 = document.createElement('option');
            opt2.value = '-1';
            opt2.innerHTML = 'Select Category';
            select.appendChild(opt2);
        }
    } catch (e) {
        console.log("changeCity : " + e);
    }
}

function typeInSearchBox() {
    var box = document.getElementById("searchBoxInput");
    if (box.value.length > 0)
        box.style.borderColor = "#d2d2d2";
    try {
        var stringToReplace = box.value;
        //console.log("stringToReplace : before "+stringToReplace);
        var specialChars = "!@#$^&%*()+=-[]\/{}|:<>?,.''";
        for (var i = 0; i < specialChars.length; i++) {
            stringToReplace = stringToReplace.replace(/[^\w\s]/gi, '+');
            stringToReplace = stringToReplace.replace(new RegExp(' ', 'g'), '+');
        }
        //console.log("stringToReplace : after "+stringToReplace);
        document.getElementById("searchContent").value = stringToReplace;
    } catch (e) {
        console.log("typeInSearchBox Exception : " + e);
    }
}

function Submit() {
    var city = document.getElementById("searchCity");
    var cat = document.getElementById("searchCategories").value;
    var box = document.getElementById("searchBoxInput");

    if (city.value.length <= 0) {
        alert("Enter city");
        city.focus() ;
        return false;
    }
    if (cat == '-1') {
        alert("select category.");
        //cat.focus() ;
        return false;
    }
    /*if (cat == 'all' && box.value.length == 0) {
        //alert("select category.");
        box.focus();
        box.style.borderColor = "red";
        return false;
    }*/

    if (box.value.length <= 2) {
        box.focus();
        box.style.borderColor = "red";
        return false;
    }

}
