<%@include file="header.jsp"%>
<%@page import="com.chaitu.model.*"%>
<br>
<br>
<style>
input {
	color: red !important;
}

input[type=checkbox] {
	-webkit-appearance: checkbox;
	opacity: 1;
	float: none;
	display: initial;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		/*var data = JSON
				.parse('{"userName":"venkatachaitu","password":null,"mobileNo":"9908771059","email":"venkatachaitu@gmail.com","gender":"M","dob":"1988-04-05","city":"Vijayawada","country":"India","pin":"521212","registrationDate":"Tue May 12 12:09:19 IST 2020","activeStatus":"visible","privateFields":"email,dob,pin"}');
		setFields(data);*/

		var url = "/user/get/myProfile?userName=" + getCookie("username");
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'get',
			contentType : 'application/json',
			//data:  data,
			processData : false,
			success : function(data) {
				setFields(data);
			},
			error : function(jqXhr, textStatus, errorThrown) {
				alert(url + "commentSubmit() : Error:" + errorThrown);
			}
		});

		$("#editButton").click(
				function() {
					//$('*').css('cursor', 'auto');
					$("#updateStatus").css('display', 'none');
					$('input').removeAttr('readonly');
					$('select').attr('disabled', false);
					
					$('input[name="userName"]').attr(
							'readonly', 'readonly');
					$('input[name="password"]').attr(
							'readonly', 'readonly');
					if ($("#editButton").val() == 'Update') {
						updateProfile();
					}
					$("#editButton").val('Update');
				});
	});
	function setFields(data) {
		$("#pageLoading").css("display", "none");
		$("#confessionFlex").css("opacity", "1");
		$('#welcomeTag').html("Welcome " + data.userName);

		$('input[name="userName"]').val(data.userName);
		$('input[name="password"]').val('**********');
		$('input[name="mobileNo"]').val(data.mobileNo);
		$('input[name="email"]').val(data.email);
		$('input[name="dob"]').val(data.dob);
		$('input[name="city"]').val(data.city);
		$('input[name="country"]').val(data.country);
		$('input[name="pin"]').val(data.pin);
		$('#joinDate').html("Joined on:" + data.registrationDate);
		$('#activeStatus').val(data.activeStatus);

		$('input').attr('readonly', 'readonly');
		$('select').attr('disabled', true);

		$("#editButton").css('cursor', 'pointer');

		if (data.gender == 'M') {
			$('.gender option[value=M]').attr('selected', 'selected');
		} else {
			$('.gender option[value=F]').attr('selected', 'selected');
		}
		var privateFields = data.privateFields;
		var privateFields = privateFields.split(",");
		
		for(var i=0; i<privateFields.length; i++){
			$('.'+privateFields[i]+'Privacy option[value=private]').attr('selected', 'selected');
		}
		
		var activeStatus = data.activeStatus;
		if(activeStatus=='true')
			$('.activeStatus option[value=true]').attr('selected', 'selected');
		else
			$('.activeStatus option[value=false]').attr('selected', 'selected');
		
		$("#editButton").val('Edit');
	}
	function updateProfile() {
		$('#updateStatus').css('display', 'none');
		$("#loadingImageLoadMore").css('display', '');
		var userName = $('input[name="userName"]').val();
		var mobileNo = $('input[name="mobileNo"]').val();
		var email = $('input[name="email"]').val();
		var dob = $('input[name="dob"]').val();
		var city = $('input[name="city"]').val();
		var country = $('input[name="country"]').val();
		var pin = $('input[name="pin"]').val();
		var gender = $('.gender').val();
		
		var mobileNoPrivacy  = $('.mobileNoPrivacy').val();
		var emailPrivacy = $('.emailPrivacy').val();
		var genderPrivacy = $('.genderPrivacy').val();
		var dobPrivacy = $('.dobPrivacy').val();
		var cityPrivacy = $('.cityPrivacy').val();
		var countryPrivacy = $('.countryPrivacy').val();
		var pinPrivacy = $('.pinPrivacy').val();
		
		var privateFields = '';
		if(mobileNoPrivacy == 'private')
			privateFields = privateFields+'mobileNo,';
		if(emailPrivacy == 'private')
			privateFields = privateFields+'email,';
		if(genderPrivacy == 'private')
			privateFields = privateFields+'gender,';
		if(dobPrivacy == 'private')
			privateFields = privateFields+'dob,';
		if(cityPrivacy == 'private')
			privateFields = privateFields+'city,';
		if(countryPrivacy == 'private')
			privateFields = privateFields+'country,';
		if(pinPrivacy == 'private')
			privateFields = privateFields+'pin,';
		
		if(privateFields.endsWith(','))
			privateFields = privateFields.substring(0, privateFields.length-1);

		var activeStatus = $('.activeStatus').val();
		
		var data = JSON.stringify({
			"userName" : userName,
			"mobileNo" : mobileNo,
			"email" : email,
			"gender" : gender,
			"dob" : dob,
			"city" : city,
			"country" : country,
			"pin" : pin ,
			"privateFields":privateFields,
			"activeStatus": activeStatus
		});
		var url = "/user/post/updateProfile";
		$.ajax({
			url : url,
			dataType : 'json',
			type : 'post',
			contentType : 'application/json',
			data : data,
			processData : false,
			success : function(data, textStatus, jQxhr) {
				setFields(data)
				$("#loadingImageLoadMore").css('display', 'none');
				$('#updateStatus').css('display', '');
				$('#updateStatus').html(
						"<h5 style='color:red;'>Successfully Updated.</h5>");
			},
			error : function(jqXhr, textStatus, errorThrown) {
				$("#loadingImageLoadMore").css('display', 'none');
				$('#updateStatus').css('display', '');
				$('#updateStatus').html(
						"<h5 style='color:red;'>Update Failed...!</h5>");
				alert("commentSubmit() : Error:" + errorThrown);
			}
		});

	}
