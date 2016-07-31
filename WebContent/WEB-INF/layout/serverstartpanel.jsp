<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<H1>Server Start Panel</H1>
<%
String servers=(String)request.getAttribute("servers");

String[] serverNames=servers.split("\r\n");

for(String serverName:serverNames){
%>
<div>
<span><a href="navigatemenu.do?page=startserver&serverName=<%= serverName %>">start <%= serverName %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="navigatemenu.do?page=stopserver&serverName=<%= serverName %>">stop <%= serverName %></a></span>
</div>
<%
}
%>