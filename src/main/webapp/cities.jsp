<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Three --><br><br>
<section id="three" class="wrapper align-center">
   <div class="inner">
	   
			<!-- ====CHITIKA===== -->
			<script type="text/javascript">
			  ( function() {
			    if (window.CHITIKA === undefined) { window.CHITIKA = { 'units' : [] }; };
			    var unit = {"calltype":"async[2]","publisher":"itsmytirupati","width":300,"height":250,"sid":"Chitika Default"};
			    var placement_id = window.CHITIKA.units.length;
			    window.CHITIKA.units.push(unit);
			    document.write('<div id="chitikaAdBlock-' + placement_id + '"></div>');
			}());
			</script>
			<script type="text/javascript" src="//cdn.chitika.net/getads.js" async></script>
			<!-- ====CHITIKA===== -->
	   <!-- ====ADGEBRA 728x90===== -->
		<div id="div_1220180628123854">
			<script>
				var domain = (window.location != window.parent.location)? document.referrer : document.location.href;
				if(domain==""){domain = (window.location != window.parent.location) ? window.parent.location: document.location.href;}
				var scpt=document.createElement("script");
				var GetAttribute = "afpftpPixel_"+(Math.floor((Math.random() * 500) + 1))+"_"+Date.now() ;
				scpt.src="//adgebra.co.in/afpf/GetAfpftpJs?parentAttribute="+GetAttribute;
				scpt.id=GetAttribute;
				scpt.setAttribute("data-pubid","2496");
				scpt.setAttribute("data-slotId","1");
				scpt.setAttribute("data-templateId","66");
				scpt.setAttribute("data-accessMode","1");
				scpt.setAttribute("data-domain",domain);
				scpt.setAttribute("data-divId","div_1220180628123854");
				document.getElementById("div_1220180628123854").appendChild(scpt);
			</script>
		</div>
		<!-- ====ADGEBRA 728x90===== -->
		
      <header>
         <h3 class="servicesTitle" id="titleHeader">Services</h3>
         <hr>
      </header>
      <div class="flex flex-2 services" id="services">
         <img class="loadingImage" src="images/loading2.gif" alt="loading" />
      </div>
   </div>
	
</section>
<script>
   window.onload = loadcitiesPage();
   	function loadcitiesPage(){			
   		try{ 
   				updateGPSLocation()
	   			var state = getUrlVars()["state"];
	   			var u = getWebsiteURL();
	   			$.getJSON(u+"rest/get/latlon/"+state+"/cities", function( data ) {
	   			 	var out = "";			
				  	console.log(data[1]);
	   				for (var i = 0; i < data.length; i++) { 	   				    
	   				  out = out + "<article><header>";
					  out = out + "<a target='' href=";
					  out = out + u+"services?city="+removeSpaces(data[i].toString());
					  //out = out + "&lat="+data[i]['lat'].toString()+"&lon="+data[i]['lon'].toString();
					  out = out + "><h4><span class='viewAllServiceIcons icon fa fa-thumb-tack'></span>";
					  out = out + data[i];								 
					  out = out + "</h4></a></header></article>"
	   				}
					document.getElementById("services").innerHTML = out;	
					document.getElementById("titleHeader").innerHTML = "Cities in "+addSpaces(state); 
					  
					});
   		}catch(e){alert(e);}			
   	}
</script>
<%@include file="footer.jsp" %>
