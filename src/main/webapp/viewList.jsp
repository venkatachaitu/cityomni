<%@include file="header.jsp" %>
<script>
var dar = [];	
var lit = 10;
var ct = 0;
var tFlag = false;
   window.onload = loadviewListPage();
   	function loadviewListPage(){
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
	   				console.log("viewList : location is "+loc);
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc;
	   			var category = getUrlVars()["category"];
	   			var add = getCurAdd();
	   			var clattitude = getLattitude();
	   			var clongitude = getLongitude();
	   			
	   			if(clattitude == 'null' || clongitude == 'null'){
	   				clattitude = 'NA';
	   				clongitude = 'NA';
	   			}
	   			
	   			var desc1 = $('meta[name=description]').attr("content");
				var descTab = addSpaces(category)+" in "+loc+ " "+desc1;				
				
	   			$('meta[name=description]').remove();
	            $('head').append( "<meta name='description' content='"+descTab+"'>" );
	            

	   			if(category.toString().trim().toLowerCase() != '' && category.toString().trim().toLowerCase() != 'undefined' && loc.toString().trim().toLowerCase() != '' && loc.toString().trim().toLowerCase() != 'undefined')	{						
	   				var u = getWebsiteURL();
	   				$.getJSON(u+"rest/getDataByCategory/"+loc+"/"+category+"/"+clattitude+"/"+clongitude+"/get", function( data ) {	   				  
	   				  var count=0;
	   				  $.each( data, function( key, val ) {
	   					var out = "";
	   					  if(key != null){
	   						  count++;
	   					   	var img_url="", name="", address = "", website = "", phoneNumber = "", rating = "", 
	   			   				lon = "", lat = "", distance = "", map = "", adr = "", reviews="", reviewsLink="",locationUrl ="";
	   					   	$.each( val, function( key, val ) {							    	
	   							  if(key != 0){
	   								  if(key == 'img_url')
	   									  img_url = val.trim();
	   								  if(key == 'name')
	   									  name = val;
	   								  if(key == 'address'){
	   									   adr = val.trim();
	   									  var temp = val.split(',');
	   									    var oo = '';
	   									  for(var i=0; i< temp.length; i++){
	   										  if(temp[i].length > 1){
	   									 		oo = oo + "<i>";
	   									 		oo = oo + temp[i];
	   									 		 
	   									 		if(i == temp.length-1){
	   									 			oo = oo + ".</i>";
	   									 			break;
	   									 		}
	   								 			oo = oo + ",</i>&nbsp;";
	   										  }
	   									  }
	   									  address = address + oo;
	   								  }
	   									  
	   								 if(key == 'phno' && val != null) phoneNumber = val.trim();
	   								 if(key == 'rating' && val != null) rating = val.trim();
	   								 if(key == 'website' && val != null) website = val.trim();
	   								 if(key == 'latitude'  && val != null) lon = val.trim();
	   								 if(key == 'longitude'  && val != null) lat = val.trim();
	   								 if(key == 'reviews'  && val != null) reviews = val.trim();
	   								 if(key == 'reviewsLink'  && val != null) reviewsLink = val.trim();
	   								 if(key == 'distance'  && val != null) distance = val.trim();   
	   							  }
	   						  });
	   					  //each end
	   					    //distance = findDistance(lat, lon);                                               
	                        out = out + "<article class='article' data-percentage='"+distance+"'><ul><li>";                                              
	   					  	if(img_url.indexOf("cleardot") == -1){
	   					    	out = out + "<span class=imageSpan><img src='"+img_url+ "' width='100%' id="+count+" onclick=openPreview("+count+") style=cursor:pointer;></span>";
	   					  	}
	   					    
	   					  	if(img_url.indexOf("cleardot") != -1){
	   					    	out = out + "<span class=imageSpan><img src='images/noImage.jpg' width=100% id="+count+" style=cursor:pointer;></span>";
	   					  	}
	   					  	
	   					    out = out + "</li><li><span class=detailsSpan><header><label><a href='#'><h3>";
	   					    out = out + name;
	   					    out = out + "</h3></a></label></header><br><p class=address>";
	   					    out = out + address;
	   					    out = out + "</p>";
	   					    out = out + "<footer class=bottom>";
	   					    
	   					    if(phoneNumber != "" && phoneNumber.length > 1 && phoneNumber != null && phoneNumber.indexOf("null") == -1){						    	
	   					    	out = out + "<div ><a href=tel:"+normalizePhno(phoneNumber) + "><i class='fa fa-phone' aria-hidden='true'></i>&nbsp;"+normalizePhno(phoneNumber) + "</a></div>";
	   					    }
	   					    if(rating != "" && rating.length > 1 && rating != null && rating.indexOf("null") == -1){						    	
	   					    	out = out + "<div ><i class='fa fa-star' aria-hidden='true'></i>&nbsp;"+rating.trim()+ "</div>";
	   					    }
	   					    if(website != "" && website.length > 1 && website != null && website.indexOf("null") == -1){						    	
	   					    	out = out + "<div  ><a target=# class=bottom href=http://www."+ website+"><i class='fa fa-globe' aria-hidden='true'></i></a></div>";
	   					    }
	   					    
	   					 	distance = findDistance(getLattitude(), getLongitude(), lat, lon);
	   					 
	   						var ad = addStarsToString(adr.replace(/&amp;/g, '&'));
	   						var nm = addStarsToString(name);
	   						
	   						if(adr != "" ){	
	   							locationUrl = "https://www.google.co.in/maps/place/"+nm+"+"+ad+"/@"+lat+","+lon;
						    	out = out + "<div  ><a target=# class=bottom href="+locationUrl+"><i class='fa fa-map-marker fa-fw' aria-hidden='true'></i></a></div>";
						    }
	   						if(distance != 'null' && add != 'null'){
	   							map = "https://www.google.co.in/maps/dir/"+add+"/"+nm+"+"+ad+"/@"+lat+","+lon;	
	   						}else{
	   							map = "https://www.google.co.in/maps/dir/"+loc+"/"+nm+"+"+ad+"/@"+lat+","+lon;
	   						}						
	   						
	   						out = out + "<div><a style='cursor: alias;' target=# class=bottom href=";
	   					    out = out + map;
	   					    out = out + "><i class='fa fa-location-arrow' aria-hidden='true'></i></a></div>";						    
	   					    
	   					    if(reviews != "" && reviews.length >= 1 && reviews != null && reviews.indexOf("null") == -1){
	   					    	if(reviews == '1'){
	   					    		reviews = reviews+ "review";
	   					    	}else{
	   					    		reviews = reviews+ "reviews";
	   					    	}
	   					    	
	   					 		out = out + "<div ><a target=# class=bottom href="+reviewsLink+"><i style='margin:0px;' class='fa fa-pencil' aria-hidden='true'></i>&nbsp;"+reviews+".</a></div>";
   					    	
   					    	}
							   
							 if(distance != 'null'  && add != 'null'){
	   					    	out = out + "<div ><i class='fa fa-car' aria-hidden='true'></i>&nbsp;<span id='dis'>"+Math.floor(distance)+ "</span>&nbsp;km.(approx.)</div>";
							 } 
	   					    out = out + "</footer><br></li> </ul>";
	   					 	out = out + "<a target="+nm+" href=./view?name="+nm+"&address="+removeAmbers(ad)+"&website="+website+"&img_url="+img_url+"&locationUrl="+locationUrl+"&root="+map+"&distance="+Math.floor(distance)+"&phoneNumber="+normalizePhno(phoneNumber)+"&rating="+rating+"&reviews="+reviews+"&reviewsLink="+reviewsLink;
	   					 	
	   					 	out = out + " class='previewButton'>Preview<a/> </article>";
	   					 	dar.push(out);
	   					  } 
	   				  }); 
	   				  //out = out + "";
						//document.getElementById("viewList").innerHTML = out;
						//sortByDistance();	
						loadMore();
						document.getElementById("titleHeader").innerHTML = addSpaces(category)+" in "+loc;
	   				});	 				
	   			}else{
	   				//alert("INVALID");
	   				window.location.href = getWebsiteURL();
	   			}
	   			//if check for all is end.
   			/* }else{
   				promptForLocation();
   			} */
   		}catch(e){alert(e);
   			//window.location.href = getWebsiteURL();
   		}
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
	function loadMore() {
		//console.log("loadMore()");
		for (var i = ct; i < (ct+lit); i++) {   			 
			$("#viewList").append(dar[i]);
			document.getElementById("loadingImage").style.display = "none";
			//document.getElementById("loadMoreButton").style.display = "none";
		}		
		ct = (ct + lit);
		 
		//console.log(ct);
		/* if(ct >= dar.length){
			document.getElementById("loadMoreButton").style.display = "none";
		} */		
	}
   	function goTo(page){			
   		var loc = document.getElementById("locationHome").innerHTML;
   		var category = getUrlVars()["category"];
   		
   		var ss = window.location.toString().split("?");	
   		var u = getWebsiteURL();
   		window.location.href = u+"viewList?location="+loc+"&category="+category+"&page="+page;			
   	}

    $(document).ready(function() {
        var win = $(window);
        win.scroll(function() {
            if ($(document).height() - 250 <= $(window).scrollTop() + $(window).height()) {
                //$('#loadMoreButton').show();
                 //setTimeout('loadMore()', 200);
	            loadMore();
                //$('#loadMoreButton').hide();
            }
        });
    });
