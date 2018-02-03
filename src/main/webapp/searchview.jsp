<%@include file="header.jsp" %>
<style>
.list article {
    width: 100% !important;
    border: 1px solid rgba(204, 204, 204, 0.46);
    box-shadow: 4px 4px 9px -6px #7d7c7c;
    border-radius: 2px;
    border-style: outset;
    padding-top: 2em;
}
.list img {
	width: 193px;
    height: 150px;
    /* margin-left: calc(10% - 35px); */
    transition: .5s;
    border: 1px solid rgb(255, 79, 23);
    border-style: outset;
    border-radius: 5px;
    overflow: hidden;
    border-width: 4px;
    min-width: 175px;
    /*min-height: 150px;*/
}
.list article ul{
    list-style: none;
}
.list article h3{
    margin: 0px;
}
</style>
<!-- Three --><br><br>
<section id="three" class="wrapper align-center">
   <div class="inner">
      <%-- <header>
         <h3 class="servicesTitle" id="titleHeader"><%= request.getParameter("name") %></h3>
         <hr>
      </header> --%><br><br>
      <div class="flex flex-2 list" >
			<article class="article">
			   <ul>
			      <li><span class="imageSpan"><img src="images/noImage.jpg" width="100%" id="1" style="cursor:pointer;"></span></li>
			      <li>
			         <span class="detailsSpan">
			            <header style="margin: 1em 0em -1em 0em;    color: red;">
			               <h3 id="name"></h3>
			            </header>
			            <br>
			            <p class="address" id="address"></p>
			            <footer class="bottom">
			               <div><a id="phnoa" href="#"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;<span id="phno"></span></a></div>
			               <div><i class="fa fa-star" aria-hidden="true"></i>&nbsp;<span id="rating"></span></div>
			               <div><a target="." class="bottom" id="website" href="#"><i class="fa fa-globe" aria-hidden="true"></i></a></div>
			               <div><a target="." id="url" href="#"><i class="fa fa-map-marker fa-fw" aria-hidden="true"></i></a></div>
			               <div><a target="%" class="bottom" id="direction" href="#"><i class="fa fa-location-arrow" aria-hidden="true"></i></a></div>
			               <div id="reviewsView"><i style="margin:0px;" class="fa fa-pencil" aria-hidden="true"></i>&nbsp;<span id="reviews"></span></div>
			               <br>
			               <div>from <i style="color: #00ce08;" class="fa fa-map-marker" aria-hidden="true"></i> : <span id="dis1">0.5616</span>&nbsp;km.(approx.)</div>
			               <div>from <i style="transform: rotateY(180deg);color: #00ce08;" class="fa fa-search" aria-hidden="true"></i> : <span id="dis2">0.5616</span>&nbsp;km.(approx.)</div>
			            </footer>
			            <!-- <footer class="bottom">
			            <h4>reviews</h4><hr>
			             <span id=reviewsdisplay></span>
			            </footer> -->
			            <br>
			         </span>
			      </li>
			   </ul>
			</article>
      </div>
   </div>
</section>
<script>
	var place_id = '';
   window.onload = searchview();
   	function searchview(){			
   		try{ 
   			updateGPSLocation();   			
	   			var loc = getCookie("location");
	   			var loc11 = getUrlVars()["location"];
	   			place_id =  getUrlVars()["place_id"];
	   			if(typeof loc11 !== "undefined"){
		   			if(loc11 != ""){
	       				loc = loc11;
	       			}
	   			}
	   			if(loc == ""){
	   				setCookieWithOutReload("location", "chennai", 365);
	   			}
	   			viewDetails();
   		}catch(e){alert(e);}			
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
   		/* The Modal (background) */
		.modalSV {
		    display: none; /* Hidden by default */
		    position: fixed; /* Stay in place */
		    z-index: 1; /* Sit on top */
		    left: 0;
		    top: 0;
		    width: 100%; /* Full width */
		    height: 100%; /* Full height */
		    overflow: auto; /* Enable scroll if needed */
		    background-color: rgb(0,0,0); /* Fallback color */
		    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		/* Modal Content/Box */
		.modalSV-content {
		    background-color: #fefefe;
		    margin: 15% auto; /* 15% from the top and centered */
		    padding: 20px;
		    border: 1px solid #888;
		    width: 80%; /* Could be more or less, depending on screen size */
		}
		
		/* The Close Button */
		.closeSV {
		    color: #aaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		}
		
		.closeSV:hover,
		.closeSV:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
</style>
<div id="myModalSV" class="modalSV">

  <!-- Modal content -->
  <div class="modalSV-content">
    <span class="closeSV">&times;</span>
    <div>
    
    <br><br><br><br>
    
    Some text in the Modal..
    
    <br><br><br><br>
    
    </div>
  </div>

</div>
<script>

	//function viewPopup(){
		//Get the modal
		var modalSV = document.getElementById('myModalSV');
		
		// Get the button that opens the modal
		var btn = document.getElementById("reviewsView");
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("closeSV")[0];
		
		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
		    modalSV.style.display = "block";
		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modalSV.style.display = "none";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		    if (event.target == modalSV) {
		        modalSV.style.display = "none";
		    }
		}
	//}
</script>
<%@include file="footer.jsp" %>
