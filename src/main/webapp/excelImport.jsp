<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>Import Excel sheet</h2><br>
<form action="./import" method="post" enctype="multipart/form-data" >
<input type="file" name="filename" value="" required="required">
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





<!-- cells.forEach(e -> System.out.println(e));

			Long open = cells.stream().filter(e -> e.status.equalsIgnoreCase("open")).map(e -> e.status)
					.collect(Collectors.counting());
			Long inDev = cells.stream().filter(
					e -> e.status.equalsIgnoreCase("Ready For Dev") || e.status.equalsIgnoreCase("In Development"))
					.map(e -> e.status).collect(Collectors.counting());
			Long qa = cells.stream()
					.filter(e -> e.status.equalsIgnoreCase("In Test") || e.status.equalsIgnoreCase("Ready to Test"))
					.map(e -> e.status).collect(Collectors.counting());
			Long mr = cells.stream().filter(e -> e.status.equalsIgnoreCase("Ready for Release")).map(e -> e.status)
					.collect(Collectors.counting());

			int count = cells.stream().mapToInt(e -> e.getPoints()).sum();

			System.out.println("open : " + open);
			System.out.println("inDev : " + inDev);
			System.out.println("qa : " + qa);
			System.out.println("mr : " + mr);
			System.out.println("counts : " + count); -->