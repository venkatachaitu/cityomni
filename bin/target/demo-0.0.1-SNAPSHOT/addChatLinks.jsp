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
		
		<form action="./addChatLink.html" method="post" >
		
		<table>
			<tr><td>chatid</td>
				<td><input type="text" name="clid" ></td></tr>
			<tr><td>user1</td>
				<td><input type="text" name="user1" ></td></tr>
			<tr><td>user2</td>
				<td><input type="text" name="user2" ></td></tr>
			
			<tr><td></td><td><input type="submit" name="add Chatlink" ></td><td></td></tr>
		</table>
 
		</form>
	
	</body>
</html>