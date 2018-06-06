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
        <br>
        <div>
            <a target="#" href="https://www.facebook.com/cityomni.website" class="socialIcon facebookLogo"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>&nbsp;&nbsp;
            <a target="#" href="https://www.instagram.com/cityomni" class="socialIcon instaLogo"><i class="fa fa-instagram" aria-hidden="true"></i></a>&nbsp;&nbsp;
            <a target="#" href="http://cityomni.blogspot.in/2017/09/chennai-home-about-us-contact-services.html" class="socialIcon twitterLogo"><i class="fa fa-rss" aria-hidden="true"></i></a>
        </div>
        <br>
        <div class="copyright">
	    © 2018 <a href="./about" style="color: #FFEB3B;">Chaitanya Kambhampati. </a> (admin@cityomni)&nbsp;&nbsp; &nbsp;&nbsp;
           <a href="mailto:cityomni@gmail.com" style="color: #fff;">
			<i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;cityomni@gmail.com        
      		</a>
		<br>		
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
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-120222630-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-120222630-1');
</script>


<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-120222630-1', 'auto');
  ga('require', 'GTM-M9NFXR2');
  ga('send', 'pageview');
</script>



<!--<a id="yourLinkID" href="javascript: openwindow()"></a>
<script language="JavaScript1.2">
	function openwindow(){
		//window.open("https://go.pub2srv.com/afu.php?zoneid=1610085","mywindow","menubar=1,resizable=1,width=350,height=250");		
	}
</script>-->
</body>
</html>