</script>
<!-- Three --><br><br>
<div class="w3-sidebar w3-bar-block w3-dark-grey w3-animate-left" style="display:none; height: 100%;" id="mySidebar">
  <p class="rightNavMenuClose " onclick="openLeftNavClose()">close</p>
  <div id="rightNavMenu" class="rightNavMenu">
  	<img src="images/loading2.gif" alt="loading" style="width: 60px !important;height: 60px !important;margin-top: 45% !important;margin-left: 28%;"/>
  </div>
</div>
<script>
	var flagCheck = true;
	function openLeftNavOpen() {
		var cat1 = getUrlVars()["category"];
		var menuItems = "";
		var loloc = document.getElementById("locationHome").innerHTML;        
        var u = getWebsiteURL();
        if(flagCheck){
        	var arr=["atms","auto_mobiles","banks","bars","beauty_parlours","blood_and_eye_banks","bus_stations","coffee_shops","colleges","computer_institutes","computer_services","dance_schools","fashion_and_cloth_stores","fire_stations","gas_and_petrol_stations","gift_shops","govt_offices","grocery_stores","hardware_shops","hospitals","hostels","hotels","insurance_companies","jewellery_shops","libraries","lodges","mobile_shops","museums","packers_and_movers","parcel_and_couriers","parks","party_halls","pharmacy","photo_studios","play_schools","police_stations","railway_stations","real_estate_agents","restaurents","schools","shopping_malls","software_companies","stadiums","temples","theaters","tours_and_travels","universities"];
	        for(var i=0; i< arr.length; i++){
	        	key = arr[i];
	        	if(cat1 == key){
            		menuItems = menuItems + "<a href=viewList?location="+loloc+"&category="+key+" class='w3-bar-item w3-button' style='font-weight: 600;color: #209cff;'>"+addSpaces(key)+"</a>";
            	}else{	                	
               		menuItems = menuItems + "<a href=viewList?location="+loloc+"&category="+key+" class='w3-bar-item w3-button'>"+addSpaces(key)+"</a>";
            	}
	        }
	        /* $.getJSON(u + "rest/get/getCat/" + loloc.toLowerCase(), function(data) {
	            data = sortObject(data);
	            $.each(data, function(key, val) {
	                if (key != "undefined") { 
	                	if(cat1 == key){
	                		menuItems = menuItems + "<a href=viewList?location="+loloc+"&category="+key+" class='w3-bar-item w3-button' style='font-weight: 600;color: #209cff;'>"+addSpaces(key)+"</a>";
	                	}else{	                	
	                   		menuItems = menuItems + "<a href=viewList?location="+loloc+"&category="+key+" class='w3-bar-item w3-button'>"+addSpaces(key)+"</a>";
	                	}
	                }
	            }); 
	            flagCheck = false;
	            document.getElementById("rightNavMenu").innerHTML = menuItems;
	        }); */
	        document.getElementById("rightNavMenu").innerHTML = menuItems;
		}
	    document.getElementById("mySidebar").style.display = "block";
	}
	function openLeftNavClose() {
	    document.getElementById("mySidebar").style.display = "none";
	}
