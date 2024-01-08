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
 String id = request.getParameter("id");
 String password = request.getParameter("pw");
 
 if(id.equals("aaa")&&password.equals("1234")){ 
	response.sendRedirect("response01_sucess.jsp");
	 }else {
	response.sendRedirect("response01_fail.jsp");
	 }	 
 
 
%>




</body>
</html>