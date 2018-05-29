<%@include file="header.jsp" %>

<script>
   window.onload = loadMetrocitiesPage();
   	function loadMetrocitiesPage(){
 		try{  	
 			updateGPSLocation();
 			var loc = getCookie("location");
 			var loc11 = getUrlVars()["location"];
 			if(typeof loc11 !== "undefined"){
  			if(loc11 != "")
  				loc = loc11;
 			}	   			
 			if(loc == ""){
 				console.log("viewList : location is "+loc);
 				setCookieWithOutReload("location", "chennai", 365);
 				loc = getCookie("location");
 			}
 			document.getElementById('locationHome').innerHTML = loc;
 		}catch(e){alert(e);}
	}	   	
</script>
<style>
.metroCityHeader{
	color: red;
	font-weight: bold;
}

</style>
<br><br><br><br><br>
<section id="" style="height: 100%;padding-top: 2em;">
	<div class="inner">
	<header>
		<h3>CityOmni : Top 10 Metro cities in INDIA.</h3><hr>
	</header>
	<article>     
    <br>
    <p><a class="metroCityHeader" href="./services?location=jaipur" target="jaipur">10. JAIPUR- 30.73 Lakh:</a></p>
    <p>
        <br>
    </p>
    <p>jaipur, Top 10 Metropolitan Cities in India 2017</p>
    <p>Jaipur has occupied the 10th position in this list and has a population of 30.73 Lakh. Being the capital city of the largest state of India, Rajasthan, Jaipur is also a center of numerous multinational companies. History of Jaipur dates back to the year 1727, when it was founded by Jai Singh II, the King of Amer. Since its foundation to the present, Jaipur has transformed drastically and compete with other metropolitan cities in terms of infrastructure, employment opportunities and connectivity.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=surat" target="surat">9. SURAT-44.62 Lakh:</a></p>
    <p>
        <br>
    </p>
    <p>surat, Best Top 10 Metropolitan Cities in India 2018</p>
    <p>Diamond City of India, Surat stand at 9th in the list of top 10 metropolitan cities in India. With a GDP of more than $40 Billion, Surat stand among cities with the highest GDP in India. located on the banks of the Tapti River, Surat is the largest exporter of diamond in the country with a share of more than 90% in total diamond exports. Apart from diamond exports, Surat is also the Textile City of India and account for more than 12% of the total fabric production in India.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=pune" target="pune">8. PUNE-50.49 Lakh:</a></p>
    <p>
        <br>
    </p>
    <p>pune, Top 10 famous Metropolitan Cities in India 2019</p>
    <p>Cultural Capital of Maharashtra, Pune with a population of 50.49 Lakh is the next metropolitan city in this list. Pune is the second largest city of Maharashtra and an emerging IT hub of India. Pune is also known as the Oxford of the East due to the presence of numerous esteemed educational institutions. College of Engineering Pune, Fergusson College, B.J. Medical College and Symbiosis International University are some of the reputed educational institutions in the city.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=ahmedabad" target="ahmedabad">7. AHMEDABAD-63.52 Lakh:</a></p>
    <p>
        <br>
    </p>
    <p>ahmedabad</p>
    <p>7th position of the list is occupied by Ahmedabad, the largest city of Gujarat. Ahmedabad is one of the largest commercial and industrial centres in the western part of the India. It is a port city and has a lot of manufacturing industries in and around the city. It is ranked amongst one of the most polluted cities in the world.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=hyderabad" target="hyderabad">6. HYDERABAD: 77.49 Lakh:</a></p>
    <p>
        <br>
    </p>
    <p>hyderabad</p>
    <p>Hyderabad with a population of 77.49 Lakh is the next metropolitan city in this list. With a GDP of more than $74 Billion, Hyderabad is the largest contributor in GDP of Telangana. It is known for Pearls and it is also one of the major business centres in the state of Telangana.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=bangalore" target="bangalore">5. BANGALORE-84.99 Lakh:</a></p>
    <p>
        <br>
    </p>
    <p>bangalore, Top 10 Metropolitan Cities in India 2017</p>
    <p>Capital City of Karnataka and IT hub of India, Bangalore has occupied the 5th position in the list of top 10 metropolitan cities in India. Bangalore has a GDP of more than $80 Billion and its a centre of numerous IT companies, Manufacturing Companies and other industries. IT Industry contributes the major part of the city's economy and its hugeness can be traced from the fact that IT Companies in Bangalore contribute more than 30% of total IT exports of India. Accenture, Oracle, Infosys and Capgemini are some of the IT companies in Bangalore.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=chennai" target="chennai">4. CHENNAI- 86.96 Lakh:</a></p>
    <p>
        <br>
    </p>
    <p>chennai</p>
    <p>Chennai, also known as Gateway to South India is the next metropolitan city in this list. Capital City of Tamil Nadu, Chennai has a strong economy with a GDP of more than $60 Billion. Chennai has a diverse economy consisting of different types of industries, which contribute significantly in the economy of the country. Automobile, Information Technology, Textile and Petrochemicals are some of the major industries in Chennai.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=kolkata" target="kolkata">3. KOLKATA- 1.41 Crore:</a></p>
    <p>
        <br>
    </p>
    <p>kolkata</p>
    <p>Kolkata, also known as Cultural Capital of India is among the most developed cities in India and occupied 3rd place in this list. Capital City of West Bengal, Kolkata with a GDP of more than $150 Billion is 3rd largest city in the country in terms of GDP. Kolkata is the largest commercial city of the eastern part of India and a centre of numerous private and public sector companies. Coal India Limited, Britannia Industries, ITC Limited, Birla Corporation and Visa Group are some of the companies in Kolkata.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=mumbai" target="mumbai">2. MUMBAI-1.84 Crore:</a></p>
    <p>
        <br>
    </p>
    <p>mumbai, Top 10 Metropolitan Cities in India 2017</p>
    <p>Popularly known as City of Dreams, Mumbai with a population of 1.84 Crore stand at 2nd in the list of top 10 metropolitan cities in India. Being Financial Capital of India, Mumbai contributes more than 6% of the country's GDP and has a GDP of more than $200 Billion. Mumbai is the headquarter of many public sector companies, government institutions and giant corporations. State Bank of India, Reliance Industries Limited, HPCL, ICICI Bank, Essar Group, Larsen & Toubro and Aditya Birla Group are some of the organizations with their headquarter in Mumbai.</p>
    <p>
        <br>
    </p>
    <p><a class="metroCityHeader" href="./services?location=delhi" target="delhi">1. DELHI- 4.60 Crore:</a></p>
    <p>
        <br> 
    </p>
    <p>delhi, Top 10 Metropolitan Cities in India 2019</p>
    <p>Among all metropolitan cities in India, Delhi stands on top with a population of 4.6 Crore. National Capital Territory of Delhi or Delhi is one of the largest commercial centres of the country with a GDP of more than $160 Billion. Delhi is also a centre of esteemed educational institutions of different domains like engineering, medical, law, commerce, science, etc. IIT Delhi, Delhi Technological University, All India Institute of Medical Sciences (AIIMS), National Law University, St. Stephen's College and Sriram College of Commerce are some of the esteemed educational institutions in Delhi. Dehli is also a preferred holiday destination in India as it has numerous places to see. Akshardham Temple, Red Fort, India Gate, Qutub Minar, Jantar Mantar and Connaught Place are some of the tourist attractions in Delhi.</p>

</article>
	</div>


</section>

<%@include file="footer.jsp" %>