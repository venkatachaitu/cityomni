<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp" %>
<br><br>  
 <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.8.3.js"></script> -->
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places,visualization&v=3.exp"></script> --> 
<script>

	var dar = [];	
	var lit = 5;
	var ct = 0;
	var city, lat, lon, category, searchContent, withIn;
	var jsonArr = "[";
    window.onload = loadSearchPage();   
    var results; var arr;var map;var infoWindow; var service; var out="", count=1; var add; var lat; var lon;var u ;
    function loadSearchPage(){
    	try{
    		updateGPSLocation();
            var loc = getCookie("location");
            city = getUrlVars()["city"];
             
            //document.getElementById('searchCity').value = decodeURIComponent((city).replace(/\+/g, '%20'));
            //alert(decodeURIComponent((city).replace(/\+/g, '%20')));
            withIn = '50000';//getUrlVars()["withIn"];
            document.getElementById("locationHome").innerHTML = loc;
            if(loc == "" || loc == null){
           	 document.getElementById("locationHome").innerHTML = city;
           	 loc = city;
            }           
            category = getUrlVars()["category"];
            searchContent = getUrlVars()["searchContent"].trim();
            
              
            //alert(decodeURIComponent((searchContent).replace(/\+/g, '%20')));
            add = getCurAdd();  
            lat = getUrlVars()["lat"].trim(); 
            lon = getUrlVars()["lon"].trim();
            document.getElementById("lat").value = lat;
            document.getElementById("lon").value = lon;
             
	        map = new google.maps.Map(""); 
            u = getWebsiteURL();
            var uri = "";
			
			var desc1 = $('meta[name=description]').attr("content");
			var descTab = addSpaces(category)+"s in "+addSpaces(add)+ " "+desc1;
			
            $('meta[name=description]').remove();
            $('head').append( "<meta name='description' content='"+descTab+"'>" );
            
            
            if(searchContent == "" || searchContent == null){
            	uri = "rest/get/search/"+getLattitude()+"/"+getLongitude()+"/"+lat+"/"+lon+"/"+withIn+"/"+category+"/all";
             }
            else{
            	uri = "rest/get/search/"+getLattitude()+"/"+getLongitude()+"/"+lat+"/"+lon+"/"+withIn+"/"+category+"/"+searchContent;
            }
            
            $.getJSON(u + uri, function(results) {
        	   callback3(results, google.maps.places.PlacesServiceStatus.OK);
            });
    	}catch(e){alert("loadContent : "+e);}
    }
       	   	  
     function callback3(results, status) {
    	 lat = getLattitude(); 
         lon = getLongitude();
		this.results = results;  	
		console.log("Nb results:" + results.length);
	      if (status != google.maps.places.PlacesServiceStatus.OK) {
	        alert("callback3:status: "+status);
	        return;
	      } 
	      document.getElementById("titleHeader").innerHTML = this.results.length+" search results in "+category+" category.";
	   	viewMoreSearch(); 
     }
       	          
	  var kk = 0 ;var temp = 0;var next = 0;
   	  function viewMoreSearch(){
        for(var i = next; i < results.length; i++) {  
      		
      		if(temp < 3){
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
       		document.getElementById("loadingImageLoadMore").style.display = "none";
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
              
              out = out + "<article class='article'><ul>";                                               
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
   		  
         	document.getElementById("loadingImageLoadMore").style.display = "block";
          
   	  }
 
   function sorting(json_object, key_to_sort_by) {
	    function sortByKey(a, b) {
	        var x = a[key_to_sort_by];
	        var y = b[key_to_sort_by];
	        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
	    }

	    json_object.sort(sortByKey);
	}
	function formatString(str) {
	    var temp = "";
	    for (var i = 0; i < str.length; i++) {
	    	if (str[i] == '\'')
	    		temp = temp + "45544554";
	    	else if(str[i] == ',')
	    		temp = temp + "78787878";
	    	else	    		
	            temp = temp + str[i]; 
	    }
	    return temp;
	}
	function loadMore() {
		//console.log(jsonArr);
		for (var i = ct; i < (ct+lit); i++) {   			 
			$("#viewList").append(dar[i]);
			document.getElementById("loadingImage").style.display = "none";
			document.getElementById("loadMoreButton").style.display = "block";
		}		
		ct = (ct + lit);
		if(ct >= dar.length){
			document.getElementById("loadMoreButton").style.display = "none";
		}		
	}
	
	function removeDoubleQuotes(str) {
	    var temp = "";
	    for (var i = 0; i < str.length; i++) {
	    	if (str[i] != '"')
	            temp = temp + str[i]; 
	    }
	    return temp;
	}
	function GetSortOrder(prop) {  
   	    return function(a, b) {  
   	        if (a[prop] > b[prop]) {  
   	            return 1;  
   	        } else if (a[prop] < b[prop]) {  
   	            return -1;  
   	        }  
   	        return 0;  
   	    }  
   	}
   function sortByDistance(){	   
	   var $wrapper = $('#viewList');
	   $wrapper.find('.article').sort(function(a, b) {
	       return +a.getAttribute('data-percentage') - +b.getAttribute('data-percentage');
	   })
	   .appendTo($wrapper);
   }
   $(document).ready(function() {
       var win = $(window);
       win.scroll(function() {
           if ($(document).height() - 450 <= $(window).scrollTop() + $(window).height()) {
        	   document.getElementById("loadingImageLoadMore").style.display = "block";
               
                //setTimeout('loadMore()', 200);
	           viewMoreSearch(); 
	           
           }
       });
   });
</script>
 
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
   <!-- <div style="display: none;" id="tempContent"></div> -->
      <header style="margin: 0;">
      	<!-- <p onclick="openLeftNavOpen()" id="servicesLink" class="servicesLinkBars" ><i class="fa fa-bars" aria-hidden="true"></i></p> -->
         <h3  class="servicesTitleInSearchPage" id="titleHeader">Search Result</h3>
           <!-- <p style="float: right;margin-top: -31px;" id="sortByLink" onclick="sortByDistance()">Sort by Distance</p> -->  
         <hr style="margin:  1px !important;">
      </header>
      <div class="flex flex-2 viewList" id="viewList">	
         <img id="loadingImage" class="loadingImage" src="images/loading2.gif" alt="loading" />		 
      </div>
      <p id="loadMoreButton" class="loadMoreButton" onclick="loadMore()">load more...</p>
      <br><br>
      <img id="loadingImageLoadMore" style="display: none;" class="loadingImage" src="images/loading2.gif" alt="loading" />	
      <!-- <button onclick="viewMoreSearch()">view more</button> -->
   </div>
</section>
<style>
	.loadMoreButton{
	    background-color: #fff;
	    border: 0;
	    color: #2196F3;
	    font-weight: 600;
	    cursor: pointer;
	    display: none;
	}
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
		width: 80%;
    	margin: auto !important;
   }
   .detailsSpan p span{
   margin-right: calc(10% - 38px);
   font-size: 16px;
   color: #ef3a00;
   font-weight: 400;
   transition: .5s;
   }
   .detailsSpan h3{
		color: #ff1326;
	    font-size: 1.5em;
	    font-weight: 400;
	    text-transform: capitalize;
   }
   .detailsSpan h3:HOVER{
		color: #03a9f4;
    	font-weight: bold;
   }
   .viewList article {
	    width: 100% !important;
	    border: 1px solid rgba(255, 36, 54, 0.51);
	    border-style: dotted;
	    border-width: 0 0 1px 0;
        box-shadow: none;
		margin-bottom: 4px !important;
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
   .bottom div{
   	cursor: pointer;
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
<br><br>

<!-- <div class="sortSelection">
	with in :<select name="withIn" id="withIn" onchange="changeWithIn()">
		<option value="1000">1 km.</option>
		<option value="10000">10 kms.</option>
		<option value="100000">100 kms.</option>
		<option value="500000">500 kms.</option>
		<option value="1000000">1000 kms.</option>
	</select>
</div> -->

<style>
	.sortSelection{
		    position: fixed;
		    z-index: 9999999999999999999999999999999999999;
		    bottom: 0;
		    margin: auto;
		    margin-left: calc(50% - 100px);
		    background-color: white;
		    color: black;
		    border: 1px solid #212121;
		    padding: 1px 14px;
	}
	.sortSelection select{
		border: 0px;
	}
</style>
<script>
	function changeWithIn(){
		
		var aa = window.location.toString();
		var baa = aa.split('?');
		
		var ur = baa[0]+ "?city="+city+"&lat="+getUrlVars()["lat"].trim()+"&lon="+getUrlVars()["lon"].trim()+"&withIn="+document.getElementById("withIn").value+"&category="+category.trim()+"&searchContent="+searchContent.trim();
		/* var aa = paramReplace(window.location, 'withIn', document.getElementById("withIn").value);
		aa = aa.replace(/(withIn=).*?(&)/,'$1' +  + '$2'); */
		window.location.href = ur;
		//alert(baa[0]);
		 
          
	}
	function setSelectionWith(){
		var e1 = document.getElementById("withIn");
        //alert(e1.options.length);
        for (var ii = 0; ii < e1.options.length; ii++) {
        	//alert(ii+"----"+e1.options.length+"----"+e1.options[ii]);
            var secLoc = e1.options[ii].value;
            if (getUrlVars()["withIn"].trim() == secLoc.trim().toLowerCase()) {
                e1.selectedIndex = ii;
            }
        }
	}
</script>
<%@include file="footer.jsp" %>




