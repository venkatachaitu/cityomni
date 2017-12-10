<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<style>
			.error {
				color: #ff0000;
				font-style: italic;
				font-weight: bold;
			}
			</style>
	</head>
	<body>
	<%@include file="index1.jsp" %>
	
		<a href="./addUser.html?siteLanguage=en" >English</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="./addUser.html?siteLanguage=fr" >French</a><br><br>
		
	 <%-- <form:errors path="userModel.*"/>  --%> 
		
		<form action="./addUser.html" method="post" >
		
		<table>
			<tr><td><spring:message code="lable.enteruserid"/></td>
				<td><input type="text" name="userid" value=${userModel.userid}  ></td>
				<td><form:errors path="userModel.userid"/></td></tr>
			<tr><td><spring:message code="lable.enterpassword"/></td>
				<td><input type="password" name="password" value=${userModel.password}></td>
				<td><form:errors path="userModel.password"/></td></tr>
			<tr><td><spring:message code="lable.enteremail"/></td>
				<td><input type="text" name="email" value=${userModel.email}></td>
				<td><form:errors path="userModel.email"/></td></tr>
			<tr><td><spring:message code="lable.enterphno"/></td>
				<td><input type="text" name="phno" value=${userModel.phno}></td>
				<td> <form:errors path="userModel.phno"/></td></tr>
			<tr><td><spring:message code="lable.entercity"/></td>
				<td><input type="text" name="city" value=${userModel.city}></td>
				<td> <form:errors path="userModel.city"/></td></tr>
			
			<tr><td></td><td><input type="submit" name="add User." value=<spring:message code="lable.addUserSubmit"/>></td><td></td></tr>
		</table>
 
		</form>
	
	</body>
</html>