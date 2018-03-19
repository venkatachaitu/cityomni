<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Three --><br><br>
<section id="three" class="wrapper align-center">
   <div class="inner">
      <header>
         <h3 class="servicesTitle" id="titleHeader">Services</h3>
         <hr>
	<!-- CPM AFFILIATION TAG MEGABANNER 728X90 (cityhalt.com) -->
		<script type='text/javascript'>
		var cpma_rnd=Math.floor(Math.random()*99999999999);
		document.write("<scr"+"ipt type='text/javascript' src='http://www.cpmaffiliation.com/114811-728x90.js?rnd="+cpma_rnd+"'></scr"+"ipt>");
		</script>
	<!-- FIN TAG CPM AFFILIATION -->
      </header>
      <div class="flex flex-2 services" id="services">
         <img class="loadingImage" src="images/loading2.gif" alt="loading" />
      </div>
   </div>
</section>
<script>
   window.onload = loadStatesPage();
   	function loadStatesPage(){			
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
	   			//alert(window.location.hostname);
	   			var out = "", key="";
	   			var arry=["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chandigarh","Chhattisgarh","Delhi","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Pondicherry","Punjab","Rajasthan","Tamil Nadu","Tripura","Uttar Pradesh","Uttaranchal","West Bengal"];
		        for(var i=0; i< arry.length; i++){
		        	key = arry[i];
		        	//console.log(key);	
		        	out = out + "<article><header>";
					out = out + "<a target="+key+" href=";
					out = out + u+"cities?state=" + removeSpaces(key);
					out = out + "><h4><img class='viewAllServiceIcons' src='images/serviceIcons/"+key+".png'>";
					out = out + addSpaces(key);								 
					out = out + "</h4></a></header></article>";
				 }
		        document.getElementById("services").innerHTML = out;	
			  	document.getElementById("titleHeader").innerHTML = "states in india";
	   			
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
