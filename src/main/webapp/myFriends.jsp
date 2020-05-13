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
	
	 $('#findFriends').click(
		function() {
		// alert( $('#suggestFriends').val()) 
		 var url = "/user/myFriends/findFriends?value="+$('#suggestFriends').val();
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'get',
			contentType : 'application/json',
			processData : false,
			success : function(data, textStatus, jQxhr) {
				 if(data.length > 0){
					 var users = data.toString().split(',');
					 var out = "";
					 for (var i = 0; i < users.length; i++) {
						 //alert(users[i])
						 out = out + "<span onclick='goToUserProfile(this)' id="+users[i]+" class='uservice'>"+users[i]+"</span><br>";
					}
					 
				 }
				 $('#friendsView').html(out);
			},
			error : function(jqXhr, textStatus, errorThrown) {
				alert("commentSubmit() : Error:" + errorThrown);
			}
		});
	 
		});
});

function goToUserProfile(user){
	//alert(user.innerHTML)
	var out = "<h4>"+user.innerHTML+"</h4><table>"
	var url = "/user/myFriends/viewSearchProfile?userName="+user.innerHTML;
	$.ajax({
		url : url,
		dataType : 'json',
		type : 'get',
		contentType : 'application/json',
		processData : false,
		success : function(data, textStatus, jQxhr) {
			$.each(data, function(key, val) {
				if(val != ''){
					out = out + "<tr><td>"+key+":</td><td>"+val+"</td></tr>"
				}
			});
			 out = out + "</table>";
			 $('#friendsView').html(out);
		},
		error : function(jqXhr, textStatus, errorThrown) {
			alert("commentSubmit() : Error:" + errorThrown);
		}
	});
	
	 
	
}
 </script>
<style>
.uservice {
	color: red;
	font-size: 1.25em;
	cursor: pointer;
	border-bottom: 1px solid #ff9393;
}
</style>
<section id="three" class="wrapper align-center">

	<div class="inner">
		<%@include file="userHeader.jsp"%>
		<div class="flex flex-2 " id="confessionFlex">
			<header style="margin: 0px; width: 100%;">
				<input style="width: 30%;" id="suggestFriends"
					placeholder="search friends Here..!"><input
					id="findFriends" type="submit" value="Go"> <br>
				<br> <span id="friendsView"></span>
			</header>


		</div>

	</div>
</section>
<%@include file="footer.jsp"%>