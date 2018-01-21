var currgeocoder;var lon = ""; var lat=""; var lloc = ""; var locationFlag = false; var address="";
function isGPSEnable(){
	var ad = getCookie("address");
	if(ad != "" && ad != "null"){
		alert("Your Location : "+ad);
	}else{
		document.getElementById("locationCheckYellowBottom").style.display = 'block';
		setTimeout('hidelocationCheckYellowBottom()', 3000);
		//alert("Your Location is Disabled.");
	}
}
function hidelocationCheckYellowBottom(){
	document.getElementById("locationCheckYellowBottom").style.display = 'none';	
}
function updateGPSLocation(){ 
	try{
		displtyTimes();
		if ("geolocation" in navigator){
            navigator.geolocation.getCurrentPosition(show_location, show_error, {timeout:60000, enableHighAccuracy: true}); //position request
        }else{
            console.log("Browser doesn't support geolocation!");
        }		
	}catch(e){console.log("updateGPSLocation() : "+e);};
}

//Success Callback
function show_location(position){
	geo_loc = processGeolocationResult(position);
    currLatLong = geo_loc.split(",");
    lat = currLatLong[0];
    lon = currLatLong[1];
    if(document.getElementById("gpsIcon") != null){
    	document.getElementById("gpsIcon").style.color = "#00ce08";
    }
    //locationFlag = true;
    var cookielat = getCookie("clattitude");
    var cookielon = getCookie("clongitude");
    if(cookielat != lat || cookielon != lon){
        setCookie("clattitude", lat, 365);
        setCookie("clongitude", lon, 365);
        initializeCurrent(lat, lon);
    }
    //alert("show_location(position)"+getLattitude()+"  "+getLongitude());
    if(document.getElementById("lat") != null && document.getElementById("lon") != null){
    	document.getElementById("lat").value = getLattitude();
		document.getElementById("lon").value = getLongitude();
	}
}

function processGeolocationResult(position) {
	try{
	    html5Lat = position.coords.latitude; //Get latitude
	    html5Lon = position.coords.longitude; //Get longitude
	    html5TimeStamp = position.timestamp; //Get timestamp
	    html5Accuracy = position.coords.accuracy; //Get accuracy in meters
	    return (html5Lat).toFixed(8) + ", " + (html5Lon).toFixed(8);
	}catch(e){};
}

function initializeCurrent(latcurr, longcurr) {
    try{
    	currgeocoder = new google.maps.Geocoder();	   
	    if (latcurr != '' && longcurr != '') {
	        var myLatlng = new google.maps.LatLng(latcurr, longcurr);
	        return getCurrentAddress(myLatlng);
	    }
    }catch(e){};
}
function getCurrentAddress(location) {
	try{
		 currgeocoder.geocode({
	        'location': location
	    }, function (results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	        	//alert("getCurrentAddress(location)");
	        	setCookie("address", results[0].formatted_address, 365);
	        	setCookie("locAddress", results[0].formatted_address, 365);
	        	setAddressForSearchBox(results);
	        	updateLocationinSearchBox();
	        } else {
	            console.log('Geocode was not successful for the following reason: ' + status);
	        }
	    });
	}catch(e){console.log("getCurrentAddress() : "+e);};
}
function updateLocationinSearchBox() {
	//alert(getCookie("locAddress"))
	if(getCookie("locAddress") != null){
		//alert(document.getElementById("searchCity").value)
		document.getElementById("searchCity").value = getCookie("locAddress");
	}
}

function setAddressForSearchBox(results){
	var city=false,state=false;
	for (var i = 0; i < results.length; i++) {
		//alert(JSON.stringify(results[i])['formatted_address']);
		if ((!city || !state) && results[i].types[0] === "locality") {
			city = results[i].address_components[0].long_name,
			state = ", " +results[i].address_components[2].long_name;
			setCookie("locAddress", city + "" + state, 365);
			if(document.getElementById("lat") != null && document.getElementById("lon") != null){
				//document.getElementById("lat").value = results[i].geometry.location.lat();
				//document.getElementById("lon").value = results[i].geometry.location.lng();
				document.getElementById("lat").value = getLattitude();
				document.getElementById("lon").value = getLongitude();
	    	} 
		}else{
			//setCookie("locAddress", city + "" + state, 365);
		}
	}
}
function getCurAdd(){
	var add = getCookie("locAddress");
	if(add != "" && add != "null")
		return addStarsToString(add);
	else
		return "null";
}	

function getLattitude(){
	var clattitude = getCookie("clattitude");
	if(clattitude != "" && clattitude != "null")
		return clattitude;
	else
		return "null";
}
function getLongitude(){
	var clongitude = getCookie("clongitude");
	if(clongitude != "" && clongitude != "null")
		return clongitude;
	else
		return "null";
}
//Error Callback
function show_error(error){
   switch(error.code) {
        case error.PERMISSION_DENIED:
        	if (document.getElementById("locationCheckYellowBottom") != null) {
        		document.getElementById("locationCheckYellowBottom").style.display = 'block';
			}        	
        	setTimeout('hidelocationCheckYellowBottom()', 3000);
            setCookie("address", "null", 365);
            getLatLogByIp();
            break;
        case error.POSITION_UNAVAILABLE:
        	console.log("Location position unavailable.");
        	getLatLogByIp();            
            break;
        case error.TIMEOUT:
        	console.log("Request timeout.");
        	updateGPSLocation();
            break;
        case error.UNKNOWN_ERROR:
        	console.log("Unknown error.");
        	getLatLogByIp();
            break; 
    }
}

function getLatLogByIp() {
	//alert("getLatLogByIp()");
	var u = getWebsiteURL();
	$.ajax({
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
	    	//setAddressForSearchBox(data);
	        initializeCurrent(data.latitude, data.longitude);
	    }).fail( function(xhr, textStatus, errorThrown) {
	        console.log("getLatLogByIp:xhr.responseText"+xhr.responseText);
	        console.log("getLatLogByIp:textStatus"+textStatus);
	        $.getJSON(u + "rest/get/getaddress", function(data) {
	    		setCookieWithOutReload("clattitude", data.latitude, 365);
	        	setCookieWithOutReload("clongitude", data.longitude, 365);
	        	setAddressForSearchBox(data);
	            initializeCurrent(data.latitude, data.longitude);        
	         });
	    });
}
	
