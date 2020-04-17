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
         		 <i class="fa fa-times-circle bbu" aria-hidden="true" onclick="clearSearchCity()"></i>
         		 	<style>
	                 	.bbu{
	          		        	float: right;
							    margin: -1.15em 0em 0em 0em;
							    font-size: 1.4em;
							    color: #ff4b4b;
							    /* background: #ffffffe0; */
							    width: 1em;
							    height: 1em;
							    position: relative;
							    cursor: pointer;
	                   	}
					                    
                    </style>
                    <script>
                    	function clearSearchCity(){
                    		document.getElementById('searchCityConf').value = '';
                    		document.getElementById('searchCityConf').focus();
                    		readConfessionByArea('all');
                    	}
		          	</script>
			<hr>
			<h6>Cities/areas add by users</h6>
			<hr>
			<ul style="list-style: none;" id="areasList"></ul>
         </div>
         
		<div class="centerSide">
				<h3  class="confessionTitle" id="titleHeader">Confessions: <span id="comentloc">all</span></h3>
				<span class="addButton" id="addButton" onclick="viewCommentBox()">+</span>
	         <hr>
	         <textarea rows="9" cols="44" id="commentBox" class="commentBox" style="display: none;"></textarea><br>
	         <span class="addSubmitButton" id="addSubmitButton" onclick="commentSubmit()">add comment</span><br>
	         <span style="color:red;" id="addSubmitResponse"></span>
	          
	         <div id="commentsList"></div>
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
					  function initialize() {
						  loadAllComments();
						    var acInputs = document.getElementsByClassName("searchCity");
						    for (var i = 0; i < acInputs.length; i++) {
						        var autocompleted = new google.maps.places.Autocomplete(acInputs[i]);
						        //autocompleted.inputId = acInputs[i].id;
						        google.maps.event.addListener(autocompleted, 'place_changed', function () {
						        	document.getElementById("comentloc").innerHTML = this.getPlace().vicinity;
						        	readConfessionByArea(this.getPlace().vicinity);
						        	});
						        }
						    }
						
						initialize();
				</script> 
<%@include file="footer.jsp" %>