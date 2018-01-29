<%@include file="header.jsp" %>
<script>
   window.onload = loadMetroCities();
   	function loadMetroCities(){			
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
<br><br><br><br>
<section id="three" class="wrapper align-center">
         <div class="inner">
         <header>
	         <h3 class="servicesTitle" id="titleHeader">Metro Cities in India</h3>
	      </header>
            <div class="flex  metrocitiesPageFlex">
			   <article>
				   	<a class="metrocitiesPageCityBlock" href="./services?location=delhi">
				        <div class="image round">
				            <img src="images/delhi.png" alt="Delhi">
				        </div>
				        <header>
				            <h3>1. DELHI- 4.60 Crore</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	delhi, Top 10 Metropolitan Cities in India 2019
							Among all metropolitan cities in India, Delhi stands on top with a population of 4.6 Crore. National Capital Territory of Delhi or Delhi is one of the largest commercial centres of the country with a GDP of more than $160 Billion. Delhi is also a centre of esteemed educational institutions of different domains like engineering, medical, law, commerce, science, etc. IIT Delhi, Delhi Technological University, All India Institute of Medical Sciences (AIIMS), National Law University, St. Stephen's College and Sriram College of Commerce are some of the esteemed educational institutions in Delhi. Dehli is also a preferred holiday destination in India as it has numerous places to see. Akshardham Temple, Red Fort, India Gate, Qutub Minar, Jantar Mantar and Connaught Place are some of the tourist attractions in Delhi.
				        </p>
			        </a>
			        <footer>
			    	    <a href="./services?location=delhi" class="button">view all services</a>
			        </footer>
			    </article>
			    
			   <article>
			   		<a class="metrocitiesPageCityBlock" href="./services?location=mumbai">
				        <div class="image round">
				            <img src="images/mumbai.png" alt="Mumbai">
				        </div>
				        <header>
				            <h3>2. MUMBAI-1.84 Crore</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	mumbai, Top 10 Metropolitan Cities in India 2017
							Popularly known as City of Dreams, Mumbai with a population of 1.84 Crore stand at 2nd in the list of top 10 metropolitan cities in India. Being Financial Capital of India, Mumbai contributes more than 6% of the country's GDP and has a GDP of more than $200 Billion. Mumbai is the headquarter of many public sector companies, government institutions and giant corporations. State Bank of India, Reliance Industries Limited, HPCL, ICICI Bank, Essar Group, Larsen & Toubro and Aditya Birla Group are some of the organizations with their headquarter in Mumbai.
			        	</p>
			        </a>
			        <footer>
						<a href="./services?location=mumbai" class="button">view all services</a>
			        </footer>
			    </article>
			    
			    <article>
			    	<a class="metrocitiesPageCityBlock" href="./services?location=kolkata">
				        <div class="image round">
				            <img src="images/kolkata.png" alt="Kolkata">
				        </div>
				        <header>
				            <h3>3. KOLKATA- 1.41 Crore</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	Kolkata, also known as Cultural Capital of India is among the most developed cities in India and occupied 3rd place in this list. Capital City of West Bengal, Kolkata with a GDP of more than $150 Billion is 3rd largest city in the country in terms of GDP. Kolkata is the largest commercial city of the eastern part of India and a centre of numerous private and public sector companies. Coal India Limited, Britannia Industries, ITC Limited, Birla Corporation and Visa Group are some of the companies in Kolkata.
			        	</p>
			        </a>
			        <footer>
			        	<a href="./services?location=kolkata" class="button">view all services</a>
			        </footer>
			    </article>
			    
			    <article>
			    	<a class="metrocitiesPageCityBlock" href="./services?location=chennai">
				        <div class="image round">
				            <img src="images/chennai.png" alt="chennai">
				        </div>
				        <header>
				            <h3>4. CHENNAI- 86.96 Lakh</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	Chennai, also known as Gateway to South India is the next metropolitan city in this list. Capital City of Tamil Nadu, Chennai has a strong economy with a GDP of more than $60 Billion. Chennai has a diverse economy consisting of different types of industries, which contribute significantly in the economy of the country. Automobile, Information Technology, Textile and Petrochemicals are some of the major industries in Chennai.
			        	</p>
			        </a>
			        <footer>
			        	<a href="./services?location=chennai" class="button">view all services</a>
			        </footer>
			    </article>
			    
			    <article>
			    	<a class="metrocitiesPageCityBlock" href="./services?location=bangalore">
				        <div class="image round">
				            <img src="images/bangalore.png" alt="Bangalore">
				        </div>
				        <header>
				            <h3>5. BANGALORE-84.99 Lakh</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	bangalore, Top 10 Metropolitan Cities in India 2017
							Capital City of Karnataka and IT hub of India, Bangalore has occupied the 5th position in the list of top 10 metropolitan cities in India. Bangalore has a GDP of more than $80 Billion and its a centre of numerous IT companies, Manufacturing Companies and other industries. IT  Industry contributes the major part of the city's economy and its hugeness can be traced from the fact that IT Companies in Bangalore contribute more than 30% of total IT exports of India. Accenture, Oracle, Infosys and Capgemini are some of the IT companies in Bangalore.
			        	</p>
			        </a>
			        <footer>
						<a href="./services?location=bangalore" class="button">view all services</a>
			        </footer>
			    </article>
			    <article>
			    	<a class="metrocitiesPageCityBlock" href="./services?location=hyderabad">
				        <div class="image round">
				            <img src="images/hyderabad.png" alt="Hyderabad">
				        </div>
				        <header>
				            <h3>6. HYDERABAD: 77.49 Lakh</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	Hyderabad with a population of 77.49 Lakh is the next metropolitan city in this list. With a GDP of more than $74 Billion, Hyderabad is the largest contributor in GDP of Telangana. It is known for Pearls and it is also one of the major business centres in the state of Telangana.
			        	</p>
			        </a>
			        <footer>
						<a href="./services?location=hyderabad" class="button">view all services</a>
			        </footer>
			    </article>
			    <article>
				    <a class="metrocitiesPageCityBlock" href="./services?location=ahmedabad">
				        <div class="image round">
				            <img src="images/ahmedabad.png" alt="Ahmedabad">
				        </div>
				        <header>
				            <h3>7. AHMEDABAD-63.52 Lakh</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	7th position of the list is occupied by Ahmedabad, the largest city of Gujarat. Ahmedabad is one of the largest commercial and industrial centres in the western part of the India. It is a port city and has a lot of manufacturing industries in and around the city. It is ranked amongst one of the most polluted cities in the world.
			        	</p>
		        	</a>
			        <footer>
			            <a href="./services?location=ahmedabad" class="button">view all services</a>
			        </footer>
			    </article>
			    <article>
				     <a class="metrocitiesPageCityBlock" href="./services?location=pune">
				        <div class="image round">
				            <img src="images/pune.png" alt="Pune">
				        </div>
				        <header>
				            <h3>8. PUNE-50.49 Lakh</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	pune, Top 10 famous Metropolitan Cities in India 2019
							Cultural Capital of Maharashtra, Pune with a population of 50.49 Lakh is the next metropolitan city in this list. Pune is the second largest city of Maharashtra and an emerging IT hub of India. Pune is also known as the Oxford of the East due to the presence of numerous esteemed educational institutions. College of Engineering Pune, Fergusson College, B.J. Medical College and Symbiosis International University are some of the reputed educational institutions in the city.
			        	</p>
		        	 </a>
			        <footer>
			            <a href="./services?location=pune" class="button">view all services</a>
			        </footer>
			    </article>
			    <article>
				    <a class="metrocitiesPageCityBlock" href="./services?location=surat">
				        <div class="image round">
				            <img src="images/surat.png" alt="Surat">
				        </div>
				        <header>
				            <h3>9. SURAT-44.62 Lakh</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	surat, Best Top 10 Metropolitan Cities in India 2018
							Diamond City of India, Surat stand at 9th in the list of top 10 metropolitan cities in India. With a GDP of more than $40 Billion, Surat stand among cities with the highest GDP in India. located on the banks of the Tapti River, Surat is the largest exporter of diamond in the country with a share of more than 90% in total diamond exports. Apart from diamond exports, Surat is also the Textile City of India and account for more than 12% of the total fabric production in India.
			        	</p>
		        	</a>
			        <footer>
			            <a href="./services?location=surat" class="button">view all services</a>
			        </footer>
			    </article>
			    <article>
				    <a class="metrocitiesPageCityBlock" href="./services?location=jaipur">
				        <div class="image round">
				            <img src="images/jaipur.png" alt="Jaipur">
				        </div>
				        <header>
				            <h3>10. JAIPUR- 30.73 Lakh</h3>
				        </header>
				        <p style="text-align: justify;color: #5f5f5f;">
				        	jaipur, Top 10 Metropolitan Cities in India 2017
							Jaipur has occupied the 10th position in this list and has a population of 30.73 Lakh. Being the capital city of the largest state of India, Rajasthan, Jaipur is also a center of numerous multinational companies. History of Jaipur dates back to the year 1727, when it was founded by Jai Singh II, the King of Amer. Since its foundation to the present, Jaipur has transformed drastically and compete with other metropolitan cities in terms of infrastructure, employment opportunities and connectivity.
			        	</p>
		        	 </a>
			        <footer>
			            <a href="./services?location=jaipur" class="button">view all services</a>
			        </footer>
			    </article>
			</div>
         </div>
      </section>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<ins class="adsbygoogle"
	     style="display:block"
	     data-ad-format="fluid"
	     data-ad-layout-key="-fg+5m+7r-g6+16"
	     data-ad-client="ca-pub-9571339575910580"
	     data-ad-slot="9602038373"></ins>
	<script>
	     (adsbygoogle = window.adsbygoogle || []).push({});
	</script>
	
	
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<script>
	  (adsbygoogle = window.adsbygoogle || []).push({
	    google_ad_client: "ca-pub-9571339575910580",
	    enable_page_level_ads: true
	  });
	</script>

<%@include file="footer.jsp" %>
