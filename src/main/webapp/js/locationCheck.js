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
            navigator.geolocation.getCurrentPosition(show_location, show_error, {timeout:60000, enableHighAccuracy: true}); // position
																															// request
        }else{
            console.log("Browser doesn't support geolocation!");
        }		
	}catch(e){console.log("updateGPSLocation() : "+e);};
}

// Success Callback
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
	    html5Lat = position.coords.latitude; // Get latitude
	    html5Lon = position.coords.longitude; // Get longitude
	    html5TimeStamp = position.timestamp; // Get timestamp
	    html5Accuracy = position.coords.accuracy; // Get accuracy in meters
	  // alert(html5Lat+"---"+html5Lon);
	   // distance();
	   /* var meters = 28250;
	    var coef = meters * 0.0000089;
	    var new_lat = html5Lat + coef;
	    var new_long = html5Lon + coef / Math.cos(html5Lat * 0.018);*/
	    
	    	
	    //alert(html5Lat+"---"+html5Lon+"---"+new_lat+"---"+new_long);
	    
	    return (html5Lat).toFixed(8) + ", " + (html5Lon).toFixed(8);
	}catch(e){};
}
/*function toRadians(val){
    var PI = 3.1415926535;
    return val / 180.0 * PI;
}
function distance() {
	var lat1 = 17.326360471588046;
	var lon1 = 78.37210514205856;
	var lat2 = 17.50602352841195;
	var lon2 = 78.56040045794143;
	var unit = "N";
	var R = 6371e3;
	
 
	 * var radlat1 = Math.PI * lat1/180 var radlat2 = Math.PI * lat2/180 var
	 * theta = lon1-lon2 var radtheta = Math.PI * theta/180 var dist =
	 * Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) *
	 * Math.cos(radlat2) * Math.cos(radtheta); dist = Math.acos(dist) dist =
	 * dist * 180/Math.PI dist = dist * 60 * 1.1515 if (unit=="K") { dist = dist *
	 * 1.609344 } if (unit=="N") { dist = dist * 0.8684 }
	 
	
	var lat1radians = toRadians(lat1);
	   var lat2radians = toRadians(lat2);
	
	   var latRadians = toRadians(lat2-lat1);
	   var lonRadians = toRadians(lon2-lon1);
	
	   var a = Math.sin(latRadians/2) * Math.sin(latRadians/2) +
	        Math.cos(lat1radians) * Math.cos(lat2radians) *
	        Math.sin(lonRadians/2) * Math.sin(lonRadians/2);
	   var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	
	   var d = R * c;      
    //alert("distance ::"+d);
    destVincenty(lat1, lon1, 360 , 19883.997329390);
}


function toRad(n) {
	 return n * Math.PI / 180;
}
function toDeg(n) {
	return n * 180 / Math.PI;
}
function destVincenty(lat1, lon1, brng, dist) {
	var a = 6378137,
     b = 6356752.3142,
     f = 1 / 298.257223563, // WGS-84 ellipsiod
     s = dist,
     alpha1 = toRad(brng),
     sinAlpha1 = Math.sin(alpha1),
     cosAlpha1 = Math.cos(alpha1),
     tanU1 = (1 - f) * Math.tan(toRad(lat1)),
     cosU1 = 1 / Math.sqrt((1 + tanU1 * tanU1)), sinU1 = tanU1 * cosU1,
     sigma1 = Math.atan2(tanU1, cosAlpha1),
     sinAlpha = cosU1 * sinAlpha1,
     cosSqAlpha = 1 - sinAlpha * sinAlpha,
     uSq = cosSqAlpha * (a * a - b * b) / (b * b),
     A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq))),
     B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq))),
     sigma = s / (b * A),
     sigmaP = 2 * Math.PI;
	 while (Math.abs(sigma - sigmaP) > 1e-12) {
	  var cos2SigmaM = Math.cos(2 * sigma1 + sigma),
	      sinSigma = Math.sin(sigma),
	      cosSigma = Math.cos(sigma),
	      deltaSigma = B * sinSigma * (cos2SigmaM + B / 4 * (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) - B / 6 * cos2SigmaM * (-3 + 4 * sinSigma * sinSigma) * (-3 + 4 * cos2SigmaM * cos2SigmaM)));
	  sigmaP = sigma;
	  sigma = s / (b * A) + deltaSigma;
	 };
	 var tmp = sinU1 * sinSigma - cosU1 * cosSigma * cosAlpha1,
     lat2 = Math.atan2(sinU1 * cosSigma + cosU1 * sinSigma * cosAlpha1, (1 - f) * Math.sqrt(sinAlpha * sinAlpha + tmp * tmp)),
     lambda = Math.atan2(sinSigma * sinAlpha1, cosU1 * cosSigma - sinU1 * sinSigma * cosAlpha1),
     C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha)),
     L = lambda - (1 - C) * f * sinAlpha * (sigma + C * sinSigma * (cos2SigmaM + C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM))),
     revAz = Math.atan2(sinAlpha, -tmp); // final bearing

	 console.log('17.50602352841195', 78.56040045794143)
	 
	 console.log(toDeg(lat2), (lon1 + toDeg(L)))
}*/
	
	

