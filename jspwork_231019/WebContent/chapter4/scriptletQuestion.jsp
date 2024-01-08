<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! 
   Date a = new Date();
%>
<% 
	out. print((a.getMonth()+1)+"월 ");
	out.print(a.getDate()+"일");
%>


</body>
</html>