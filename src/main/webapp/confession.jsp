<%@include file="header.jsp" %>
<script>
   window.onload = loadConfessionPage();
   	function loadConfessionPage(){
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
      
      <div class="flex flex-2 " id="confessionFlex">	
         <div class="leftSide">
         	<h5>Search your city/area</h5>         
         		<input class="searchCity" name="city" id="searchCityConf" placeholder="Enter a city" type="text" />  
			<hr>
			<h6>Cities/areas add by users</h6>
			<hr>
			<ul>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>
				<li>Agiripalli</li>			
			
			</ul>
         </div>
		<div class="centerSide">
				<h3  class="confessionTitle" id="titleHeader">Confessions:</h3>
				<span class="addButton" id="addButton" onclick="viewCommentBox()">+</span>
	         <hr>
	         <textarea rows="9" cols="44" id="commentBox" class="commentBox" style="display: none;"></textarea><br>
	         <span class="addSubmitButton" id="addSubmitButton" onclick="commentSubmit()">add comment</span><br>
	         

	         <hr>
		</div>
		<!-- <div class="rightSide">
				right
		</div> --> 
      </div>
	
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   </div>
</section>
				<script> 
						function commentSubmit(){
							var content = document.getElementById("commentBox").value;
							alert(content);
							/* $.getJSON(u + "rest/get/getCat/" + strUser.toLowerCase(), function(data) {
								
							} */
						}
					  function initialize() {
						    var acInputs = document.getElementsByClassName("searchCity");
						    for (var i = 0; i < acInputs.length; i++) {
						        var autocompleted = new google.maps.places.Autocomplete(acInputs[i]);
						        //autocompleted.inputId = acInputs[i].id;
						        google.maps.event.addListener(autocompleted, 'place_changed', function () {
						        	document.getElementById("titleHeader").innerHTML = "Confessions : "+this.getPlace().vicinity;
						        	//alert(this.getPlace().vicinity); 
						        	});
						        }
						    }
						
						initialize();					   
				</script> 
<%@include file="footer.jsp" %>