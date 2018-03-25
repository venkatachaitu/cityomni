<br><br><br>
<!-- Footer -->
<footer id="footer">
    <div class="inner">
        <h3 style="display: none;" >Get in touch</h3>
        <form  method="post" style="display: none;">
            <div class="field half first">
                <label for="name">Name</label>
                <input name="name" id="name" type="text" placeholder="Name" style="border: 0;color: red;">
            </div>
            <div class="field half">
                <label for="email">Email</label>
                <input name="email" id="email" type="email" placeholder="Email" style="border: 0;color: red;">
            </div>
            <div class="field">
				<label for="message">Message</label>
                <textarea name="message" id="message" rows="6" placeholder="Message" style="border: 0;color: red;"></textarea>
            </div>
            <ul class="actions">
                <li><input value="Send Message" class="button alt" type="submit"></li>
            </ul>
        </form>
        <!-- <br>
        <div>
            <script type="text/javascript" src="https://counter9.freecounter.ovh/private/counter.js?c=xdeclr1tnf326xcdetp7rq5czerxjtxt&down=async" async></script>
            <noscript>
              <a href="https://www.freecounterstat.com" title="hit counter"><img src="https://counter9.freecounter.ovh/private/freecounterstat.php?c=xdeclr1tnf326xcdetp7rq5czerxjtxt" border="0" title="hit counter" alt="hit counter"></a>
             </noscript>
        </div> -->
        <br>
        <div>
            <a target="#" href="https://www.facebook.com/cityhalt.web" class="socialIcon facebookLogo"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>&nbsp;&nbsp;
            <a target="#" href="https://www.instagram.com/cityhalt" class="socialIcon instaLogo"><i class="fa fa-instagram" aria-hidden="true"></i></a>&nbsp;&nbsp;
            <a target="#" href="http://cityhalt.blogspot.in/2017/09/chennai-home-about-us-contact-services.html" class="socialIcon twitterLogo"><i class="fa fa-rss" aria-hidden="true"></i></a>
        </div>
        <br>
        <div class="copyright">
	    © 2018 <a href="./about" style="color: #FFEB3B;">Chaitanya Kambhampati. </a> (admin@cityhalt)&nbsp;&nbsp; &nbsp;&nbsp;
           <a href="mailto:info@cityhalt.com" style="color: #fff;">
				<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;info@cityhalt.com        
      		</a><br><br>
		   <!-- Histats.com  (div with counter) -->
		   <div id="histats_counter"></div>
		<!-- Histats.com  START  (aync)-->
		<script type="text/javascript">var _Hasync= _Hasync|| [];
		_Hasync.push(['Histats.start', '1,4033802,4,236,241,20,00001010']);
		_Hasync.push(['Histats.fasi', '1']);
		_Hasync.push(['Histats.track_hits', '']);
		(function() {
		var hs = document.createElement('script'); hs.type = 'text/javascript'; hs.async = true;
		hs.src = ('//s10.histats.com/js15_as.js');
		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(hs);
		})();</script>
		<noscript><a href="/" target="_blank"><img  src="//sstatic1.histats.com/0.gif?4033802&101" alt="hitcounter" border="0"></a></noscript>
		<!-- Histats.com  END  -->
        </div>
        <div id="locationCheckYellowBottom" class="locationCheckYellowBottom"><i>Location found by your IP</i></div>
    </div>	
</footer>
<i class="fa fa-map-marker fa-fw" aria-hidden="true" id="gpsIcon" onclick="isGPSEnable()"></i>
<a href="#top" id="topArrow" class="arrowTop"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
<script>
    $(window).scroll(function() { // this will work when your window scrolled.
        var height = $(window).scrollTop(); //getting the scrolling height of window
        if (height > 50) {
            $("#topArrow").addClass('displayBlock');
            $("#header").animate({
                scrollTop: 0
            }, "slow");
            try {
                //console.log($("#header a.navPanelToggle").css("display"));
                //console.log($("#header a.navPanelToggle").css("display") == 'inline-block');
                $("#header").addClass('formFix');
                $("#form").addClass('formFix1');
            } catch (e) {
                alert(e);
            }
        } else {
            $("#form").removeClass('formFix1');
            $("#header").removeClass('formFix');
            $("#topArrow").removeClass('displayBlock');
        }
    });
    $("a[href='#top']").click(function() {
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
        return false;
    });
</script>
</body>
</html>
