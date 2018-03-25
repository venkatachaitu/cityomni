<%@include file="header.jsp" %>
<script>
	var dar = [];	
	var lit = 5;
	var ct = 0;
	var city, lat, lon, category, searchContent, withIn;
	var jsonArr = "[";
   window.onload = createPlanPage();
   	function createPlanPage(){
   		try{ 
   			updateGPSLocation();
   			//if(isLocationEnable()){				
	   			var loc = getCookie("location");
	   			var loc11 = getUrlVars()["location"];
	   			if(typeof loc11 !== "undefined"){
		   			if(loc11 != "")
		   				loc = loc11;
	   			}
	   			if(loc == ""){
	   				console.log("confession page : location is "+loc);
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc;
	   			
	   			var u = getWebsiteURL();
   		}catch(e){alert("loadConfessionPage(): "+e);}
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
<style>
	   .searchCity{
	        transition: .5s;
		    color: #0e0e0e !important;
		    background-color: rgb(255, 255, 255) !important;
		    border: 1px solid #c5c5c5;
		    border-width: 1px;
		    height: 2em !important;
		    font-family: inherit;
		    font-weight: 100;
		    border-radius: 0 !important;
	  	}
</style>
<!-- Three --><br><br>
<section id="three" class="wrapper align-center">
   <div class="inner">
      <header style="margin:0px;">
      <h3 style="color:red;font-size:  1.55em;line-height: 2em;">CREATE YOUR TOUR PLAN</h3>
      </header>
      <div class="flex flex-2 " id="confessionFlex">	
         <div class="leftSide">
         	<h5>Route Map:</h5> 
			<hr>
			<h6>Start:</h6>
			<hr>
			<h6>End:</h6>
			<hr>
			<br><br><br><br><br><br><br>
         </div>
         
		<div class="centerSide">
			<div>
				<!-- Search Block -->
            <section id="searchBlock" class="wrapper align-center" style="padding: 0;  ">
               <div class="inner" style="padding: 0px 13px;">
                  <!-- <form action="./search" method="get" onsubmit="return Submit()"> -->
                     <div class="flex flex-2 searchInnerDiv" id="" style="margin: 0;">
                        <article style="background-color: rgba(255, 0, 0, 0);">
                           <header class="selectCity" style="background-color: rgba(255, 0, 0, 0);">
                              <i onclick="setCurrentLocationToSearchBox5()" style="color: #e6e6e6;float:  left;margin-left: -1em;font-size: 1.5em;margin-top:  0.2em;" class="fa fa-map-marker" aria-hidden="true"></i>
                              <input class="searchCity" name="city" id="searchCity5" placeholder="Enter a city" type="text" />  
                              <i class="fa fa-times-circle bbu" aria-hidden="true" onclick="clearSearchCity5()"></i>
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
                              	function clearSearchCity5(){
                              		document.getElementById('searchCity5').value = '';
                              		document.getElementById('searchCity5').focus();
                              	}
                              	function setCurrentLocationToSearchBox5(){
                              		//alert("setCurrentLocationToSearchBox()"+getLattitude()+" "+getLongitude());
                              		document.getElementById('searchCity5').value = decodeURIComponent((getCurAdd()).replace(/\+/g, '%20'));
                              		if(document.getElementById("lat5") != null && document.getElementById("lon5") != null){
                        		    	document.getElementById("lat5").value = getLattitude();
                        				document.getElementById("lon5").value = getLongitude();
                        	    	} 
                              	}
                              </script>
                              <input type="hidden" name="lat" id="lat5" value="">
                              <input type="hidden" name="lon" id="lon5" value="">
						  <style>
  							   .searchCity{
	  							    transition: .5s;
								    /*color: #fff !important;*/
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
                        &nbsp;&nbsp;&nbsp; 
                        <article style="background-color: rgba(255, 0, 0, 0);">
                           <header class="selectCity" style="background-color: rgba(255, 0, 0, 0);">
                              <select name="category" id="searchCategories5" required="">                                 
								<!-- <option value="-1">select category</option><option value="atm">atms</option><option value="auto_mobiles">auto mobiles</option><option value="bank">banks</option><option value="bar">bars</option><option value="beauty_parlour">beauty parlours</option><option value="blood_and_eye_bank">blood and eye banks</option><option value="bus_station">bus stations</option><option value="coffee_shop">coffee shops</option><option value="college">colleges</option><option value="computer_institute">computer institutes</option><option value="computer_service">computer services</option><option value="dance_school">dance schools</option><option value="fashion_and_cloth_store">fashion and cloth stores</option><option value="fire_station">fire stations</option><option value="gas_and_petrol_station">gas and petrol stations</option><option value="gift_shop">gift shops</option><option value="govt_office">govt offices</option><option value="grocery_store">grocery stores</option><option value="hardware_shop">hardware shops</option><option value="hospital">hospitals</option><option value="hostel">hostels</option><option value="hotel">hotels</option><option value="insurance_company">insurance companies</option><option value="jewellery_store">jewellery shops</option><option value="library">libraries</option><option value="lodge">lodges</option><option value="mobile_store">mobile shops</option><option value="museum">museums</option><option value="packers_and_movers">packers and movers</option><option value="parcel_and_courier">parcel and couriers</option><option value="park">parks</option><option value="party_hall">party halls</option><option value="pharmacy">pharmacy</option><option value="photo_studio">photo studios</option><option value="play_school">play schools</option><option value="police_station">police stations</option><option value="railway_station">railway stations</option><option value="real_estate_agents">real estate agents</option><option value="restaurent">restaurents</option><option value="school">schools</option><option value="shopping_mall">shopping malls</option><option value="software_company">software companies</option><option value="stadium">stadiums</option><option value="temple">temples</option><option value="cinema">theaters</option><option value="tours_and_travels">tours and travels</option><option value="university">universities</option> -->
			  				  </select>
                           </header>
                        </article>
                     </div>
                     <div class="flex flex-2 searchInnerDiv" id="" style="margin: 0;padding: 0;">
                        <article class="searchBoxInputArticle" style="width: 100% !important; margin-top: 1em !important;">
                           <header>
                              <div>
                              	 <input id="searchContent5" name="searchContent" type="hidden">
                                 <input  autocomplete="off" style="transition: .5s;color: #353434 !important; background-color: rgba(255, 0, 0, 0) !important;border-radius: 2px 0 0 2px !important;border-right: 0px !important; col"  id="searchBoxInput5" class="searchBoxInput" type="text" placeholder="search here" >
                                 <input onclick="getSearchData()" style="width: 78px;background-color: #ff2436;border-radius: 0 2px 2px 0;" class="searchBoxSubmit" type="submit" value="Search"  >
                              </div>
                           </header>
                        </article>
                     </div>
                 <!--  </form> -->
               </div>
            </section>
            </div>
            <div class="flex flex-2 viewList" id="viewList" > </div>
		       <button onclick="viewMoreSearch()" id="viewMoreButton" style="display: none;background-color: #03a9f400;border:  0;font-weight:  bold;margin:  auto;">view more..</button>
            <script>
            var results; var arr;var map;var infoWindow; var service; var out="", count=1; var add; var lat; var lon;var u ;
	            function getSearchData(){
	            	var flag = true;
	            	var slat = document.getElementById("lat5").value;
	            	var slon = document.getElementById("lon5").value;
	            	var sText = document.getElementById("searchBoxInput5");
	            	var scity = document.getElementById("searchCity5");
	            	var scategory = document.getElementById("searchCategories5");
	            	
	            	if (scity.value.length <= 0) {
	            		flag = false;
	                    alert("please Enter City for search.");
	                    scity.focus() ; 
	                }
	            	if (scategory.value == 'all' && sText.value.length <= 2) {
	            		flag = false;	 
	            		scategory.focus(); 
	            		alert("please select category or Type anything..");
	                }
	            	if(flag){
		            	var uri = "", withIn = '50000';
		            	
		            	if(sText.value == "" || sText.value == null){
		                	uri = "rest/get/search/"+scity.value+"/"+getLattitude()+"/"+getLongitude()+"/"+slat+"/"+slon+"/"+withIn+"/"+scategory.value+"/all";
		                 }
		                else{
		                	uri = "rest/get/search/"+scity.value+"/"+getLattitude()+"/"+getLongitude()+"/"+slat+"/"+slon+"/"+withIn+"/"+scategory.value+"/"+sText.value;
		                }
		            	
		            	//alert(uri);
		            	var u = getWebsiteURL();
		            	$.getJSON(u + uri, function(results) {
		             	   callback3(results, google.maps.places.PlacesServiceStatus.OK);
		                 });
	            	}
	            }
            
	            function callback3(results, status) {
	            	console.log("screen.height : "+screen.height);
	            	document.getElementById('viewList').setAttribute("style","height:"+screen.height+"px;overflow: scroll;border: 1px solid #b3b1b1;padding: 10px;");
					lat = getLattitude(); 
	                lon = getLongitude;
	       		this.results = results;  	
	       		console.log("Nb results:" + results.length);
	       	      if (status != google.maps.places.PlacesServiceStatus.OK) {
	       	        alert("callback3:status: "+status);
	       	        return;
	       	      } 
	       	      viewMoreSearch(); 
	            }
	            
	            var kk = 0 ;var temp = 0;var next = 0;
	         	  function viewMoreSearch(){
	         		 var u = getWebsiteURL();
		              for(var i = next; i < results.length; i++) {  
		            		
		            		if(temp < 4){
		            			next++;
		         				$.ajax({
		         					url: u + "rest/get/search/getDetailsByPlaceId/"+results[i]['place_id'],
		         					dataType: "json",
		         					async: false,
		         		          	type: 'GET',
		         		         	success: function(results1){
		         						callback1(results1, results[i]['distance']);
		         		         	}
		         	            });
		         				jQuery.ajaxSetup({async:true});
		         			 }else{
		         				temp = 0;
		         				break;
		         			}  
		         			temp++;
		              }
		              if(next >= results.length){
		             		//document.getElementById("loadingImageLoadMore").style.display = "none";
		              } 
	         	  }
	         	 function callback1(place, distFromSearchLocation) {
	 	   		 	//console.log(kk+": "+JSON.stringify(place.place_id)+" : "+distFromSearchLocation); 	
	    				/*---------------Start--------------------*/
	    				var img_url="", name="", address = "", website = "", phoneNumber = "", rating = "", 
	 	   				 lat="", lon="", distance = "", map = "", adr = "", reviews="", reviewsLink="";
	    				var loc = getCookie("location");
	    				adr = place.formatted_address;
	    				website = place.website;
	    				name = place.name;
	    				phoneNumber = place.international_phone_number;
	    				
	    				lat = getLattitude(); 
	    		        lon = getLongitude();
	    				 
	               distance =  findDistance(lat, lon, place.geometry.location.lat, place.geometry.location.lng);
	               
	               out = out + "<article class='article'><ul style='list-style: none;'>";                                               
	               /* if (img_url.indexOf("cleardot") == -1) {
	                   out = out + "<li><span class=imageSpan><img src='" + img_url + "' width='100%' id=" + count + " onclick=openPreview(" + count + ") style=cursor:pointer;></span></li>";
	               }
	               if (img_url.indexOf("cleardot") != -1) { */
	                   //out = out + "<li><span class=imageSpan><img src='images/noImage.jpg' width=100% id=" + count + " style=cursor:pointer;></span></li>";
	               /* } */ 
	               out = out + "<li><span class=detailsSpan><header><h3><a href=searchview?place_id="+place.place_id+" target="+place.place_id+">";
	               out = out + place.name;
	               out = out + "</a></h3></header><p class=address>Address: ";
	               out = out + adr;
	               out = out + "</p>";
	               out = out + "<footer class=bottom>";

	               if (phoneNumber != "" && phoneNumber != null && phoneNumber.indexOf("null") == -1) {
	                   /* out = out + "<div ><i class='fa fa-phone' aria-hidden='true'></i>&nbsp;" + phoneNumber + "</div>"; */
	                   out = out + "<div ><a href=tel:"+normalizePhno(phoneNumber) + "><i class='fa fa-phone' aria-hidden='true'></i>&nbsp;"+phoneNumber+ "</a></div>";
	               }
	               if (place.rating != "" && place.rating != null) {
	 	               out = out + "<div ><i class='fa fa-star' aria-hidden='true'></i>&nbsp;" + place.rating + "</div>";
	               }
	               if (website != ""  && website != null && website.indexOf("null") == -1) {
	                   out = out + "<div  ><a target=# class=bottom href=" + website + "><i class='fa fa-globe' aria-hidden='true'></i></a></div>";
	               }
	               
	               var ad = addStarsToString(adr);
	               var nm = addStarsToString(name);
	 				/* if(adr != "" ){						    	
	 			    	out = out + "<div  ><a target=# class=bottom href=https://www.google.co.in/maps/place/"+nm+"+"+adr.substr(0, adr.indexOf(' '))+"/@"+place.geometry.location.lat+","+place.geometry.location.lng+"><i class='fa fa-map-marker fa-fw' aria-hidden='true'></i></a></div>";
	 			    } */
	 			    out = out + "<div  ><a target= class=bottom href="+place.url+"><i class='fa fa-map-marker fa-fw' aria-hidden='true'></i></a></div>";
	               if(distance != 'null'  && add != 'null'){
	 					map = "https://www.google.co.in/maps/dir/"+add+"/"+nm+"+"+ad+"/@"+lat+","+lon;	
	 				}else{
	 					map = "https://www.google.co.in/maps/dir/"+loc+"/"+nm+"+"+ad+"/@"+lat+","+lon;
	 				}
	               
	               out = out + "<div  ><a target=# class=bottom href=";
	               out = out + map;
	               out = out + "><i class='fa fa-location-arrow' aria-hidden='true'></i></a></div>";
	              
	               if(typeof place.reviews !== "undefined"){
	             	  var reviews = place.reviews.length;
	             	  if(reviews == '1'){
	 			    		reviews = reviews+ " review";
	 			    	}else{
	 			    		reviews = reviews+ " reviews";
	 			    	}
	             	  
	             		out = out + "<div ><i style='margin:0px;' class='fa fa-pencil' aria-hidden='true'></i>&nbsp;"+reviews+"</div>";
	                } 
	                out = out + '<br>';
	                if(distance != 'null' && distance != ''){
	                		out = out + "<div >from <i style='color: #00ce08;' class='fa fa-map-marker' aria-hidden='true'></i> : <span id='dis'>"+Math.round(distance*100)/100+ "</span>&nbsp;km.(approx.)</div>";
	 			    }
	                if(distFromSearchLocation != 'null' && distFromSearchLocation != ''){
	               		out = out + "<div >from <i style='transform: rotateY(180deg);color: #00ce08;' class='fa fa-search' aria-hidden='true'></i> : <span id='dis'>"+Math.round(distFromSearchLocation*100)/100+ "</span>&nbsp;km.(approx.)</div>";
	 			    }
	 			    	out = out + "</footer><br></li> </ul> </article>";
	    				
	    				/*---------------Finish--------------------*/
	  				kk++;
	    		 
	    			//var dd = document.getElementById("viewList").innerHTML;
	    			//dd = dd+out;
	    			document.getElementById("viewList").innerHTML = out;
	    			//setSelectionWith();
	    		  
	          	document.getElementById("viewMoreButton").style.display = "block";
	           
	    	  }
	         	$(document).ready(function() {
	                var win = $('viewList');
	                win.scroll(function() {
	                    if ($('viewList').height() - 450 <= $(window).scrollTop() + $(window).height()) {
	                 	   //document.getElementById("loadingImageLoadMore").style.display = "block";
	                        
	                         //setTimeout('loadMore()', 200);
	         	           viewMoreSearch(); 
	         	           
	                    }
	                });
	            });
            </script>
      </div>
		<br><br><br><br><br><br> 
   </div>
   </div>
</section>
				<script>
					  function initialize() { 
						    var acInputs = document.getElementsByClassName("searchCity");
						    var autocompleted = new google.maps.places.Autocomplete(acInputs[1]);
						    google.maps.event.addListener(autocompleted, 'place_changed', function () {
					        	var loc = this.getPlace().geometry.location;
					        	document.getElementById("lat5").value = loc.lat();
								document.getElementById("lon5").value = loc.lng();
								 
				        	}); 
					    }
						
						initialize();

			   			setCategoryTypesCreatePlan();
			   			document.getElementById('searchCity5').value = decodeURIComponent((getCurAdd()).replace(/\+/g, '%20'));
			   			if(document.getElementById("lat5") != null && document.getElementById("lon5") != null){
            		    	document.getElementById("lat5").value = getLattitude();
            				document.getElementById("lon5").value = getLongitude();
            	    	} 
				</script> 
<%@include file="footer.jsp" %>