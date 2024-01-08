<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Calendar ca = Calendar.getInstance(); %> 
	<h1><%=ca.get(Calendar.HOUR) %>시 
	<%=ca.get(Calendar.MINUTE) %>분 
	<%=ca.get(Calendar.SECOND) %>초 </h1>







</body>
</html>