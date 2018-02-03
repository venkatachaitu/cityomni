<%@include file="header.jsp" %>
<script>
   window.onload = view();
   	function view(){			
   		try{ 
   			updateGPSLocation();
   			//if(isLocationEnable()){   			
	   			var loc = getCookie("location");
	   			var loc11 = getUrlVars()["location"];
	   			if(typeof loc11 !== "undefined"){
		   			if(loc11 != ""){
	       				loc = loc11;
	       			}
	   			}
	   			if(loc == ""){
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc; 
	   			
	   			var u = getWebsiteURL();	   			    		
	   			var desc1 = $('meta[name=description]').attr("content");
				var descTab = addSpaces(getUrlVars()["name"])+" "+addSpaces(getUrlVars()["address"])+" "+desc1;				
				
	   			$('meta[name=description]').remove();
	            $('head').append( "<meta name='description' content='"+descTab+"'>" );
	            
	            
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
		      <li> <span class="imageSpan"><img src="<%= request.getParameter("img_url") %>" width="100%" id="1" style="cursor:pointer;"onclick="openPreview(1)"></span></li>
		      <li>
		         <span class="detailsSpan">
		            <header style="margin-top:  1em;margin-bottom: 1em;">
		               <label>
		                   <a href="#" style="color: #ff2436;">
		                     <h3><%= request.getParameter("name") %></h3>
		                  </a> 
		               </label>
		            </header>
		              
		            <p class="address"><i><%= request.getParameter("address") %></i></p>
		            <footer class="bottom">
		            <%
		            	if(!request.getParameter("phoneNumber").equalsIgnoreCase("null")){
		            		%>
		            		<div><a href="tel:<%= request.getParameter("phoneNumber") %>"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;<%= request.getParameter("phoneNumber") %></a></div>				            
		            		<%
		            	}
		            System.out.println("website:"+request.getParameter("website"));
			            if(!request.getParameter("rating").equalsIgnoreCase("null")){
		            		%>
		            		<div><i class="fa fa-star" aria-hidden="true"></i>&nbsp;<%= request.getParameter("rating") %></div>
		            		<%
		            	}
			             
						if(!request.getParameter("website").equalsIgnoreCase("null") && !request.getParameter("website").isEmpty()){
		            		%>
		            		<div><a target="#" class="bottom" href="http://<%= request.getParameter("website") %>"><i class="fa fa-globe" aria-hidden="true"></i></a></div>		               
		               		<%
		            	}
		            %>
		            <div><a target="#" class="bottom" href="<%= request.getParameter("locationUrl") %>"><i class="fa fa-map-marker fa-fw" aria-hidden="true"></i></a></div>
		            <div><a  style='cursor: alias;' target="#" class="bottom" href="<%= request.getParameter("root") %>"><i class="fa fa-location-arrow" aria-hidden="true"></i></a></div>
		            <%
			            if(!request.getParameter("reviews").equalsIgnoreCase("null")){
		            		%>
		            		<div><a target="#" class="bottom" href="<%= request.getParameter("reviewsLink") %>"><i style="margin:0px;" class="fa fa-pencil" aria-hidden="true"></i><%= request.getParameter("reviews") %></a></div>
		               		<%
		            	}
		            %>
		               <div><i class="fa fa-car" aria-hidden="true"></i>&nbsp;<span id="dis"><%= request.getParameter("distance") %></span>&nbsp;km.(approx.)</div>
		            </footer>
		            <br>
		         </span>
		      </li>
		   </ul> 
	</article>
      </div>
   </div>
</section>
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
<%@include file="footer.jsp" %>
