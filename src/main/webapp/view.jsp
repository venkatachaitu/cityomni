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
	   				console.log("services : location is "+loc);
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc; 
	   			
	   			var u = getWebsiteURL();
	   			    				
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
}
.list img {
	width: 38%;
    height: 3%;
    margin: 23px;
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
      </header> --%><br>
      <div class="flex flex-2 list" >
         <article class="article">
		   <ul>
		      <li> <span class="imageSpan"><img src="<%= request.getParameter("img_url") %>" width="100%" id="1" style="cursor:pointer;"></span></li>
		      <li>
		         <span class="detailsSpan">
		            <header>
		               <label>
		                   <a href="#">
		                     <h3><%= request.getParameter("name") %></h3>
		                  </a> 
		               </label>
		            </header>
		            <br> 
		            <p class="address"><i><%= request.getParameter("address") %></i></p>
		            <footer class="bottom">
		            <%
		            	if(!request.getParameter("phoneNumber").equalsIgnoreCase("null")){
		            		%>
		            		<div><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;<%= request.getParameter("phoneNumber") %></div>				            
		            		<%
		            	}
		            System.out.println("rating:"+request.getParameter("rating"));
			            if(!request.getParameter("rating").equalsIgnoreCase("null")){
		            		%>
		            		<div><i class="fa fa-star" aria-hidden="true"></i>&nbsp;<%= request.getParameter("rating") %></div>
		            		<%
		            	}
						if(!request.getParameter("website").equalsIgnoreCase("null")){
		            		%>
		            		<div><a target="#" class="bottom" href="http://<%= request.getParameter("website") %>"><i class="fa fa-globe" aria-hidden="true"></i></a></div>		               
		               		<%
		            	}
		            %>
		            <div><a target="#" class="bottom" href="<%= request.getParameter("locationUrl") %>"><i class="fa fa-map-marker fa-fw" aria-hidden="true"></i></a></div>
		            <div><a target="#" class="bottom" href="<%= request.getParameter("root") %>"><i class="fa fa-location-arrow" aria-hidden="true"></i></a></div>
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

<%@include file="footer.jsp" %>