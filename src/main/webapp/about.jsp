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
	   				console.log("about Page : location is "+loc);
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
				<h3>About & Contact us !</h3><hr>
			</header>
			 
			  <div class="flex flex-2">	
			  	<img class="aboutPhoto" alt="photo" src="images/chaitanya.png" width="311px" height="311px"><br>
			  	<div style="margin: auto;">
				    <h3 style="color: red;text-align:center;font-weight: bold;">
				    	<a href="./about">Chaitanya Kambhampati   </a>
					</h3>  
					<h5 style="text-align:  center;">
				    	Lead Engineer in HCL Technologies, Chennai.
					</h5>
					<h5 style="text-align:  center;">
				    	Home: Vijayawada, Andhrapradesh, India.  
					</h5> 
					<hr>
					<div style=" text-align:  center;">
						&nbsp;&nbsp;&nbsp;<a target="facebook" href="https://www.facebook.com/chaitanya.kambhampati.999">
						<i style="font-size: 1.5em;color: #4d5db5;font-weight: bold;" class="fa-facebook-square" aria-hidden="true"></i>
						</a>
						&nbsp;&nbsp;&nbsp;
						<a target="instagram" href="https://www.instagram.com/chaitanya.kambhampati/">
						<i style="font-size: 1.5em;color: #ef7878;font-weight: bold;" class="fa-instagram" aria-hidden="true"></i>
						</a>
						&nbsp;&nbsp;&nbsp;
						<a target="twitter" href="https://twitter.com/venkatachaitu">
						<i style="font-size: 1.5em;color: #03A9F4;font-weight: bold;" class="fa-twitter-square" aria-hidden="true"></i>
						</a>
						<br> &nbsp;&nbsp;&nbsp;
						<i><a style="font-size: 1.15em;color: #646564;font-weight: bold;" href="tel:9908771059">
						<i style="font-size: 1.5em;color: #179617;font-weight: bold;" class="fa-whatsapp" aria-hidden="true"></i>
						9908771059</a></i>
						<h5 style="font-weight: 600;font-style:  italic;">
							<a href="mailto:info@cityomni.com?Subject=Customer%20Email" style="">
								<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;info@cityomni.com        
							</a>
						</h5>
					</div>
					
				</div><br>
				<div>
					<h3 style="color:  red;font-weight: 400;">Why cityOmni ?</h3>
					<ul style="width:  80%;margin:  auto;color: #444444;">
						<li>If you are new to the City, CityOmni helps you to navigate to your Destination..</li>
						<li>While you are in a Journey, Our CityOmni helps you to find all nearest places to take Halt at particular place like Lodging, Restaurants, atm's, Transport, Malls and Temples....</li>
						<li>You can navigate your Friends and Family to reach the Destination by using our CityOmni.</li>
						<li>If you are planing to a Trip with your Family or friends, You can make easy and Comfortable by using our cityOmni to search HALTS and the Spots to visit in Advance.. </li>
						<li>cityOmni shows the distance from your current location and from the City Position.</li>
					
						<li>cityOmni MAKES YOUR TRIP PLAN EFFORTLESS. </li>
					</ul>
					<br>
					
					<h5 style="text-align: center;">
						Please write us to your Valuable feedback and Sugestions : 
						<a href="mailto:info@cityomni.com?Subject=Customer%20Email" style="">
							<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;info@cityomni.com        
						</a>
					</h5>
				</div>	
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