</script>

<section id="three" class="wrapper align-center">
   <div class="inner">
      <header style="margin: 0;">
         <p onclick="openLeftNavOpen()" id="servicesLink" class="servicesLinkBars"><i class="fa fa-bars" aria-hidden="true"></i></p>
         <h3  class="servicesTitle" id="titleHeader">Services</h3>
         <hr>
      </header>
      <!-- <div class="paging" id="paging1">
         <button  id="next1" value="" onclick="goTo(this.value)">Next&nbsp;<i class="fa fa-step-forward" aria-hidden="true"></i></button>
         <button  id="pag1" ></button>
         <button  id = "pre1" value="" onclick="goTo(this.value)"><i class="fa fa-step-backward" aria-hidden="true"></i>&nbsp;Prev.</button>
      </div> -->
      <br>
      <div class="flex flex-2 viewList" id="viewList">	
         <img id="loadingImage" class="loadingImage" src="images/loading2.gif" alt="loading" />		 
      </div><br> <br>
      
      <!-- <p id="loadMoreButton" class="loadMoreButton" onclick="loadMore()">load more...</p> -->
      <!-- <br><br>
      <div class="paging" id="paging2">					
         <button  id="next" value="" onclick="goTo(this.value)">Next&nbsp;<i class="fa fa-step-forward" aria-hidden="true"></i></button>
         <button  id="pag" ></button>
         <button  id ="pre" value="" onclick="goTo(this.value)"><i class="fa fa-step-backward" aria-hidden="true"></i>&nbsp;Prev.</button>				
      </div> -->
   </div>
