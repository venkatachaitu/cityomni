<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

</style>

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
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc; 
	   			var u = getWebsiteURL();
	   			
	   			var out = "", key="";
	   			var arry=["atms","auto_mobiles","banks","bars","beauty_parlours","blood_and_eye_banks","bus_stations","coffee_shops","colleges","computer_institutes","computer_services","dance_schools","fashion_and_cloth_stores","fire_stations","gas_and_petrol_stations","gift_shops","govt_offices","grocery_stores","hardware_shops","hospitals","hostels","hotels","insurance_companies","jewellery_shops","libraries","lodges","mobile_shops","museums","packers_and_movers","parcel_and_couriers","parks","party_halls","pharmacy","photo_studios","play_schools","police_stations","railway_stations","real_estate_agents","restaurents","schools","shopping_malls","software_companies","stadiums","temples","theaters","tours_and_travels","universities"];
		        for(var i=0; i< arry.length; i++){
		        	key = arry[i];
		        	out = out + "<article><header>";
					out = out + "<a target="+key+" href=";
					out = out + u+"viewList?location=" + loc + "&category="+key;
					out = out + "><h4><img class='viewAllServiceIcons' src='images/serviceIcons/"+key+".png'>";
					out = out + addSpaces(key);								 
					out = out + "</h4></a></header></article>";
				 }
		        document.getElementById("services").innerHTML = out;	
			  	document.getElementById("titleHeader").innerHTML = "Services in "+loc;
	   			
			  	var desc1 = $('meta[name=description]').attr("content");
				var descTab = "services in "+loc+ " "+desc1;				
				
	   			$('meta[name=description]').remove();
	            $('head').append( "<meta name='description' content='"+descTab+"'>" );
	            
			  	
	   			/* $.getJSON(u+"rest/get/getCat/"+loc.toLowerCase(), function( data ) {
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
				  
				}); */
	   			
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
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<ins class="adsbygoogle"
	     style="display:block"
	     data-ad-format="fluid"
	     data-ad-layout-key="-fg+5m+7r-g6+16"
	     data-ad-client="ca-pub-9571339575910580"
	     data-ad-slot="9602038373"></ins>
	<script>
	     (adsbygoogle = window.adsbygoogle || []).push({});
	</script>
	
	
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<script>
	  (adsbygoogle = window.adsbygoogle || []).push({
	    google_ad_client: "ca-pub-9571339575910580",
	    enable_page_level_ads: true
	  });
	</script>
<%@include file="footer.jsp" %>
