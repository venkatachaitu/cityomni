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
			      <li><span class="imageSpan"><img id="iconSV" src="images/noImage.jpg" ></span></li>
			      <li>
			         <span class="detailsSpan">
			            <header style="margin: 1em 0em 1em 0em;    color: red;">
			               <h3 id="name"></h3>
			            </header>
			            <br>
			            <p class="address" id="address"></p>
			            <footer class="bottom">
			               <div><a id="phnoa" href="#"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;<span id="phno"></span></a></div>
			               <div><i class="fa fa-star" aria-hidden="true"></i>&nbsp;<span id="rating"></span></div>
			               <div><a target="." class="bottom" id="website" href="#"><i class="fa fa-globe" aria-hidden="true"></i></a></div>
			               <div><button style="background: none;border: 0;" id="url" target="#"><i class="fa fa-map-marker fa-fw" aria-hidden="true"></i></button></div>
			               <div><a target="." class="bottom" id="direction"><i class="fa fa-location-arrow" aria-hidden="true"></i></a></div>
			               <div id="reviewsView"><i style="margin:0px;" class="fa fa-pencil" aria-hidden="true"></i>&nbsp;<span id="reviews"></span></div>
			               <br>
			               <div>from <i style="color: #00ce08;" class="fa fa-map-marker" aria-hidden="true"></i> : <span id="dis1">0.5616</span>&nbsp;km.<font style="font-size: .7em;color: #757575">(approx.)</font></div>
			               <div>from <i style="transform: rotateY(180deg);color: #00ce08;" class="fa fa-search" aria-hidden="true"></i> : <span id="dis2">0.5616</span>&nbsp;km.<font style="font-size: .7em;color: #757575">(approx.)</font></div>
			            </footer>
			            <style>
			            @media screen and (max-width: 1680px) {
			            	.bottom div{
			            		font-size: 1.3em;
			            	}
			            }
			            @media screen and (max-width: 980px) {
			            	.bottom div{
			            		font-size: 1.3em;
			            	}
			            }
			            @media screen and (max-width: 730px) {
			            	.bottom div{
			            		font-size: 1.5em;
			            	}
			            }
			            @media screen and (max-width: 480px) {
			            	.bottom div{
			            		font-size: 1.5em;
			            	}
			            }
			            
			            </style>
			            <!-- <footer class="bottom">
			            <h4>reviews</h4><hr>
			             <span id=reviewsdisplay></span>
			            </footer> -->
			            <br>
			         </span>
			      </li>
			   </ul>
			</article>
			<!-- add1 -->		
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- add1 -->
			<ins class="adsbygoogle"
			     style="display:inline-block;width:728px;height:90px"
			     data-ad-client="ca-pub-9571339575910580"
			     data-ad-slot="6333757458"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
			<!-- add1 -->
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
		   	display: none;
		    position: fixed;
		    z-index: 1;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: #000000c9;
		}
		
		/* Modal Content/Box */
		.modalSV-content {
		        margin: 6% auto;
		    width: 90%;
		    height: 76%;
		    padding-top: 0;
		}
		
		/* The Close Button */
		.closeSV {
		        color: #ff4f17;
			    float: right;
			    font-size: 2em;
			    font-weight: bold;
			    margin-bottom: -.1em;
		}
		
		.myIframe{
			width: 100%;
		    overflow: scroll;
    		height: calc(100% - 36px) !important;
		}
</style>
<div id="myModalSV" class="modalSV">

  <!-- Modal content -->
  <div class="modalSV-content">
    <span class="closeSV">&times;</span>
   
    <iframe class="myIframe" id="myIframe" alt="loading..."></iframe>    
 
  </div>
</div>
<script>
	//function viewPopup(){
		//Get the modal
		var modalSV = document.getElementById('myModalSV');
		
		// Get the button that opens the modal
		var locationBtn = document.getElementById("url");
		var directionBtn = document.getElementById("direction");
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("closeSV")[0];
		
		// When the user clicks on the button, open the modal 
		locationBtn.onclick = function() {
		    modalSV.style.display = "block";
		    document.getElementById('myIframe').src = document.getElementById('url').value+"&output=embed";
		}
		/* directionBtn.onclick = function() {
		    modalSV.style.display = "block";
		    document.getElementById('myIframe').src = document.getElementById('direction').value+"?output=embed";
		} */
		
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
