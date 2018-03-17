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
            //selectCityInIndexPage();
        }
    }
    setCategoryTypes();
   // updateLocationinSearchBox();
}
function setCategoryTypes() { 
	var arr = ["accounting", "airport", "amusement_park", "aquarium", "art_gallery", "atm", "bakery", "bank", "bar", "beauty_salon", "bicycle_store", "book_store", "bowling_alley", "bus_station", "cafe", "campground", "car_dealer", "car_rental", "car_repair", "car_wash", "casino", "cemetery", "church", "city_hall", "clothing_store", "convenience_store", "courthouse", "dentist", "department_store", "doctor", "electrician", "electronics_store", "embassy", "fire_station", "florist", "funeral_home", "furniture_store", "gas_station", "gym", "hair_care", "hardware_store", "hindu_temple", "home_goods_store", "hospital", "insurance_agency", "jewelry_store", "laundry", "lawyer", "library", "liquor_store", "local_government_office", "locksmith", "lodging", "meal_delivery", "meal_takeaway", "mosque", "movie_rental", "movie_theater", "moving_company", "museum", "night_club", "painter", "park", "parking", "pet_store", "pharmacy", "physiotherapist", "plumber", "police", "post_office", "real_estate_agency", "restaurant", "roofing_contractor", "rv_park", "school", "shoe_store", "shopping_mall", "spa", "stadium", "storage", "store", "subway_station", "supermarket", "synagogue", "taxi_stand", "train_station", "transit_station", "travel_agency", "veterinary_care", "zoo"];
	var out = "<option value='all'>all category</option>";
	
	for (i in arr) {
		out = out + "<option value="+arr[i]+">"+addSpaces(arr[i])+"</option>";
	}
	
	document.getElementById("searchCategories").innerHTML = out;
}
function setCookieWithOutReload(cname, cvalue, exdays) {
    try {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        
        var loloc = getCookie("location");
        document.getElementById('locationHome').innerHTML = loloc;
        //selectCityInIndexPage();
        
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
        //url = window.location.hostname+":5000";
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
	setCategoryTypes();
	
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
        	
        	 if(typeof getUrlVars()["city"] !== "undefined"){
 	   			if(getUrlVars()["lat"] != "" && getUrlVars()["lon"] != ""){
	 	   			if(document.getElementById("lat") != null && document.getElementById("lon") != null){
	 			    	document.getElementById("lat").value = getUrlVars()["lat"];
	 					document.getElementById("lon").value = getUrlVars()["lon"];
	 		    	}
 	   	        }
        	 }else{
        		 if(document.getElementById("lat") != null && document.getElementById("lon") != null){
	 			    	document.getElementById("lat").value = getLattitude();
	 					document.getElementById("lon").value =  getLongitude();
 		    		}
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
    $("html, body").animate({
        scrollTop: 0
    }, "slow");
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

/*function changeCity() {
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
}*/

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
        alert("please Enter City for search.");
        city.focus() ;
        return false;
    }
    /*if (cat == '-1') {
        alert("select category.");
        //cat.focus() ;
        return false;
    }*/
    /*if (cat == 'all') {
        //alert("select category.");
        box.focus();
        box.style.borderColor = "red";
        return false;
    }*/
    //alert(cat);
    if (cat == 'all' && box.value.length <= 2) {
        box.focus();
        box.style.borderColor = "red";
        return false;
    }
}
function viewCommentBox(){
	 if (document.getElementById('commentBox').style.display == 'none') {
		 document.getElementById("commentBox").style.display = "block";
		 document.getElementById("addSubmitButton").style.display = "block";
		 document.getElementById("addButton").style.transform = "rotate(40deg)";
		 document.getElementById("addButton").style.backgroundColor = "red";
		 document.getElementById("addSubmitResponse").style.display = "block";
	 }else{
		 document.getElementById("commentBox").style.display = "none";
		 document.getElementById("addSubmitButton").style.display = "none";
		 document.getElementById("addButton").style.transform = "rotate(0deg)";
		 document.getElementById("addButton").style.backgroundColor = "#0095ff";
		 document.getElementById("addSubmitResponse").style.display = "none";
	 }    	
}
function displtyTimes(){   	
    d=new Date();
    minutes = d.getMinutes().toString().length == 1 ? '0'+d.getMinutes() : d.getMinutes(),
    hours = d.getHours().toString().length == 1 ? '0'+d.getHours() : d.getHours(),
    sec = d.getSeconds().toString().length == 1 ? '0'+d.getSeconds() : d.getSeconds(),
    ampm = d.getHours() >= 12 ? 'pm' : 'am',
    months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
    days = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
    	    
    if(document.getElementById('time') != null){
    	document.getElementById('time').innerHTML= days[d.getDay()]+' '+months[d.getMonth()]+' '+d.getDate()+' '+d.getFullYear()+' '+hours+':'+minutes+':'+sec+ampm;
    	setTimeout('displtyTimes()','1000');
    }
}
function getCustomDate(){   	
	var currentdate = new Date(); 
	var datetime = 	currentdate.getFullYear() + "-"
					+ (currentdate.getMonth()+1)  + "-" 
					+ currentdate.getDate() + " "  
					+ currentdate.getHours() + ":"  
					+ currentdate.getMinutes() + ":" 
					+ currentdate.getSeconds();
					var dt = new Date(datetime);
	return dt.toISOString();
}
function decodeDate(dd){
	var d = new Date(dd);
	minutes = d.getMinutes().toString().length == 1 ? '0'+d.getMinutes() : d.getMinutes(),
    	    hours = d.getHours().toString().length == 1 ? '0'+d.getHours() : d.getHours(),
    	    ampm = d.getHours() >= 12 ? 'pm' : 'am',
    	    months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
   return  months[d.getMonth()]+' '+d.getDate()+' '+d.getFullYear()+' '+hours+':'+minutes+ampm;
        	
}
function commentSubmit(){
	var date = getCustomDate();
	var com = JSON.stringify($('#commentBox').val());
	var area = document.getElementById("comentloc").innerHTML;
	var data = JSON.stringify( { "user": "chaitanya", "area": area, "comment": com, "date": date } );
	$.ajax({
	    url: "/rest/add/confession",
	    dataType: 'json',
	    type: 'post',
	    contentType: 'application/json',
	    data:  data,
	    processData: false,
	    success: function( data, textStatus, jQxhr ){
	    	document.getElementById("addSubmitResponse").innerHTML = "success";
	        //alert("commentSubmit() : Success:"+ JSON.stringify( data ) );
	    	loadAllComments();
	    },
	    error: function( jqXhr, textStatus, errorThrown ){
	        alert("commentSubmit() : Error:"+ errorThrown );
	    }
	});
}

var jsonData = [];
function loadAllComments(){
	var areas = [];
	document.getElementById('searchCityConf').value = getCookie("locAddress");
	
	$.ajax({
	    url: "/rest/readall/confession",
	    dataType: 'json',
	    type: 'post',
	    contentType: 'application/json',
	    //data:  data,
	    processData: false,
	    success: function( data, textStatus, jQxhr ){
	    	var out = "";
	    	//out = "<li><table><tr><td></td><td></td><td></td></tr></table></li>";
	    	
	    	//out = out + "<table>";
	    	$.each(data, function(key, val) {
	    		//out = out + "<tr>";
	    		var user, area, comment, date;
	    		$.each(val, function(key1, val1) {
	    			if(key1 == "user"){
	    				user = val1;
	    			}else if(key1 == "area"){
	    				area = val1;
	    				if(areas.indexOf(area) == -1){
	    					areas.push(area);
	    				}	    				
	    			}else if(key1 == "comment"){
	    				comment = val1;
	    			}else if(key1 == "date"){
	    				date = val1;
	    			}
	    			if(typeof area != "undefined" &&  typeof user != "undefined" &&  typeof comment != "undefined" &&  typeof date != "undefined"){
	    				while (comment.indexOf("\\n") !== -1) {
	    					comment = comment.replace("\\n", "<br />");
    					}
	    				 
	    				out = out + "<table class='comentbox'><tr><td style=''><span class='areaspan' >"+area+" ("+user+")</span><span class='datespan' >"+decodeDate(date)+"</span><div class='comenttext' style='' >"+comment.replace(/"/g , " ")+"</div></td></tr></table>";
	    				 
	    				var obj = "{\"user\":\""+user+"\", \"area\":\""+area+"\", \"comment\":"+comment+", \"date\":\""+decodeDate(date)+"\"}";
	    				
	    				jsonData.push(JSON.parse(obj));
	    			}
	    				//alert(key1+" : "+val1);
	    		});
	    		//out = out + "</tr>"
	    	});
	    	//alert("loadAllComments() : "+JSON.stringify(data));
	    	
	    	//out = out + "</table>"
	    	document.getElementById('commentsList').innerHTML = out;
	    	//return data;
	    	var out1 = "<li onclick=readConfessionByArea('all')>all areas</li>";
	    	for (var i = 0; i < areas.length; i++) { 
	    		out1 = out1 + "<li onclick=readConfessionByArea('"+areas[i]+"')>"+areas[i]+ "</li>";
	    	}
	    	document.getElementById('areasList').innerHTML = out1;
	    	//console.log(jsonData);
	    	 
	    },
	    error: function( jqXhr, textStatus, errorThrown ){
	        alert("loadAllComments() : Error:"+ errorThrown );
	    }
	});
}

function readConfessionByArea(area){
	var out = "";
	out = out + "<table>";
	$.each(jsonData, function(key, val) {
		if(area == 'all') {
			while (val.comment.indexOf("\\n") !== -1) {
				val.comment = val.comment.replace("\\n", "<br />");
			}
			 
			out = out + "<table class='comentbox'><tr><td style=''><span class='areaspan' >"+val.area+" ("+val.user+")</span><span class='datespan' >"+val.date+"</span><div class='comenttext' style='' >"+val.comment.replace(/"/g , " ")+"</div></td></tr></table>";
			 
			//out = out + "<tr><td>"+val.user+"</td><td>"+val.area+"</td><td>"+val.comment+"</td><td>"+val.date+"</td></tr>";
			//out = out + "<tr><td style='width: 100%;'><div><span style='float:  left;'>"+val.area+"</span><span style='float:  right;'>"+val.date+"</span></div><div  style='margin-top: 1.5em;border-top: 1px solid #b9b6b6;padding-top:  2em;'>"+val.comment+"</div></td></tr>";
			
		}else if(val.area == area) {
			//out = out + "<tr><td>"+val.user+"</td><td>"+val.area+"</td><td>"+val.comment+"</td><td>"+val.date+"</td></tr>";
			//out = out + "<tr><td style='width: 100%;'><div><span style='float:  left;'>"+val.area+"</span><span style='float:  right;'>"+val.date+"</span></div><div  style='margin-top: 1.5em;border-top: 1px solid #b9b6b6;padding-top:  2em;'>"+val.comment+"</div></td></tr>";
			while (val.comment.indexOf("\\n") !== -1) {
				val.comment = val.comment.replace("\\n", "<br />");
			}
			 
			out = out + "<table class='comentbox'><tr><td style=''><span class='areaspan' >"+val.area+" ("+val.user+")</span><span class='datespan' >"+val.date+"</span><div class='comenttext' style='' >"+val.comment.replace(/"/g , " ")+"</div></td></tr></table>";
			 
		}
	});
	out = out + "</table>"
	document.getElementById('commentsList').innerHTML = out;
}

function viewDetails(){
	var u = getWebsiteURL();	   			
	$.ajax({
		url: u + "rest/get/search/getDetailsByPlaceId/"+place_id,
		dataType: "json",
		async: false,
        	type: 'GET',
       	success: function(place){
       		document.getElementById('iconSV').src = place.icon;
   			document.getElementById('name').innerHTML = place.name; 
   			document.getElementById('address').innerHTML = place.formatted_address;
   			if (place.hasOwnProperty('international_phone_number')) {
   				document.getElementById('phno').innerHTML = place.international_phone_number; 
   				document.getElementById('phnoa').href = "tel:"+place.international_phone_number; 
   			}else{ 
   				document.getElementById('phno').innerHTML = "N/A"; 
   				document.getElementById('phnoa').href = "#"; 
   			}
   			if (place.hasOwnProperty('rating')) {
   				document.getElementById('rating').innerHTML = place.rating;   			
   			}else{
   				document.getElementById('rating').innerHTML = "N/A"; 
   			}
   			document.getElementById('url').value = place.url;
   			
   			if (place.hasOwnProperty('website')) {
   				document.getElementById('website').href = place.website;   			
   			}else{
   				document.getElementById('website').href = '#'; 
   			} 
   			if (place.hasOwnProperty('reviews')) {
	   			if (place.reviews.length == 1) {
	   	   			document.getElementById('reviews').innerHTML = place.reviews.length +" review";	
	   	   			document.getElementById('reviewsHeadTitle').innerHTML = place.reviews.length +" review";
				}else{
					document.getElementById('reviews').innerHTML = place.reviews.length +" reviews";
					document.getElementById('reviewsHeadTitle').innerHTML = place.reviews.length +" reviews";
	   			}
	   			var oout="";	   			
	   			$.each(place.reviews, function(key, val) {	   				
					oout = oout + "<article class='article' style='padding: 0em;'><ul>";
					oout = oout + "<li><span class=detailsSpan>";
					oout = oout + "<h4>"+val["author_name"]+"</h4>";
					oout = oout + "<p class=address><i>"+val["text"]+"</i></p>";
					oout = oout + "<footer class=bottom>";
					oout = oout + "<div><i class='fa fa-star' aria-hidden='true'></i>&nbsp;"+val["rating"]+"</div>";
					oout = oout + "<div>"+new Date(val["time"]*1000).toUTCString()+"</div>";
					oout = oout + "</li></ul></article>";
	   				
	   				console.log(key, val["author_name"]);
	   			});
	   			document.getElementById('reviewsdisplay').innerHTML = oout;
	   		}else{
   				document.getElementById('reviews').innerHTML = "0 reviews";
   			}
   			var loc = "", map = "", dis1 = "", dis2 = "", nm="", ad="";
   			var lat = getLattitude(); 
            var lon = getLongitude();
   			loc = getCookie("locAddress");
   			nm = addStarsToString(place.name);
   			d = addStarsToString(place.formatted_address);
   			ad = place.formatted_address;
   			//alert(addStarsToString(loc));
   			map = "http://www.google.co.in/maps/dir/"+lat+","+lon+"/"+nm+"/"+place.geometry.location.lat+","+place.geometry.location.lng;
   			document.getElementById('direction').href = map;//decodeURIComponent((map.trim()).replace(/%20/g, ''));
   			
            var slat = lat;
            var slon = lon;
            if (getCookie("slat") != '' && getCookie("slon") != '') {
            	slat = getCookie("slat");
            	slon = getCookie("slon");
			}
            
            //console.log(lat, lon, slat, slon);
            dis1 =  findDistance(lat, lon, place.geometry.location.lat, place.geometry.location.lng);
   			dis2 =  findDistance(slat, slon, place.geometry.location.lat, place.geometry.location.lng);
   			document.getElementById('dis1').innerHTML =  Math.round(dis1*100)/100;
   			document.getElementById('dis2').innerHTML = Math.round(dis2*100)/100;  
   			
   			
       	}
      });
}