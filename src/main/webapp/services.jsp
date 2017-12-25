<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

</style>
<script>
   window.onload = loadServicesPage();
   	function loadServicesPage(){			
   		try{ 
   			updateGPSLocation();
   			//if(isLocationEnable()){   			
	   			var loc = getCookie("location");
	   			var loc11 = getUrlVars()["location"];
	   			if(typeof loc11 !== "undefined"){
		   			if(loc11 != ""){
	       				loc = loc11;
	       			}
	   			}
	   			if(loc == ""){
	   				console.log("services : location is "+loc);
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc; 
	   			var u = getWebsiteURL();
	   			 
	   			$.getJSON(u+"rest/get/getCat/"+loc.toLowerCase(), function( data ) {
				  var out = "";		
				  data = sortObject(data);				  
				  $.each( data, function( key, val ) {
					     if(key != "undefined"){
					    	 if(val != '999999'){
								  out = out + "<article><header>";
								  out = out + "<a target="+key+" href=";
								  out = out + u+"viewList?location=" + loc + "&category="+key;
								  out = out + "><h4><img class='viewAllServiceIcons' src='images/serviceIcons/"+key+".png'>";
								  out = out + addSpaces(key);								 
								  out = out + "</h4></a></header></article>"
					    	 }
				  		 }
				  });
				  document.getElementById("services").innerHTML = out;	
				  document.getElementById("titleHeader").innerHTML = "Services in "+loc;
				  
				});
	   			
   			/* }else{
   				promptForLocation();
   				loadServicesPage();
   			} */   				
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
<%@include file="footer.jsp" %>