<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<title>
		Excel sheet Reader.
	</title>
</head>
<style>
 
input[type="file"] {
font-size: 16px;
    border-radius: 9px;
    border: 1px solid #868686;
    padding: 4px;
}
 
</style>
<h2>Import Excel sheet</h2>
<form action="./import" method="post" enctype="multipart/form-data" >
<input type="file" name="filename" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" required="required">
<input type="submit" value="Upload" style="background-color: #2196F3;color: white;border: 1px solid #2196f3;padding: 9px 16px;border-radius: 9px;cursor: pointer;font-size: 14px;">
<%if(request.getAttribute("fileName") != null ||( request.getAttribute("error") != null && request.getAttribute("error").toString() != "")){ %>
<h6>FileName: <%= request.getAttribute("fileName") %></h6>
<%}else{
	%>
	<h6>Please select file (.xls, .xlsx)</h6>
	<%
}	
	%>

</form> 