</section>
<style>
   .paging button{
   border: 0;
   font-size: 15px;
   font-weight: 700;
   background-color: #ff4f17;
   color: #fff;
   margin: 5px 2px;
   padding: 2px 6px;
   border-radius: 4px;
   text-decoration: none;
   transition: .5s;
   float: right;
   display: none;
   }
   .paging a:HOVER{
   color: #fff;
   background-color: red;
   }
   .address label{
   color: #656565;
   font-size: 14px;
   word-break: break-word;
   word-spacing: 0.1em;
   letter-spacing: 0.00001em;
   text-transform: capitalize;
   font-weight: 200;
   font-family: inherit;
   transition: .5s;
   }
   .detailsSpan header{
   /*min-height: 49px;*/
   }
   .detailsSpan p span{
   margin-right: calc(10% - 38px);
   font-size: 16px;
   color: #ef3a00;
   font-weight: 400;
   transition: .5s;
   }
   .detailsSpan h3{
   color: #ff4f17;
   font-family: inherit;
   font-size: 1.5em;
   font-weight: 700;
   text-transform: capitalize;
   letter-spacing: 1px;
   transition: .5s;
   margin-top: 25px;
   margin-bottom: 10px;
   }
   ul{
   padding: 0;
   margin: 0;
   }
   li{
   display: block;
   padding: 0 !important;
   }
   .detailsSpan{
   /*float: left;*/
   text-align: left;
   margin-top: 1em;
   margin-left: calc(5% - 35px);
   transition: .5s;
   }
   .viewList img{
   width: 193px;
   height: 150px;
   float: left;
   margin: 23px;
   margin-left: calc(10% - 35px);
   transition: .5s;
   border: 1px solid rgb(255, 79, 23);
   border-style: ridge;
   border-radius: 5px;
   overflow: hidden;
   border-width: 8px;
   }
</style>
<style>
   /* The modalImage (background) */
   .modalImage {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 99999999999999999999999999999999; /* Sit on top */
   padding-top: 100px; /* Location of the box */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0,0,0); /* Fallback color */
   background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
   }
   /* modalImage contentImage (image) */
   .modal-contentImage {
   margin: auto;
   display: block;
   width: 80%;
   max-width: 700px;
   }
   /* Caption of modalImage Image */
   #caption {
   margin: auto;
   display: block;
   width: 80%;
   max-width: 700px;
   text-align: center;
   color: #ccc;
   padding: 10px 0;
   height: 150px;
   }
   /* Add Animation */
   .modal-contentImage, #caption {    
   -webkit-animation-name: zoom;
   -webkit-animation-duration: 0.6s;
   animation-name: zoom;
   animation-duration: 0.6s;
   }
   @-webkit-keyframes zoom {
   from {-webkit-transform:scale(0)} 
   to {-webkit-transform:scale(1)}
   }
   @keyframes zoom {
   from {transform:scale(0)} 
   to {transform:scale(1)}
   }
   /* The closeImage Button */
   .closeImage {
   position: absolute;
   top: 15px;
   right: 35px;
   color: #f1f1f1;
   font-size: 40px;
   font-weight: bold;
   transition: 0.3s;
   }
   .closeImage:hover,
   .closeImage:focus {
   color: #bbb;
   text-decoration: none;
   cursor: pointer;
   }
   /* 100% Image Width on Smaller Screens */
   @media only screen and (max-width: 700px){
   .modal-contentImage {
   width: 100%;
   }
   }
</style>
<div id="myModalImage" class="modalImage">
   <span class="closeImage">&times;</span>
   <img class="modal-contentImage" id="img01Image">
   <div id="caption"></div>
</div>
<script>
   function openPreview(imgImage){
   	var modalImage = document.getElementById('myModalImage');
   	var modalImg = document.getElementById("img01Image");
   	modalImage.style.display = "block";	
   	
   	modalImg.src = document.getElementById(imgImage).src;
   }
   
   var spanImage = document.getElementsByClassName("closeImage")[0];
   spanImage.onclick = function() { 
   	var modalImage = document.getElementById("myModalImage");
   	modalImage.style.display = "none";
   };
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
