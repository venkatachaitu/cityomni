<%@include file="header.jsp"%>
<br>
<br>
<style>
input {
	color: red !important;
}
</style>
<%
	Cookie cookie1 = null;
	Cookie[] cookies1 = null;
	cookies1 = request.getCookies();
	boolean flag2 = false;
	if (cookies != null) {
		for (int i = 0; i < cookies1.length; i++) {
			cookie1 = cookies1[i];
			if((cookie1.getName( )).compareTo("username") == 0){
				if(cookie1.getValue() != ""){
					flag2 = true;
				}
			}
		}
	}
	if(flag)
		response.sendRedirect("/timeline");

%>

<section id="three" class="wrapper align-center">

	<div class="inner">

		<div class="flex flex-2 " id="confessionFlex">
			<header style="margin: 0px;">
				<h3 style="color: red; font-size: 1.55em; line-height: 2em;">LOGIN</h3>
				<form method="post" action="/login">
					<table>
						<tr>
							<td>UserName</td>
							<td><input type="text" name="userName"></td>
							<td>Password</td>
							<td><input type="password" name="password"></td>
							<td><input type="submit" value="Login" class="button"></td>
						</tr>
					</table>
				</form>
				${loginStatus} ${userLogin}
			</header>
		</div>
		<div class="flex flex-2 " id="confessionFlex">
			<header style="margin: 0px;">
				<h3 style="color: red; font-size: 1.55em; line-height: 2em;">Register</h3>
				<form method="post" action="/register">
					<table>
						<tr>
							<td>UserName:</td>
							<td><input type="text" name="userName"></td>
							<td>Password:</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td>Mobile No:</td>
							<td><input type="text" name="mobileNo"></td>
							<td>Email:</td>
							<td><input type="text" name="email"></td>
						</tr>
						<tr>
							<td>Gender</td>
							<td><select name="gender"
								style="width: 100%; border-radius: 11px;">
									<option value="M">Male</option>
									<option value="F">Female</option>
							</select></td>
							<td>DOB:</td>
							<td><input type="date" name="dob"></td>
						</tr>
						<tr>
							<td>city:</td>
							<td><input type="text" name="city"></td>
							<td>Country:</td>
							<td><input type="text" name="country"></td>
						</tr>
						<tr>
							<td>PIN:</td>
							<td><input type="text" name="pin"></td>
							<td></td>
							<td><input type="submit" value="Register" class="button"></td>
						</tr>

					</table>
				</form>
				${registerstatus}
			</header>
		</div>

	</div>
</section>
<%@include file="footer.jsp"%>