function initializeCurrent(latcurr, longcurr) {
	 getAddressFromLL(latcurr,longcurr); 
    try{
    	currgeocoder = new google.maps.Geocoder();	   
	    if (latcurr != '' && longcurr != '') {
	        var myLatlng = new google.maps.LatLng(latcurr, longcurr);
	        return getCurrentAddress(myLatlng);
	    }
    }catch(e){};
}

function getAddressFromLL(lat, lon){
	//alert("rest/get/address/"+lat+"/"+lon+"/")
	var uri = "rest/get/address/"+lat+"/"+lon+"/";
	$.getJSON(uri, function(results) {
		var res = results.results;
		console.log(res[0]['sublocality']+","+res[0]['locality']+","+res[0]['area']+","+res[0]['region'])
		setCookie("address", res[0]['sublocality']+", "+res[0]['locality']+", "+res[0]['area']+", "+res[0]['region'], 365);
		setAddressForSearchBox();
    	updateLocationinSearchBox();
	});
}

function getCurrentAddress(location) {
	try{
		 currgeocoder.geocode({
	        'location': location
	    }, function (results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	        	setCookie("address", results[0].formatted_address, 365);
	        	// setCookie("locAddress", results[0].formatted_address, 365);
	        	setAddressForSearchBox();
	        	updateLocationinSearchBox();
	        } else {
	            console.log('Geocode was not successful for the following reason: ' + status);
	            setAddressForSearchBox();
	            getLatLogByIpAllow();
	        }
	    });
	}catch(e){console.log("getCurrentAddress() : "+e);};
}
function updateLocationinSearchBox() {
	showAddressInIndexPage();
	if(getCookie("address") != null && document.getElementById("searchCity") != null){
		document.getElementById("searchCity").value = getCookie("address");
	}
}

function setAddressForSearchBox(){
	// setCookie("address", results[0].formatted_address, 365);
	if(document.getElementById("lat") != null && document.getElementById("lon") != null){
		document.getElementById("lat").value = getLattitude();
		document.getElementById("lon").value = getLongitude();
	}
	/*
	 * var city=false,state=false; for (var i = 0; i < results.length; i++) { if
	 * ((!city || !state) && results[i].types[0] === "locality") {
	 * //console.log(JSON.stringify(results)); city =
	 * results[i].address_components[0].long_name; try{
	 * //console.log(results[i].address_components.length+"----:----"+JSON.stringify(results[i].address_components));
	 * if (results[i].address_components.length >= 2) {
	 * if(results[i].address_components[2].hasOwnProperty('long_name')){ state = ", "
	 * +results[i].address_components[2].long_name; }else{ state = ""; } }else{
	 * state = ""; } }catch (e){ console.log("setAddressForSearchBox(results) :
	 * "+e); state = ""; } setCookie("locAddress", city + "" + state, 365);
	 * if(document.getElementById("lat") != null &&
	 * document.getElementById("lon") != null){
	 * //document.getElementById("lat").value =
	 * results[i].geometry.location.lat();
	 * //document.getElementById("lon").value =
	 * results[i].geometry.location.lng(); document.getElementById("lat").value =
	 * getLattitude(); document.getElementById("lon").value = getLongitude(); }
	 * }else{ //setCookie("locAddress", city + "" + state, 365); } }
	 */
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
// Error Callback
function show_error(error){
    getLatLogByIpBlock();
   switch(error.code) {
        case error.PERMISSION_DENIED:
        	if (document.getElementById("locationCheckYellowBottom") != null) {
        		document.getElementById("locationCheckYellowBottom").style.display = 'block';
			}        	
        	setTimeout('hidelocationCheckYellowBottom()', 3000);
            setCookie("address", "null", 365);
            break;
        case error.POSITION_UNAVAILABLE:
        	console.log("Location position unavailable.");
            break;
        case error.TIMEOUT:
        	console.log("Request timeout.");
        	updateGPSLocation();
            break;
        case error.UNKNOWN_ERROR:
        	console.log("Unknown error.");
            break; 
    }
}

function getLatLogByIpAllow() {
	var u = getWebsiteURL();
	$.ajax({
		    type: "GET",
		    dataType: 'json',
		    // uri: "./rest/get/getaddress",,
		    url: "https://api.ipdata.co/?api-key=d0e8408a008f8466593c9914927ce6659fccffcdf7b06942fd400251", 
		    success: function(data) { 	  
			    	setCookie("address", data.city, 365);
			    	updateLocationinSearchBox();
			        // initializeCurrent(data.latitude, data.longitude);
		    	},
		    error: function(data) { 
		    		console.log("getLatLogByIp() : error ");        
			        $.getJSON(u + "rest/get/getaddress", function(data) {
			        	setCookie("address", data.city, 365);
			        	updateLocationinSearchBox();
			        	// initializeCurrent(data.latitude, data.longitude);
			         });
		    	}
		});
}

function getLatLogByIpBlock() {
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
			        // initializeCurrent(data.latitude, data.longitude);
		    	},
		    error: function(data) { 
		    		console.log("getLatLogByIp() : error ");        
			        $.getJSON(u + "rest/get/getaddress", function(data) {
			    		setCookieWithOutReload("clattitude", data.latitude, 365);
			        	setCookieWithOutReload("clongitude", data.longitude, 365);
			        	setCookie("address", data.city, 365);
			        	updateLocationinSearchBox();
			        	// initializeCurrent(data.latitude, data.longitude);
			         });
		    	}
		});
}
	
