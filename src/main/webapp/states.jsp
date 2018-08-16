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
   window.onload = loadStatesPage();
   	function loadStatesPage(){		
   		try{ 
   			updateGPSLocation();
   			var u = getWebsiteURL();
   			var out = "", key="";
   			var arry=["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chandigarh","Chhattisgarh","Delhi","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Pondicherry","Punjab","Rajasthan","Tamil Nadu","Tripura","Uttar Pradesh","Uttaranchal","West Bengal"];
	        for(var i=0; i< arry.length; i++){
	        	key = arry[i];
	        	out = out + "<article><header>";
				out = out + "<a target="+key+" href=";
				out = out + u+"cities?state=" + removeSpaces(key);
				out = out + "><h4><span class='viewAllServiceIcons icon fa fa-thumb-tack'></span>";
				out = out + addSpaces(key);								 
				out = out + "</h4></a></header></article>";
			 }
	        document.getElementById("services").innerHTML = out;	
		  	document.getElementById("titleHeader").innerHTML = "states in india";   				
   		}catch(e){alert(e);}			
   	}
</script>
<%@include file="footer.jsp" %>
