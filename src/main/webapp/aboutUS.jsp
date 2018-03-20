<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp" %>
<br><br><br><br><br>
<section id="" style="height: 100%;padding-top: 2em;">
		<script>
		   window.onload = loadAboutPage();
		   	function loadAboutPage(){
		   		//readJson();
		   		updateGPSLocation();
		   		var loc = getCookie("location");
	   			var loc11 = getUrlVars()["location"];
	   			if(typeof loc11 !== "undefined"){
		   			if(loc11 != ""){
	       				loc = loc11;
	       			}
	   			}
	   			if(loc == ""){
	   				console.log("aboutUs : location is "+loc);
	   				setCookieWithOutReload("location", "chennai", 365);
	   				loc = getCookie("location");
	   			}
	   			document.getElementById('locationHome').innerHTML = loc;
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
		   	/* function readJson(){
		   		$.ajax({
		   	       url: '/data/cities.json',
		   	       dataType: 'json',
		   	       success: function(data) {
		   	          $.each(data, function(key, val) {
						//console.log(key, val);
						$.each(val, function(key1, val1) {
							console.log(val1.state)
			   	          });
		   	          });
		   	       },
		   	      statusCode: {
		   	         404: function() {
		   	           alert('There was a problem with the server.  Try again soon!');
		   	         }
		   	       }
		   	    });
		   	} */
		</script>
		<div class="inner">
			<header>
				<h3>About / Contact us !</h3><hr>
			</header>
			 <div class="flex flex-2">		 
			 	<h2>CityHALT</h2>
			 	<h3>
					<a href="mailto:info@cityhalt.com?Subject=Customer%20Email" style="">
						<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;info@cityhalt.com        
					</a>
				</h3>
			 </div>
			  <div class="flex flex-2">	
			    <h3 style="margin: auto;color: red;">
			        Welcome to CITYHALT: one place for complete city information and services
			        <!-- &nbsp;<i class="fa fa-exclamation-triangle" aria-hidden="true" style="color: #ffe11b;font-size: 2em;"></i> -->
			    </h3>  	
			</div>
		</div>
	</section>
<style>
	.links{
	    text-decoration: none;
	    cursor: pointer;
	    text-align: center;
	    font-weight: 600;
	    margin: 0px 13px;
	    color: #37474F;
	}
	.links:HOVER{
		color: #FF5722;
	}
	fieldset{
		width: 760px;
	    margin: auto;
	    border: 1px solid #4f606d;
	    background-color: rgba(158, 158, 158, 0.02);
	    border-radius: 0px 105px 0px 0px;
	}
	legend{    
		color: #ffffff;
	    margin-left: 38px;
	    font-size: 20px;
	    font-family: inherit;
	    font-weight: 600;
	    position: absolute;
	    margin-top: -40px;
	    background-color: #4f606d;
	    padding: 4px 37px;
	    border-radius: 0px 24px 0px 0px;
	}
	
	.profileImage{
	    width: 150px;
	    height: 150px;
	    border-radius: 147px;
	    border: 2px solid #818483;
	    margin-left: 191px;
	    box-shadow: 0 0 8px rgba(129, 132, 131, 0.8);
	}
	.subContent1{
	    text-align: center;
	    color: #616161;
	    font-size: 15px;
	    font-family: inherit;
	}
	.subContent2{
	    text-align: center;
	    color: #616161;
	    font-size: 15px;
	    font-family: inherit;
	}
</style>
<br><br><br><br> 
<%@include file="footer.jsp" %>
