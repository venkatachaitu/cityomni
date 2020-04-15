<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>
		Excel sheet Reader.
	</title>
</head>
<h2>Import Excel sheet</h2>
<form action="./import" method="post" enctype="multipart/form-data" >
<input type="file" name="filename" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" value="" required="required">
<input type="submit"  value="Submit">
<%if(request.getAttribute("fileName") != null ||( request.getAttribute("error") != null && request.getAttribute("error").toString() != "")){ %>
<h6>FileName: <%= request.getAttribute("fileName") %></h6>
<%}else{
	%>
	<h6>Please select file (.xls, .xlsx)</h6>
	<%
}	
	%>

</form> 
