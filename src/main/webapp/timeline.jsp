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
var pageData = [];
$(document).ready(function() {
	updatePostsOnTimeline(getCookie("username"), false, null);
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
					"userPost" : userPost,
					"dateTime" : new Date().toString()
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
						$("#userPost").css('display', 'none');
						$("#userPostButton").css('display', 'none'); 
						updatePostsOnTimeline(userName, true, data);
					},
					error : function(jqXhr, textStatus, errorThrown) {
						alert("commentSubmit() : Error:" + errorThrown);
					}
				});
			}	
	});
	
});
 
function updatePostsOnTimeline(userName, update, data){
	//var data = JSON.parse('[{"postId":"TueMay1218:22:44IST2020venkatachaitu","dateTime":"Tue May 12 18:22:44 IST 2020","userPost":"nvjndsjkvnkjdsvknsdkjvnkd","likeUsers":"pqr,stu,wxy,ppp","userName":"venkatachaitu","privacy":"public"},{"postId":"TueMay1223:00:41IST2020venkatachaitu","dateTime":"Tue May 12 23:00:41 IST 2020","userPost":"jcabsjcnksjnckjndkcnksncsz","likeUsers":null,"userName":"venkatachaitu","privacy":"public"}]');
	if(update){
		//insert latest post at top
		var temp = [];
		temp.push(data);
		for(var i in pageData)
			temp.push(pageData [i]);
		//updating main array with updated order
		pageData=temp;
		prepareTimelinePosts(pageData , userName);
	}else{
		var url = "/user/timeline/getPosts?user="+userName;
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'get',
			contentType : 'application/json',
			//data : data,
			processData : false,
			success : function(data, textStatus, jQxhr) {
				for(var i in data)
					pageData.push(data [i]);
				prepareTimelinePosts(pageData, userName);
			},
			error : function(jqXhr, textStatus, errorThrown) {
				alert("commentSubmit() : Error:" + errorThrown);
			}
		});
	}	
}
function addZero(i) {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}
function prepareTimelinePosts(data, userName){
		try{
			$("#pageLoading").css("display", "none");
		if(data == ''){
			document.getElementById('commentsList').innerHTML = "<h5>Your Timeline is Empty...!</h5>";
		}else{
			var out="";
				$.each(data, function(key, val) {
					var d = new Date(val.dateTime);
					var timeFormat = d.getDate()+"-"+(d.getMonth()+1)+"-"+d.getFullYear()+" "+d.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true})
					
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
					if(val.privacy == 'Public' || val.privacy == 'public')
						privacyBox = "<select onchange=(updatePrivacy(this)) id='"+val.postId+"'><option selected>Public</option><option>Private</option></select>&nbsp;&nbsp;&nbsp;&nbsp;";
					else
						privacyBox = "<select onchange=(updatePrivacy(this)) id='"+val.postId+"'><option>Public</option><option selected>Private</option></select>&nbsp;&nbsp;&nbsp;&nbsp;";
					
					 out = out + "<table class='comentbox'><tr><td style=''><span onclick=deletePost(this) id='"+val.postId+"' style=' float: right; font-weight: bold; color: red; cursor: pointer; font-size: 1.25em; margin: -5px 0em 1em 1em; '>X</span><input id='"+val.postId+"' value='"+val.postId+"' type='hidden'>";
					 out = out + "<span class='areaspan' >"+timeFormat+"</span><span class='datespan' style='float: left;margin-left: 3em; '>";
					 out = out + "<input id='"+val.postId+"likeButton' onclick=userLike(this,'"+val.postId+"') type='button' value='"+likeuser+"' style=' all: unset;padding-right: 1em; color: blue !important; cursor: pointer; '><span id='"+val.postId+"likesCount'>"+likes+"</span> Likes</span>";
					 out = out + "<span class='privacyDropdown' >"+privacyBox+"</span><div class='comenttext' style='padding: 1em 4em;' >"+val.userPost.replace(/"/g , " ")+"</div></td></tr></table>";
				
				});
			document.getElementById('commentsList').innerHTML = out;
		}
	}catch(e){alert(e)};
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
	function userLike(element, postId){
		var ids = postId.trim()+'likesCount';
		var likesCount = document.getElementById(ids).innerHTML;
		if(element.value == 'Like'){
			$(element).val('Dislike')
			likesCount++;
		}else{
			$(element).val('Like')
			if(likesCount != '0'){
				likesCount--;
			}
		}
		document.getElementById(ids).innerHTML = likesCount
		var url = "/user/timeline/likeUser?postId="+postId+"&userName="+getCookie("username");
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'get',
			contentType : 'application/json',
			processData : false,
			success : function(data, textStatus, jQxhr) {
				console.log("post like updated.");
				//updatePostsOnTimeline(getCookie("username"));
			},
			error : function(jqXhr, textStatus, errorThrown) {
				alert("commentSubmit() : Error:" + errorThrown);
			}
		});
	}
	
	function deletePost(element){
		var temp = [];
		for(var i in pageData){
			if(pageData[i].postId.toLowerCase() != element.id.trim().toLowerCase())
			  temp.push(pageData [i]);
		}
		pageData=temp;
		prepareTimelinePosts(pageData , element.userName);
		
		var url = "/user/timeline/deletePost?postId="+element.id;
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'get',
			contentType : 'application/json',
			processData : false,
			success : function(data, textStatus, jQxhr) {
				console.log("post deleted.");
				//updatePostsOnTimeline(getCookie("username"));
			},
			error : function(jqXhr, textStatus, errorThrown) {
				alert("commentSubmit() : Error:" + errorThrown);
			}
		});
	}
	
</script>
<style>
.privacyDropdown {
	float: right;
	line-height: 1px;
	font-size: 12px;
	margin: -12px;
}
#userPostButton{
	    all: unset;
    margin: 5px 0px 9px 0px;
    padding: 0px 34px;
    float: right;
    background-color: #3F51B5;
    color: #fff !important;
    line-height: 28px;
    border-radius: 4px;
    font-weight: 400;
}
</style>
<section id="three" class="wrapper align-center">

	<div class="inner">
		<%@include file="userHeader.jsp"%>
		<div class="flex flex-2 " id="confessionFlex">
			<header style="margin: 0px; width: 100%;">
				<h3
					style="color: red;font-size: 1.25em;text-align: left;margin: 0;line-height: 1px;">
					<font id="expandAddPost" style="font-size: 12px;cursor: pointer;line-height: 0px;color: #131313;">Add post </font>
				</h3>
				<textarea id="userPost" style="display: none;margin-top: 1em;border-radius: 0;"	placeholder="what's on your mind..!" rows="" cols=""
					name="userPost"></textarea>
				  <input id="userPostButton"
					style="display: none; float: right;" type="button" value="post">
			</header>

			<!-- <h4 style=" margin-top: 0px; ">Your Posts.</h4> -->

			<div style=" margin-top: 14px; " class="flex flex-2 services" id="services">
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