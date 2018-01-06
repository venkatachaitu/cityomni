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
		if ("geolocation" in navigator){
            navigator.geolocation.getCurrentPosition(show_location, show_error, {timeout:5000, enableHighAccuracy: true}); //position request
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
    document.getElementById("gpsIcon").style.color = "#00ce08";
    //locationFlag = true;
    var cookielat = getCookie("clattitude");
    var cookielon = getCookie("clongitude");
    if(cookielat != lat || cookielon != lon){
        setCookie("clattitude", lat, 365);
        setCookie("clongitude", lon, 365);
        initializeCurrent(lat, lon);
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
	        	setAddressForSearchBox(results);
	        	updateLocationinSearchBox();
	        } else {
	            console.log('Geocode was not successful for the following reason: ' + status);
	        }
	    });
	}catch(e){console.log("getCurrentAddress() : "+e);};
}
function setAddressForSearchBox(results){
	var city=false,state=false;
	for (var i = 0; i < results.length; i++) {
		if ((!city || !state) && results[i].types[0] === "locality") {
			 city = results[i].address_components[0].long_name,
			state = results[i].address_components[2].long_name;
			setCookie("locAddress", city + ", " + state, 365);
			if(document.getElementById("lat") != null){
		    	document.getElementById("lat").value = results[i].geometry.location.lat();
				document.getElementById("lon").value = results[i].geometry.location.lng();
	    	} 
		}
	}
	// iterate through address_component array
	/*$.each(arrAddress, function (i, address_component) {
	    console.log('address_component:'+i);

	    if (address_component.types[0] == "route"){
	        console.log(i+": route:"+address_component.long_name);
	        itemRoute = address_component.long_name;
	    }

	    if (address_component.types[0] == "locality"){
	        console.log("town:"+address_component.long_name);
	        itemLocality = address_component.long_name;
	    }

	    if (address_component.types[0] == "country"){ 
	        console.log("country:"+address_component.long_name); 
	        itemCountry = address_component.long_name;
	    }

	    if (address_component.types[0] == "postal_code_prefix"){ 
	        console.log("pc:"+address_component.long_name);  
	        itemPc = address_component.long_name;
	    }

	    if (address_component.types[0] == "street_number"){ 
	        console.log("street_number:"+address_component.long_name);  
	        itemSnumber = address_component.long_name;
	    }
	    //return false; // break the loop   
	});*/
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
        	document.getElementById("locationCheckYellowBottom").style.display = 'block';
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
            break;
        case error.UNKNOWN_ERROR:
        	console.log("Unknown error.");
            break;
    }
}

