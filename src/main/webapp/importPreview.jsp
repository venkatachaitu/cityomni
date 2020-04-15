<%@include file="header.jsp" %>
<br><br><br><br><br>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="excelImport.jsp" %>
<hr><br>
<%@page import="java.util.*, com.chaitu.model.*"%>
<style>
body{
font-family: sans-serif;
}
table {
  border-collapse: collapse;
  border-color: blue;
}
td{
font-size: 12px;

   
}
th{
font-size: 12px;
}
table, td, th {
  border: 1px solid #827e7e;
  padding: 2px;
}
.table2header {
	background-color: #dfdfdf;
}
</style>
<%
	
if(request.getAttribute("error") != null && request.getAttribute("error").toString() != ""){
	System.out.println("---error-----");
	%>
	
		<h6 style="color: red;"><%= request.getAttribute("error").toString() %></h6>
	<%
	
}else{

%>
<table >
	<tr>
		<th>Program</th>
		<th>ECOM FOB</th>
	</tr>
	<tr>
		<th class="table2header" colspan="2">Sprint - 20.05</th>
	</tr>
	<tr>
		<td>Start date -4/1/2020</td>
		<td>End Date - 4/14/2020</td>
	</tr>
	<tr>
		<td>Current status</td>
		<td style="background-color: #65df65; text-align: right;">Green</td>
	</tr>
	<tr>
		<th class="table2header" colspan="2">Sprint workload</th>
	</tr>
	<tr>
		<td>Open</td>
		<td align="right"><%=(int) request.getAttribute("open")%></td>
	</tr>
	<tr>
		<td>In Dev</td>
		<td align="right"><%=(int) request.getAttribute("inDev")%></td>
	</tr>
	<tr>
		<td>QA</td>
		<td align="right"><%=(int) request.getAttribute("qa")%></td>
	</tr>
	<tr>
		<td>Merge request /</br> Ready to showcase
		</td>
		<td align="right"><%=(int) request.getAttribute("mr")%></td>
	</tr>
	<tr>
		<th class="table2header" colspan="2">Sprint Metrics</th>
	</tr>
	<tr>
		<td>Average Velocity</td>
		<td align="right">5 points per person</td>
	</tr>
	<tr>
		<td>Stories committed</td>
		<td align="right">10</td>
	</tr>
	<tr>
		<td>Available capacity</td>
		<td align="right"><%=(int) request.getAttribute("totalPoints")%></td>
	</tr>
	<tr>
		<td>% of commitment</td>
		<td align="right">100</td>
	</tr>
</table>
<br>
<table >
	<tr>
		<th style="background-color: #adcddc;" colspan="4">StoryDetails</th>
	</tr>
	<tr>
		<th class="table2header">Issue key</th>
		<th class="table2header">Assignee</th>
		<th class="table2header">Points</th>
		<th class="table2header">Status</th>
	</tr>
	<%
		try {

			List<ReportData2> cells = (List<ReportData2>) request.getAttribute("cells");

			Iterator itr = cells.iterator();
			while (itr.hasNext()) {
				ReportData2 rep = (ReportData2) itr.next();
	%>

	<tr>
		<td><%=rep.getIssueKey()%></td>
		<td><%= rep.getAssgnee() %></td>
		<td  align="right"><% if(rep.getPoints()>0) out.println(rep.getPoints()); %></td>
		<td  align="right"><%= rep.getStatus() %></td>
		
	</tr>


	<%
		
	}
	 	
}catch(Exception e){
	System.out.println(e);
}

%>
</table>
<br>
<table>
<tr><th colspan="3" style="background-color: #adcddc;">Sprint Details (Active)</th></tr>
<tr><th class="table2header">Sprint</th><th class="table2header">Start Date</th><th class="table2header">End Date</th></tr>
<%
	try {
		int open = (int) request.getAttribute("open");
		int inDev = (int) request.getAttribute("inDev");
		int qa = (int) request.getAttribute("qa");
		int mr = (int) request.getAttribute("mr");
		int totalPoints = (int) request.getAttribute("totalPoints");
		
		Map<String, SprintData> map1 = (Map<String, SprintData>)request.getAttribute("sprintDetails");
		TreeMap<String, SprintData> map = new TreeMap<>(); 
		map.putAll(map1); 
		for (Map.Entry<String, SprintData> entry : map.entrySet()) {
			String sprintName = entry.getKey().toString();
			String startDate =entry.getValue().getStartDate().toString();
			String endDate = entry.getValue().getEndDate().toString();
			%>
				<tr><td><%= sprintName %></td>
				<td><%= startDate %></td>
				<td><%= endDate %></td></tr>
			<%
		}
		
		 
		
	} catch (Exception e) {
		System.out.println(e);
	}
%>
</table>
<%
}
%>


<br><br><br><br> 
<%@include file="footer.jsp" %>