</script>


<section id="three" class="wrapper align-center">

	<div class="inner">
		<%@include file="userHeader.jsp"%>
		<div id="pageLoading" style="margin-top: 5em; margin-bottom: 5em;">
			<img style="display:; width: 50px;" src="images/loading2.gif"
				alt="loading" /> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h5>Please wait....!, Your profile is Loading..</h5>
		</div>
		<div class="flex flex-2 " id="confessionFlex" style="opacity: 0;">
			<header style="margin: auto;">
				<h3 id="welcomeTag"
					style="color: red; font-size: 1.55em; line-height: 2em; text-transform: capitalize;">
					YourProfile</h3>
				<form method="post" action="/updateProfile">
					<p style="color: #000;" id="joinDate"></p>
					<table>
						<tr>
							<td>UserName:</td>
							<td><input type="text" name="userName" readonly="readonly"></td>
							<td></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="password"
								placeholder="************" readonly="readonly"></td>
							<td></td>
						</tr>
						<tr>
							<td>Mobile No:</td>
							<td><input type="text" name="mobileNo"></td>
							<td>
								<select class="mobileNoPrivacy" style="width: 100%; border-radius: 11px;">
									<option value="public">Public</option>
									<option value="private">Private</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Email:</td>
							<td><input type="text" name="email"></td>
							<td>
								<select class="emailPrivacy" style="width: 100%; border-radius: 11px;">
									<option value="public">Public</option>
									<option value="private">Private</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Gender</td>
							<td><select class="gender" name="gender"
								style="width: 100%; border-radius: 11px;">
									<option value="-1" selected>Select</option>
									<option value="M">Male</option>
									<option value="F">Female</option>
							</select></td>
							<td>
								<select class="genderPrivacy" style="width: 100%; border-radius: 11px;">
									<option value="public">Public</option>
									<option value="private">Private</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>DOB:</td>
							<td><input type="date" name="dob"></td>
							<td>
								<select class="dobPrivacy" style="width: 100%; border-radius: 11px;">
									<option value="public">Public</option>
									<option value="private">Private</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>city:</td>
							<td><input type="text" name="city"></td>
							<td>
								<select class="cityPrivacy" style="width: 100%; border-radius: 11px;">
									<option value="public">Public</option>
									<option value="private">Private</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Country:</td>
							<td><input type="text" name="country"></td>
							<td>
								<select class="countryPrivacy" style="width: 100%; border-radius: 11px;">
									<option value="public">Public</option>
									<option value="private">Private</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>PIN:</td>
							<td><input type="text" name="pin"></td>
							<td>
								<select class="pinPrivacy" style="width: 100%; border-radius: 11px;">
									<option value="public">Public</option>
									<option value="private">Private</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Profile</td>
							<td>
								<select name ="activeStatus" class=activeStatus style="width: 100%; border-radius: 11px;">
									<option value="true">Visible</option>
									<option value="false">Hidden</option>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><input id="editButton" type="button" value="Edit"
								class="button"></td><td></td>
						</tr>

					</table>
					<p id="updateStatus"></p>
					<input type="hidden" id="activeStatus">
				</form>
				<img id="loadingImageLoadMore" style="display: none; width: 32px;"
					src="images/loading2.gif" alt="loading" />
			</header>
		</div>

	</div>
</section>
<%@include file="footer.jsp"%>