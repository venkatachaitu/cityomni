<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp" %>
<br><br> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js" type="text/javascript"></script>
<script>
	var dar = [];	
	var lit = 5;
	var ct = 0;
	var jsonArr = "[";
   window.onload = loadSearch();   
   function loadSearch() {
       try { 	
    	   updateGPSLocation();
           var loc = getCookie("location");
           var city = getUrlVars()["city"];
           document.getElementById("locationHome").innerHTML = loc;
           if(loc == "" || loc == null){
          	 document.getElementById("locationHome").innerHTML = city;
          	 loc = city;
           }           
           var category = getUrlVars()["category"];
           var searchContent = getUrlVars()["searchContent"];
           if(searchContent == "" || searchContent == null){
        	   searchContent = "qwertyqwerty";
           }
           var sf = searchContent.split("%2B");
           searchContent = "";
           for(var i = 0; i < sf.length; i++){
        	   var tf = sf[i] + '+';
        	   searchContent = searchContent + tf;
           }
           var add = getCurAdd();
   		var flag = false;
           if (category.toString().trim().toLowerCase() != '' && category.toString().trim().toLowerCase() != 'undefined') {
        	   var u = getWebsiteURL();
        	   $.getJSON(u+"rest/searchPage/" + city + "/" + category + "/" + searchContent, function(data) {
                   var out = "";
                   var count = 0;
                   $.each(data, function(key00, val00) {
                       if (key00 != 0) {
                          $.each(val00, function(key10, val10) {
                                $.each(val10, function(key20, val20) { 
                                  $.each(val20, function(key30, val30) {
                                       $.each(val30, function(key40, val40) {
                                           $.each(val40, function(key0, val0) {
                                        	   //jsonArr = jsonArr + " , ";
                                        	   //var out = "";
                                        	   count++;
                                               //out = out + "<article id='article'><ul><li>";
                                               var img_url="", name="", address = "", website = "", phoneNumber = "", rating = "", 
                      			   				lon = "", lat = "", distance = "", map = "", adr = "", reviews="", reviewsLink="";
                                               $.each(val0, function(key, val) {
                                                   if (key == 'img_url')img_url = val.trim();
                                                   if (key == 'name')name = val;
                                                   if (key == 'address') {
                                                       adr = val.trim();
                                                       var temp = val.split(',');
                                                       var oo = '';
                                                       for (var i = 0; i < temp.length; i++) {
                                                           if (temp[i].length > 1) {
                                                               oo = oo + "<i>";
                                                               oo = oo + temp[i];
                                                               if (i == temp.length - 1) {
                                                                   oo = oo + ".</i>";
                                                                   break;
                                                               }
                                                               oo = oo + ",</i>&nbsp;";
                                                           }
                                                       }
                                                       address = address + oo;
                                                   }
                                                   if (key == 'phno' && val != null) phoneNumber = val.trim();
                                                   if (key == 'rating' && val != null) rating = val.trim();
                                                   if (key == 'website' && val != null) website = val.trim();
                                                   if (key == 'latitude' && val != null) lon = val.trim();
                                                   if (key == 'longitude' && val != null) lat = val.trim();
                                                   if (key == 'reviews' && val != null) reviews = val.trim();
                                                   if (key == 'reviewsLink' && val != null) reviewsLink = val.trim();
   											 });
                                               distance = findDistance(lat, lon);                                               
                                               out = out + "<article class='article' data-percentage='"+distance+"'><ul><li>";                                               
                                               if (img_url.indexOf("cleardot") == -1) {
                                                   out = out + "<span class=imageSpan><img src='" + img_url + "' width='100%' id=" + count + " onclick=openPreview(" + count + ") style=cursor:pointer;></span>";
                                               }
                                               if (img_url.indexOf("cleardot") != -1) {
                                                   out = out + "<span class=imageSpan><img src='images/noImage.jpg' width=100% id=" + count + " style=cursor:pointer;></span>";
                                               }
                                               out = out + "</li><li><span class=detailsSpan><header><h3>";
                                               out = out + name;
                                               out = out + "</h3></header><br><p class=address>";
                                               out = out + address;
                                               out = out + "</p>";
                                               out = out + "<footer class=bottom>";
   
                                               if (phoneNumber != "" && phoneNumber.length > 1 && phoneNumber != null && phoneNumber.indexOf("null") == -1) {
                                                   out = out + "<div ><i class='fa fa-phone' aria-hidden='true'></i>&nbsp;" + normalizePhno(phoneNumber) + "</div>";
                                               }
                                               if (rating != "" && rating.length > 1 && rating != null && rating.indexOf("null") == -1) {
                                                   out = out + "<div ><i class='fa fa-star' aria-hidden='true'></i>&nbsp;" + rating.trim() + "</div>";
                                               }
                                               if (website != "" && website.length > 1 && website != null && website.indexOf("null") == -1) {
                                                   out = out + "<div  ><a target=# class=bottom href=http://www." + website + "><i class='fa fa-globe' aria-hidden='true'></i></a></div>";
                                               }
                                               
                                               var ad = addStarsToString(adr);
                                               var nm = addStarsToString(name);
                          						if(adr != "" ){						    	
	                       					    	out = out + "<div  ><a target=# class=bottom href=https://www.google.co.in/maps/place/"+nm+"+"+ad+"/@"+lat+","+lon+"><i class='fa fa-map-marker fa-fw' aria-hidden='true'></i></a></div>";
	                       					    }
                                               if(distance != 'null'  && add != 'null'){
                          							map = "https://www.google.co.in/maps/dir/"+add+"/"+nm+"+"+ad+"/@"+lat+","+lon;	
                          						}else{
                          							map = "https://www.google.co.in/maps/dir/"+loc+"/"+nm+"+"+ad+"/@"+lat+","+lon;
                          						}
                                               
                                               out = out + "<div  ><a target=# class=bottom href=";
                                               out = out + map;
                                               out = out + "><i class='fa fa-location-arrow' aria-hidden='true'></i></a></div>";
   
                                               if (reviews != "" && reviews.length > 1 && reviews != null && reviews.indexOf("null") == -1) {
                                                   if (reviews == '1') {
                                                       out = out + "<div  ><a style='color: #ef3a00;text-decoration: none;' target=# class=bottom href=" + reviewsLink + "><i style='margin:0px;' class='fa fa-pencil' aria-hidden='true'></i>&nbsp;" + reviews + "&nbsp;review.</a></div>";
                                                   }
                                                   out = out + "<div ><a target=# class=bottom href=" + reviewsLink + "><i style='margin:0px;' class='fa fa-pencil' aria-hidden='true'></i>&nbsp;" + reviews + "&nbsp;reviews.</a></div>";
                                               }
                                                if(distance != 'null' && add != 'null'){
	                                               	out = out + "<div ><i class='fa fa-car' aria-hidden='true'></i>&nbsp;<span id='dis'>"+Math.floor(distance)+ "</span>&nbsp;km.(approx.)</div>";
                          					    }
	                          					    out = out + "</footer><br></li> </ul> </article>";
	                          					  	//console.log(out);
	                          					    dar.push(out);
	                          					    //out = formatString(out);
	                          					    //jsonArr = jsonArr + "{distance : "+ distance +", value : "+out+"},";
                                           });
                                           //jsonArr = jsonArr + "]";
                                           
                                       });
                                   });
                                  //console.log(out+"---"+val20.length+"----"+(val20.length == 0)+"----"+(val20.length == '0'));
                              	  if(val20.length == 0){
                              		 out = "<label style='margin: auto;'>0 search results</label>";
                              	  }
                                  
                               }); 
                           });
                       }
                   });    
                   document.getElementById("viewDetails").innerHTML = out;
                   //$("#viewDetails").append(out);
                  sortByDistance();
                   //sorting(jsonArr, 'distance');                  
                   //loadMore();
               });
           } else {
               //alert("INVALID");
               window.location.href = getWebsiteURL();
           }
       } catch (e) {
           //alert(e);
           window.location.href = getWebsiteURL();
       }
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
		console.log(jsonArr);
		for (var i = ct; i < (ct+lit); i++) {   			 
			$("#viewDetails").append(dar[i]);
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
   
   function sortByDistance(){	   
	   var $wrapper = $('#viewDetails');
	   $wrapper.find('.article').sort(function(a, b) {
	       return +a.getAttribute('data-percentage') - +b.getAttribute('data-percentage');
	   })
	   .appendTo($wrapper);
   }
</script>
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
	        $.getJSON(u + "rest/get/getCat/" + loloc.toLowerCase(), function(data) {
	            data = sortObject(data);
	            $.each(data, function(key, val) {
	                if (key != "undefined") { 
	                	if(cat1 == key){
	                		menuItems = menuItems + "<a href=viewDetails?location="+loloc+"&category="+key+" class='w3-bar-item w3-button' style='font-weight: 600;color: #209cff;'>"+addSpaces(key)+"</a>";
	                	}else{	                	
	                   		menuItems = menuItems + "<a href=viewDetails?location="+loloc+"&category="+key+" class='w3-bar-item w3-button'>"+addSpaces(key)+"</a>";
	                	}
	                }
	            }); 
	            flagCheck = false;
	            document.getElementById("rightNavMenu").innerHTML = menuItems;
	        });
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
      	<p onclick="openLeftNavOpen()" id="viewAllServicesLink" class="viewAllServicesLinkBars" ><i class="fa fa-bars" aria-hidden="true"></i></p>
         <h3  class="viewAllServicesTitle" id="titleHeader">Search Result</h3>
           <!-- <p style="float: right;margin-top: -31px;" id="sortByLink" onclick="sortByDistance()">Sort by Distance</p> -->  
         <hr>
      </header>
      <div class="flex flex-2 viewDetails" id="viewDetails">	
         <img id="loadingImage" class="loadingImage" src="images/loading2.gif" alt="loading" />		 
      </div>
      <p id="loadMoreButton" class="loadMoreButton" onclick="loadMore()">load more...</p>
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
   .viewDetails img{
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
<br><br>
<%@include file="footer.jsp" %>



<!--                    var dataObj = data[Object.keys(data)[0]];
                   var cityObj = dataObj[Object.keys(dataObj)[0]];
                   
                   console.log("key : "+Object.keys(cityObj)[0]);
                   
                   var catObj = cityObj[Object.keys(cityObj)[0]];
                   
                   for (var i = 0; i < catObj.length; i++) {                	   
	               	    var cobj = catObj[i];
	               		
	               	    console.log(Object.keys(cobj)[0]+" : ");
	               		
	               	 	var cc = cobj[Object.keys(cobj)[0]];
	               	 	
	               	    //console.log(Object.keys(cc)[0]+"--oo--"+cc.length);
	               	   
	               	 	 for(var j=0; j < cc.length; j++){

							var dd = cc[Object.keys(cc)[j]];
	               	 		 
	               	 		console.log(Object.keys(dd)[j]+" : "+dd[Object.keys(dd)[j]]);
	               	 		
	               			
	               	   }  
	               	   
	               	} -->