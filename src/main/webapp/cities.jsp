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
   				updateGPSLocation()
	   			var state = getUrlVars()["state"];
	   			var u = getWebsiteURL();
	   			$.getJSON(u+"rest/get/latlon/"+state+"/cities", function( data ) {
	   			 	var out = "";			
				  	console.log(data[1]);
	   				for (var i = 0; i < data.length; i++) { 	   				    
	   				  out = out + "<article><header>";
					  out = out + "<a target='' href=";
					  out = out + u+"services?city="+removeSpaces(data[i].toString());
					  //out = out + "&lat="+data[i]['lat'].toString()+"&lon="+data[i]['lon'].toString();
					  out = out + "><h4><img class='viewAllServiceIcons' src='images/serviceIcons/.png'>";
					  out = out + data[i];								 
					  out = out + "</h4></a></header></article>"
	   				}
					document.getElementById("services").innerHTML = out;	
					document.getElementById("titleHeader").innerHTML = "Cities in "+addSpaces(state); 
					  
					});
   		}catch(e){alert(e);}			
   	}
</script>
<%@include file="footer.jsp" %>
