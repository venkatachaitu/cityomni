<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Three --><br><br>
<section id="three" class="wrapper align-center">
   <div class="inner">
	   <!-- ====ADGEBRA 728x90===== -->
		<div id="div_1220180628123854">
			<script>
				var domain = (window.location != window.parent.location)? document.referrer : document.location.href;
				if(domain==""){domain = (window.location != window.parent.location) ? window.parent.location: document.location.href;}
				var scpt=document.createElement("script");
				var GetAttribute = "afpftpPixel_"+(Math.floor((Math.random() * 500) + 1))+"_"+Date.now() ;
				scpt.src="//adgebra.co.in/afpf/GetAfpftpJs?parentAttribute="+GetAttribute;
				scpt.id=GetAttribute;
				scpt.setAttribute("data-pubid","2496");
				scpt.setAttribute("data-slotId","1");
				scpt.setAttribute("data-templateId","66");
				scpt.setAttribute("data-accessMode","1");
				scpt.setAttribute("data-domain",domain);
				scpt.setAttribute("data-divId","div_1220180628123854");
				document.getElementById("div_1220180628123854").appendChild(scpt);
			</script>
		</div>
		<!-- ====ADGEBRA 728x90===== -->
	   <!--   =========CHITIKA=============== -->
    	<script type="text/javascript">
	  ( function() {
	    if (window.CHITIKA === undefined) { window.CHITIKA = { 'units' : [] }; };
	    var unit = {"calltype":"async[2]","publisher":"cityomni","width":728,"height":90,"sid":"Chitika Default"};
	    var placement_id = window.CHITIKA.units.length;
	    window.CHITIKA.units.push(unit);
	    document.write('<div id="chitikaAdBlock-' + placement_id + '"></div>');
	}());
	</script>
	<script type="text/javascript" src="//cdn.chitika.net/getads.js" async></script>
	<!--   =========CHITIKA=============== -->
      <header>
         <h3 class="servicesTitle" id="titleHeader">Services Available.</h3>
         <hr>
      </header>
      <div class="flex flex-2 services" id="services">
         <img class="loadingImage" src="images/loading2.gif" alt="loading" />
      </div>
   </div>
	<!--   =========CHITIKA=============== -->
	<script type="text/javascript">
	  ( function() {
	    if (window.CHITIKA === undefined) { window.CHITIKA = { 'units' : [] }; };
	    var unit = {"calltype":"async[2]","publisher":"cityomni","width":550,"height":250,"sid":"Chitika Default"};
	    var placement_id = window.CHITIKA.units.length;
	    window.CHITIKA.units.push(unit);
	    document.write('<div id="chitikaAdBlock-' + placement_id + '"></div>');
	}());
	</script>
	<script type="text/javascript" src="//cdn.chitika.net/getads.js" async></script>
	<!--   =========CHITIKA=============== -->
</section>
<script>
   window.onload = loadServicesPage();
   	function loadServicesPage(){			
   		try{ 	
   				updateGPSLocation();
	   			var city = getUrlVars()["city"];
	   			var u = getWebsiteURL();
	   			var out = "", key="";
	   			var arry=["accounting", "airport", "amusement_park", "aquarium", "art_gallery", "atm", "bakery", "bank", "bar", "beauty_salon", "bicycle_store", "book_store", "bowling_alley", "bus_station", "cafe", "campground", "car_dealer", "car_rental", "car_repair", "car_wash", "casino", "cemetery", "church", "city_hall", "clothing_store", "convenience_store", "courthouse", "dentist", "department_store", "doctor", "electrician", "electronics_store", "embassy", "fire_station", "florist", "funeral_home", "furniture_store", "gas_station", "gym", "hair_care", "hardware_store", "hindu_temple", "home_goods_store", "hospital", "insurance_agency", "jewelry_store", "laundry", "lawyer", "library", "liquor_store", "local_government_office", "locksmith", "lodging", "meal_delivery", "meal_takeaway", "mosque", "movie_rental", "movie_theater", "moving_company", "museum", "night_club", "painter", "park", "parking", "pet_store", "pharmacy", "physiotherapist", "plumber", "police", "post_office", "real_estate_agency", "restaurant", "roofing_contractor", "rv_park", "school", "shoe_store", "shopping_mall", "spa", "stadium", "storage", "store", "subway_station", "supermarket", "synagogue", "taxi_stand", "train_station", "transit_station", "travel_agency", "veterinary_care", "zoo"];
		        for(var i=0; i< arry.length; i++){
		        	key = arry[i];
		        	out = out + "<article><header>";
					out = out + "<a target="+key+" href=";					
					if(typeof city !== "undefined"){
						out = out + u+"search?city="+city+"&category="+key;
					}else{
						out = out + u+"search?category="+key;
					}
					out = out + "><h4><img class='viewAllServiceIcons' src='images/serviceIcons/"+key.replace(/_/g, "-")+".svg'>";
					out = out + addSpaces(key);								 
					out = out + "</h4></a></header></article>";
				 }
		        document.getElementById("services").innerHTML = out;	
			
   		}catch(e){alert(e);}			
   	}
</script>
<%@include file="footer.jsp" %>
