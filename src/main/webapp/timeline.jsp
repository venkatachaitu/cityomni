<%@include file="header.jsp"%>
<br>
<br>
<style>
input {
	color: red !important;
}
</style>
<%
	Cookie cookie3 = null;
	Cookie[] cookies3 = null;
	cookies3 = request.getCookies();
	boolean flag3 = false;
	if (cookies3 != null) {
		for (int i = 0; i < cookies3.length; i++) {
			cookie3 = cookies3[i];
			if ((cookie3.getName()).compareTo("username") == 0) {
				if (cookie3.getValue() != "") {
					flag3 = true;
				}
			}
		}
	}
	if (!flag3)
		response.sendRedirect("/login");
%>
<script>

$(document).ready(function() {
	updatePostsOnTimeline(getCookie("username"));
	$('#expandAddPost').click(
		function() {
			 if($("#userPostButton").css('display')== 'none'){
				$("#userPost").css('display', '');
				$("#userPostButton").css('display', '');
			 }else{
				$("#userPost").css('display', 'none');
				$("#userPostButton").css('display', 'none'); 
			 }
		}
	);
	
	$('#userPostButton').click(
		function() {
			if($("#userPost").val().length < 5){
				alert("minimun 5 characters required...!")
			}else{
				var userName = getCookie("username");
				var userPost = $("#userPost").val();
				var data = JSON.stringify({
					"userName" : userName,
					"userPost" : userPost
				});
				var url = "/user/timeline/addPost";
				$.ajax({
					url : url,
					dataType : 'json',
					type : 'post',
					contentType : 'application/json',
					data : data,
					processData : false,
					success : function(data, textStatus, jQxhr) {
						//alert(textStatus)
						updatePostsOnTimeline(userName);
					},
					error : function(jqXhr, textStatus, errorThrown) {
						alert("commentSubmit() : Error:" + errorThrown);
					}
				});
			}	
	});
	
});

function updatePostsOnTimeline(userName){
	//var data = JSON.parse('[{"postId":"TueMay1218:22:44IST2020venkatachaitu","dateTime":"Tue May 12 18:22:44 IST 2020","userPost":"nvjndsjkvnkjdsvknsdkjvnkd","likeUsers":"pqr,stu,wxy,ppp","userName":"venkatachaitu","privacy":"public"},{"postId":"TueMay1223:00:41IST2020venkatachaitu","dateTime":"Tue May 12 23:00:41 IST 2020","userPost":"jcabsjcnksjnckjndkcnksncsz","likeUsers":null,"userName":"venkatachaitu","privacy":"public"}]');
	var url = "/user/timeline/getPosts?user="+userName;
	$.ajax({
		url : url,
		dataType : 'json',
		type : 'get',
		contentType : 'application/json',
		//data : data,
		processData : false,
		success : function(data, textStatus, jQxhr) {
			$("#pageLoading").css("display", "none");
			var out="";
			$.each(data, function(key, val) {
				var likes = 0; var likeuser = 'Like';
				// code for liked users count
				if(val.likeUsers == null){}else{
					var spl = val.likeUsers.split(',');
					for (var i = 0; i < spl.length; i++) {
						var check = true;
						if(spl[i] != ''){
							likes = likes+1;
							check = false;
						}
						if(spl[i] === userName){
							if(check)
								likes = likes+1;
							likeuser = 'DisLike';
						}
					}
				}
				//code for privacy checkup
				var privacyBox = "";
				if(val.privacy == 'public')
					privacyBox = "<select onchange=(updatePrivacy(this)) id='"+val.postId+"'><option selected>Public</option><option>Private</option></select>";
				else
					privacyBox = "<select onchange=(updatePrivacy(this)) id='"+val.postId+"'><option>Public</option><option selected>Private</option></select>";
				
				 out = out + "<table class='comentbox'><tr><td style=''><input id='"+val.postId+"' value='"+val.postId+"' type='hidden'><span class='areaspan' >"+val.dateTime+"</span><span class='datespan' ><input class='"+val.postId+"' onclick=userLike('"+val.postId+"') type='button' value='"+likeuser+"' style=' all: unset; margin: 0em 1em; color: blue !important; cursor: pointer; '>"+likes+" Likes</span><span class='privacyDropdown' >"+privacyBox+"</span><div class='comenttext' style='' >"+val.userPost.replace(/"/g , " ")+"</div></td></tr></table>";
			
			//$('#'+val.postId+"privacy").html("");
			
			});
			document.getElementById('commentsList').innerHTML = out;
		},
		error : function(jqXhr, textStatus, errorThrown) {
			alert("commentSubmit() : Error:" + errorThrown);
		}
	});
	
	
}
function updatePrivacy(element){
	var url = "/user/timeline/updatePrivacy?postId="+element.id+"&privacy="+element.value+"&userName="+getCookie("username");
	$.ajax({
		url : url,
		dataType : 'json',
		type : 'get',
		contentType : 'application/json',
		processData : false,
		success : function(data, textStatus, jQxhr) {
			console.log("privacy updated");
		},
		error : function(jqXhr, textStatus, errorThrown) {
			alert("commentSubmit() : Error:" + errorThrown);
		}
	});
}


	function userLike(postId){
		var url = "/user/timeline/likeUser?postId="+postId+"&userName="+getCookie("username");
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'get',
			contentType : 'application/json',
			processData : false,
			success : function(data, textStatus, jQxhr) {
				updatePostsOnTimeline(getCookie("username"));
			},
			error : function(jqXhr, textStatus, errorThrown) {
				alert("commentSubmit() : Error:" + errorThrown);
			}
		});
	}
	
</script>
<style>

.privacyDropdown{
    float: right;
    line-height: 1px;
    font-size: 12px;
    margin: -12px;
}
</style>
<section id="three" class="wrapper align-center">

	<div class="inner">
		<%@include file="userHeader.jsp"%>
		<div class="flex flex-2 " id="confessionFlex">
			<header style="margin: 0px; width: 100%;">
				<h3
					style="color: red; font-size: 1.55em; line-height: 2em; text-align: left;">
					Add Your Post Here<font id="expandAddPost"
						style="font-weight: bold; font-size: 1.25em; cursor: pointer;">
						+</font>
				</h3>
				<textarea id="userPost" style="display: none;"
					placeholder="what's on your mind..!" rows="" cols=""
					name="userPost"></textarea>
				<br> <input id="userPostButton"
					style="display: none; float: right;" type="button" value="post">
			</header>

			<h4>Your Posts Here.</h4>

			<div class="flex flex-2 services" id="services">
				<div id="pageLoading"
					style="margin-top: 5em; margin-bottom: 5em; margin: 6em auto;">
					<img style="display:; width: 50px;" src="images/loading2.gif"
						alt="loading" /> <br> <br> <br> <br> <br>
					<br>
					<h5>Please wait... Your Timeline is Loading..</h5>
				</div>
				<div id="commentsList" style="width: 100%;"></div>

			</div>


		</div>

	</div>
</section>
<%@include file="footer.jsp"%>