<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
   <head>
		<title>cityomni - Welcome to cityomni one place for complete city information and services</title>	
		<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
		<meta name=distribution content=global />
		<meta name=copyright content=cityomni.com />
		<meta name=viewport content="width=device-width, initial-scale=1"/>
		<meta name="Keywords" content="cityomni, city omni, cityomni.com , Atms, Auto Mobiles, Banks, Bars, Beauty Parlours, Blood And Eye Banks, Bus Stations, Coffee Shops, Colleges, Computer Institutes, Computer Services, Dance Schools, Fashion And Cloth Stores, Fire Stations, Gas And Petrol Stations, Gift Shops, Govt Offices, Grocery Stores, Hardware Shops, Hospitals, Hostels, Hotels, Insurance Companies, Jewellery Shops, Libraries, Lodges, Mobile Shops, Museums, Packers And Movers, Parcel And Couriers, Parks, Party Halls, Pharmacy, Photo Studios, Play Schools, Police Stations, Railway Stations, Real Estate Agents, Restaurents, Schools, Shopping Malls, Software Companies, Stadiums, Temples, Theaters, Tours And Travels, Universities" />		
		<meta name="description" content="cityomni city omni cityomni.com : Welcome to cityomni one place for complete city information of Metro cities in india : DELHI MUMBAI KOLKATA CHENNAI BANGALORE HYDERABAD AHMEDABAD PUNE SURAT JAIPUR Welcome to CITYomni one place for complete city information and services like Atms, Auto Mobiles, Banks, Bars, Beauty Parlours, Blood And Eye Banks, Bus Stations, Coffee Shops, Colleges, Computer Institutes, Computer Services, Dance Schools, Fashion And Cloth Stores, Fire Stations, Gas And Petrol Stations, Gift Shops, Govt Offices, Grocery Stores, Hardware Shops, Hospitals, Hostels, Hotels, Insurance Companies, Jewellery Shops, Libraries, Lodges, Mobile Shops, Museums, Packers And Movers, Parcel And Couriers, Parks, Party Halls, Pharmacy, Photo Studios, Play Schools, Police Stations, Railway Stations, Real Estate Agents, Restaurents, Schools, Shopping Malls, Software Companies, Stadiums, Temples, Theaters, Tours And Travels, Universities in cityomni, city omni, cityomni.com metro cities in india and services like Atms, Auto Mobiles, Banks, Bars, Beauty Parlours, Blood And Eye Banks, Bus Stations, Coffee Shops, Colleges, Computer Institutes, Computer Services, Dance Schools, Fashion And Cloth Stores, Fire Stations, Gas And Petrol Stations, Gift Shops, Govt Offices, Grocery Stores, Hardware Shops, Hospitals, Hostels, Hotels, Insurance Companies, Jewellery Shops, Libraries, Lodges, Mobile Shops, Museums, Packers And Movers, Parcel And Couriers, Parks, Party Halls, Pharmacy, Photo Studios, Play Schools, Police Stations, Railway Stations, Real Estate Agents, Restaurents, Schools, Shopping Malls, Software Companies, Stadiums, Temples, Theaters, Tours And Travels, Universities in cityomni, city omni, cityomni.com" />
		
      	<meta name="google-site-verification" content="WfQZCcri0H3ngUj-lsejT6ihHG5ap2ZDa3fYnXGmpWA" />

		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js" ></script>
		<script>
			(adsbygoogle = window.adsbygoogle || []).push({
			  google_ad_client: "ca-pub-3816265946625313",
			  enable_page_level_ads: true
			});
		</script>
				
		<script src="js/jquery.min.js" ></script>
		<script src="js/skel.min.js" ></script>
		<script src="js/util.js" ></script>
		<script src="js/main.js" ></script>
		<script src="js/bootstrap.min.js" ></script>
		<script src="js/custom.js" ></script>
		<script src="js/jquery-1.10.2.min.js" ></script>
		<script src="js/locationCheck.js" ></script>
		
		<link href="images/favicon.ico" rel="icon" type="image/x-icon" >
		<link rel="stylesheet" href="css/main.css" >
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<link rel="stylesheet" href="css/font-awesome.css" >
   </head>
   <body onload="loadIndexPage()">  
	<%-- <%@include file="locationPrompt.jsp" %> --%>
      <!-- Header -->
      <header id="header" >
         <div class="inner">
            <nav id="nav" class="menuNav">
                <span style="display: none;" onclick="changeLocation()" class="headerMenu" >
               <i class="fa fa-map-marker fa-fw"></i>
               <span id="locationHome"></span>
               </span>  
               <span class="headerMenu" style="display: none;" id="time"></span>
               <a class="headerMenu" href="./">Home</a>               
               <a class="headerMenu" href="./states">States</a>
               <a class="headerMenu" href="./services">Services</a>
               <a class="headerMenu" href="./metroCities">Metro Cities</a>
               <!-- <a class="headerMenu" href="./plans">Plans</a> -->
               <a class="headerMenu" href="./about">About</a>
               <a class="headerMenu" href="./contact">Contact</a>
               <!--<a class="headerMenu" href="./createPlan">Create Plan</a> -->
               <!-- <a href="https://cityomni.com">Login</a> -->
            </nav>
            <!-- <a href="https://cityomni.com" class="logo"><strong>city</strong> omni</a>  -->
           <a href="./"><img class="logo" src="images/logo.png" alt="cityhalt"></a>   
	 <!-- <a href="./">
		 <h2 class="logo" style=" font-size: 2.5em;font-weight: 600;font-style: italic;text-shadow: 2px 2px 3px #F44336;">city<font style="color: #ffffff; font-style: italic; text-shadow: 2px 2px 3px #03A9F4;font-size: 1.5em;">O</font>mni</h2>
	</a> -->
            <a href="#navPanel" class="navPanelToggle" ><span class="fa fa-bars"></span></a> 
         </div> 
      </header>
      
      <!-- Banner -->
      <section id="banner" style="height: 100%;padding-top: 2em;">
         <div class="inner">
            <header>
               <h1>Welcome to cityOmni</h1>
               <h4 style="font-style: italic;font-size: 1.2em;">one place for complete city information and services</h4>
            </header>
            <!-- Search Block -->
            <section id="searchBlock" class="wrapper align-center" style="padding: 0;">
               <div class="inner" style="padding: 0px 13px;">
                  <form action="./search" method="get" onsubmit="return Submit()">
                     <div class="flex flex-2 searchInnerDiv"  style="margin: 0;">
                        <article style="background-color: rgba(255, 0, 0, 0);">
                           <header class="selectCity" style="background-color: rgba(255, 0, 0, 0);">
                              <!-- <select name="city" id="searchCity" onchange="changeCity()" required>
                                 <option value="-1">Select City</option>
                                 <option value="delhi">Delhi</option>                                 
                                 <option value="chennai">Chennai</option>
                                 <option value="vijayawada">Vijayawada</option>                                 
                                 <option value="tirupati">Tirupati</option>
                              </select> -->
                              <i onclick="setCurrentLocationToSearchBox()" style="color: #e6e6e6;float:  left;margin-left: -1em;font-size: 1.5em;margin-top:  0.2em;" class="fa fa-map-marker" aria-hidden="true"></i>
                              <input class="searchCity" name="city" id="searchCity" placeholder="Enter a city" type="text" />  
                              <i class="fa fa-times-circle bbu" aria-hidden="true" onclick="clearSearchCity()"></i>
                              <!-- <span class="bbu" onclick="clearSearchCity()">x</span> -->
                              <style>
                               	.bbu{
								    float: right;
								    margin: -1.5em 0.3em 0em 0em;
								    font-size: 1em;
								    color: #989696;
								    width: 1em;
								    height: 1em;
								    position: relative;
                               	}
                               	.bbu:HOVER{
								    color: #fff;
                               	}
                              
                              </style>
                              <script>
                              	function clearSearchCity(){
                              		document.getElementById('searchCity').value = '';
                              		document.getElementById('searchCity').focus();
                              	}
                              	function setCurrentLocationToSearchBox(){
                              		//alert("setCurrentLocationToSearchBox()"+getLattitude()+" "+getLongitude());
                              		document.getElementById('searchCity').value = decodeURIComponent((getCurAdd()).replace(/\+/g, '%20'));
                              		if(document.getElementById("lat") != null && document.getElementById("lon") != null){
                        		    	document.getElementById("lat").value = getLattitude();
                        				document.getElementById("lon").value = getLongitude();
                        	    	} 
                              	}
                              </script>
                              <input type="hidden" name="lat" id="lat" value="">
                              <input type="hidden" name="lon" id="lon" value="">
                              <!-- <input type="hidden" name="withIn" value="1000"> -->
                              <!-- <select name="city" id="searchCity" required="">onchange="changeCity()"
								<option value="-1">Select City</option>
								<option value="delhi">Delhi</option>
								<option value="mumbai">Mumbai</option>
								<option value="kolkata">Kolkata</option>
								<option value="chennai">Chennai</option>
								<option value="bangalore">Bangalore</option>
								<option value="hyderabad">Hyderabad</option>
								<option value="ahmedabad">Ahmedabad</option>
								<option value="pune">Pune</option>
								<option value="surat">Surat</option>
								<option value="jaipur">Jaipur</option>
							</select> -->
							<script> 
							  function initMap() {
								  var countryRestrict = {'country': 'in'};//http://www.geognos.com/api/en/countries/info/all.json
									var autoComplete = new google.maps.places.Autocomplete(
									/** @type {!HTMLInputElement} */ (
										document.getElementById('searchCity')), {
									  types: [], //address, establishment, geocode
									  componentRestrictions: countryRestrict//regions ,cities
									});
									
									google.maps.event.addListener(autoComplete, 'place_changed', function() {
										var loc = this.getPlace().geometry.location;
										document.getElementById("lat").value = loc.lat();
										document.getElementById("lon").value = loc.lng();
										//alert(loc.lat()+"----"+loc.lng());
										
										setCookieWithOutReload("slat", loc.lat(), 365);
										setCookieWithOutReload("slon", loc.lng(), 365);
									});
							  }
							</script> 
							<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCw-Viepxab4m9pRRQyjm_yRq1uhOj9iPc&libraries=places&callback=initMap" async defer></script>
							<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places,visualization&v=3.exp&callback=initMap"></script> -->
						<style>
  							   .searchCity{
	  							    transition: .5s;
								    color: #fff !important;
								    background-color: rgba(255, 0, 0, 0) !important;
								    border: 1px solid #c5c5c5;
								    border-width: 1px;
								    height: 2em !important;
								    font-family: inherit;
								    font-weight: 100;
								    border-radius: 0 !important;
						    	}
  						</style>
                           </header>
                        </article>
                        <!-- &nbsp;&nbsp;&nbsp; 
                        <article style="background-color: rgba(255, 0, 0, 0);">
                           <header class="selectCity" style="background-color: rgba(255, 0, 0, 0);">
                              <select name="category" id="searchCategories" required>
                                 <option value="-1">Select Category</option>
                              </select>
                           </header>
                        </article> -->
                        &nbsp;&nbsp;&nbsp; 
                        <article style="background-color: rgba(255, 0, 0, 0);">
                           <header class="selectCity" style="background-color: rgba(255, 0, 0, 0);">
                              <select name="category" id="searchCategories" required="required"><option ></option></select>
                           </header>
                        </article>
                     </div>
                     <div class="flex flex-2 searchInnerDiv" style="margin: 0;padding: 0;">
                        <article class="searchBoxInputArticle" style="width: 100% !important; margin-top: 1em !important;">
                           <header>
                              <div>
                              	 <input id="searchContent" name="searchContent" type="hidden">
                                 <input onkeyup="typeInSearchBox()" autocomplete="off" style="transition: .5s;color: #fff !important; background-color: rgba(255, 0, 0, 0) !important;border-radius: 2px 0 0 2px !important;border-right: 0px !important;"  id="searchBoxInput" class="searchBoxInput" type="text" placeholder="search here" >
                                 <input style="width: 78px;background-color: #ff2436;border-radius: 0 2px 2px 0;" class="searchBoxSubmit" type="submit" value="Search"  >
                              </div>
                           </header>
                        </article>
                     </div>
                  </form>
               </div>
            </section>
            <style>
               select{
               background-color: rgba(245, 228, 228, 0) !important;
               color: #fff !important;
               border-radius: 2px;
               }
               option{
               background-color: rgb(69, 69, 85) !important;
               color: #ffffff !important;
               text-transform: uppercase;
               }
            </style>
            <script>            
               $('.dropdown-menu a').on('click', function(){    
               	$('.dropdown-toggle').html($(this).html() + '<span class="caret"></span>');    
               })
            </script>	
            <div class="flex ">
               <div style="cursor: pointer;">
	               <a target="hotels" href="./search?category=lodging">
	                  <span class="icon fa fa-bed"></span>
	                  <h3>Lodging</h3>
	                  <p>5, 3, 2 Star Hotels</p>
	                </a>
               </div>
               <div style="cursor: pointer;">
               	<a target="banks" href="./search?category=bank">
                  <span class="icon fa-university"></span>
                  <h3>Banks</h3>
                  <p>Central, State Banks, etc.</p>
                  </a>
               </div>
               <div style="cursor: pointer;">
               	<a target="coffee_shops" href="./search?category=cafe">
                  <span class="icon fa-coffee"></span>
                  <h3>Coffee Shops</h3>
                  <p>CoffeeDay, Barista, etc.</p>
                  </a>
               </div>
            </div>
            <footer>
               <a id="servicesLink" href="./services" class="button viewAllButtonHomePage">View All Services</a>
            </footer>
         </div>
      </section>
      <section id="three" class="wrapper align-center" >
         <div class="inner"> 
		<header>
			<h3 class="servicesTitle" id="titleHeader">Metro Cities in India</h3>
		</header>
            <div class="flex flex-2">
			    
			    <article>
				    <a class="indexPageCityBlock" href="./services?location=delhi">
				        <div class="image round">
				            <img src="images/delhi.png" alt="Delhi">
				        </div>
				        <header>
				            <h3>1. Delhi</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">Among all metropolitan cities in India, Delhi stands on top with a population of 4.6 Crore. National Capital Territory of Delhi or Delhi is one of the largest commercial centres of the country with a GDP of more than $160 Billion. Delhi is also a centre of esteemed educational institutions of different domains like engineering, medical, law, commerce, science, etc.</p>
				        <footer>
				            <h2 class="button" >View More</h2>
				        </footer>
			        </a>
			    </article>
			    <article>
				    <a class="indexPageCityBlock" href="./services?location=mumbai">
				        <div class="image round">
				            <img src="images/mumbai.png" alt="Mumbai">
				        </div>
				        <header>
				            <h3>2. Mumbai</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">Popularly known as City of Dreams, Mumbai with a population of 1.84 Crore stand at 2nd in the list of top 10 metropolitan cities in India. Being Financial Capital of India, Mumbai contributes more than 6% of the country's GDP and has a GDP of more than $200 Billion. Mumbai is the headquarter of many public sector companies, government institutions and giant corporations.</p>
				        <footer>
				             <h2 class="button" >View More</h2>
				        </footer>
				    </a>
			    </article>
			     <article>
				    <a class="indexPageCityBlock" href="./services?location=kolkata">					   
				        <div class="image round">
				            <img src="images/kolkata.png" alt="Kolkata">
				        </div>
				        <header>
				            <h3>3. Kolkata</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">Kolkata, also known as Cultural Capital of India is among the most developed cities in India and occupied 3rd place in this list. Capital City of West Bengal, Kolkata with a GDP of more than $150 Billion is 3rd largest city in the country in terms of GDP. Kolkata is the largest commercial city of the eastern part of India and a centre of numerous private and public sector companies.</p>
				        <footer>
				             <h2 class="button" >View More</h2>
				        </footer>
				    </a>
			     </article>
			     <article>
				    <a class="indexPageCityBlock" href="./services?location=chennai">
				        <div class="image round">
				            <img src="images/chennai.png" alt="chennai">
				        </div>
				        <header>
				            <h3>4. Chennai</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">Chennai formerly known as Madras is the capital of the Indian state of Tamil Nadu. Located on the Coromandel Coast off the Bay of Bengal, it is one of the biggest cultural, economic and educational centres in South India. According to the 2011 Indian census (adjusted for the new limits of Chennai city), it is the fifth-largest city and fourth-most populous urban agglomeration in India.</p>
				        <footer>
				             <h2 class="button" >View More</h2>
				        </footer>
				    </a>
			    </article> 
			    <article>
			    	<a class="indexPageCityBlock" href="./services?location=bangalore">
				        <div class="image round">
				            <img src="images/bangalore.png" alt="Chennai">
				        </div>
				        <header>
				            <h3>5. Bangalore</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">Bangalore officially known as Bengaluru is the capital of the Indian state of Karnataka. It has a population of about 8.42 million and a metropolitan population of about 8.52 million, making it the third most populous city and fifth most populous urban agglomeration in India.Its elevation is over 900 m (3,000 ft) above sea level, the highest of India's major cities.</p>
				        <footer>
				             <h2 class="button" >View More</h2>
				        </footer>
			        </a>
			    </article> 
			    <article>
				    <a class="indexPageCityBlock" href="./services?location=hyderabad">
				        <div class="image round">
				            <img src="images/hyderabad.png" alt="Hyderabad">
				        </div>
				        <header>
				            <h3>6. Hyderabad</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">Hyderabad is the capital of the southern Indian state of Telangana and de jure capital of Andhra Pradesh. Occupying 650 square kilometres (250 sq mi) along the banks of the Musi River, it has a population of about 6.7 million and a metropolitan population of about 7.75 million, making it the fourth most populous city and sixth most populous urban agglomeration in India.</p>
				        <footer>
				             <h2 class="button" >View More</h2>
				        </footer>
			        </a>
			    </article>
			    
			    <a id="servicesLink" href="./metroCities" class="button viewAllMetroCities" >View All Metro cities in Inida</a>
			</div>
         </div>
      </section>     
      <%@include file="footer.jsp" %>
   </body>
</html>
