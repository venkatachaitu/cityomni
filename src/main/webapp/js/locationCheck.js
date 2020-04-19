var currgeocoder;var lon = ""; var lat=""; var lloc = ""; var locationFlag = false; var address="";
function isGPSEnable(){
	var ad = getCookie("address");
	if(ad != "" && ad != "null"){
		var colo = document.getElementById("gpsIcon").style.color;
		if(colo.length == 0)
			alert("Please Enable Your Device/Browser Location..\n\n"+ad);
		else
			alert("Your Location : "+ad);
	}else{
		document.getElementById("locationCheckYellowBottom").style.display = 'block';
		setTimeout('hidelocationCheckYellowBottom()', 3000);
	}
}
function hidelocationCheckYellowBottom(){
	document.getElementById("locationCheckYellowBottom").style.display = 'none';	
}
function updateGPSLocation(){ 
	console.log("--updating GPS Location--");
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
    var cookielat = getCookie("clattitude");
    var cookielon = getCookie("clongitude");
    if(cookielat != lat || cookielon != lon){
        setCookie("clattitude", lat, 365);
        setCookie("clongitude", lon, 365);
        initializeCurrent(lat, lon);
    }
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
	        	setCookie("address", results[0].formatted_address, 365);
	        	//setCookie("locAddress", results[0].formatted_address, 365);
	        	setAddressForSearchBox();
	        	updateLocationinSearchBox();
	        } else {
	            console.log('Geocode was not successful for the following reason: ' + status);
	            setAddressForSearchBox(results);
	            getLatLogByIp();
	        }
	    });
	}catch(e){console.log("getCurrentAddress() : "+e);};
}
function updateLocationinSearchBox() {
	if(getCookie("address") != null){
		document.getElementById("searchCity").value = getCookie("address");
	}
}

function setAddressForSearchBox(){
	//setCookie("address",  results[0].formatted_address, 365);
	if(document.getElementById("lat") != null && document.getElementById("lon") != null){
		document.getElementById("lat").value = getLattitude();
		document.getElementById("lon").value = getLongitude();
	}
	/*var city=false,state=false; 
	for (var i = 0; i < results.length; i++) {
		if ((!city || !state) && results[i].types[0] === "locality") {
			//console.log(JSON.stringify(results));
			city = results[i].address_components[0].long_name;			
			try{
				//console.log(results[i].address_components.length+"----:----"+JSON.stringify(results[i].address_components));
				if (results[i].address_components.length >= 2) {					
					if(results[i].address_components[2].hasOwnProperty('long_name')){
						state = ", " +results[i].address_components[2].long_name;
					}else{
						state = "";				
					}
				}else{
					state = "";				
				}
			}catch (e){
				console.log("setAddressForSearchBox(results) : "+e);
				state = "";
			}
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
	}*/
}
function getCurAdd(){
	var add = getCookie("address");
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
	var u = getWebsiteURL();
	$.ajax({
		    type: "GET",
		    dataType: 'json',
		    // uri: "./rest/get/getaddress",,
		    url: "https://api.ipdata.co/?api-key=d0e8408a008f8466593c9914927ce6659fccffcdf7b06942fd400251", 
		    success: function(data) { 	  
			    	setCookieWithOutReload("clattitude", data.latitude, 365);
			    	setCookieWithOutReload("clongitude", data.longitude, 365);
			    	setCookie("address", data.city, 365);
			    	updateLocationinSearchBox();
			        //initializeCurrent(data.latitude, data.longitude);
		    	},
		    error: function(data) { 
		    		console.log("getLatLogByIp() : error ");        
			        $.getJSON(u + "rest/get/getaddress", function(data) {
			    		setCookieWithOutReload("clattitude", data.latitude, 365);
			        	setCookieWithOutReload("clongitude", data.longitude, 365);
			        	setCookie("address", data.city, 365);
			        	updateLocationinSearchBox();
			        	//initializeCurrent(data.latitude, data.longitude);        
			         });
		    	}
		});
}
	
