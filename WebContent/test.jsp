<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String userID = null;
if(session.getAttribute("userID")!=null){
	userID = (String)session.getAttribute("userID");
}
	
	
	%>
</body>
</html>