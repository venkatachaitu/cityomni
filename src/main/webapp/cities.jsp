<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Three --><br><br>
<section id="three" class="wrapper align-center">
   <div class="inner">
      <header>
         <h3 class="servicesTitle" id="titleHeader">Services</h3>
         <hr>
      </header>
      <div class="flex flex-2 services" id="services">
         <img class="loadingImage" src="images/loading2.gif" alt="loading" />
      </div>
   </div>
</section>
<script>
   window.onload = loadcitiesPage();
   	function loadcitiesPage(){			
   		try{ 
   			updateGPSLocation();
   			//if(isLocationEnable()){   			
	   			var loc = getCookie("location");
	   			var loc11 = getUrlVars()["location"];
	   			var state = getUrlVars()["state"];
	   			if(typeof loc11 !== "undefined"){
		   			if(loc11 != ""){
	       				loc = loc11;
	       			}
	   			}
	   			if(loc == ""){
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc; 
	   			var u = getWebsiteURL();
	   			$.getJSON(u+"rest/get/latlon/"+state+"/cities", function( data ) {
	   			 	var out = "";		
				  	//data = sortObject(data);		
				  	console.log(data[1]);
	   				for (var i = 0; i < data.length; i++) { 	   				    
	   				  out = out + "<article><header>";
					  out = out + "<a target='' href=";
					  out = out + u+"services?location="+removeSpaces(data[i].toString());
					  //out = out + "&lat="+data[i]['lat'].toString()+"&lon="+data[i]['lon'].toString();
					  out = out + "><h4><img class='viewAllServiceIcons' src='images/serviceIcons/.png'>";
					  out = out + data[i];								 
					  out = out + "</h4></a></header></article>"
	   				}
	   			
					  document.getElementById("services").innerHTML = out;	
					  document.getElementById("titleHeader").innerHTML = "Cities in "+addSpaces(state); 
					  
					});
	   			
			  	var desc1 = $('meta[name=description]').attr("content");
				var descTab = "services in "+loc+ " "+desc1;				
				
	   			$('meta[name=description]').remove();
	            $('head').append( "<meta name='description' content='"+descTab+"'>" );
	            
			  	   				
   		}catch(e){alert(e);}			
   	}
   	function setCookieWithOutReload(cname, cvalue, exdays) {
   	    try {
   	        var d = new Date();
   	        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
   	        var expires = "expires=" + d.toUTCString();
   	        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
   	    } catch (e) {
   	        alert(e);
   	    }
   	}
</script>
<%@include file="footer.jsp" %>
