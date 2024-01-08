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
	String admin = "admin";
	String adminPW = "1234";

	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	if(userID.equals(admin)&&userID.equals(admin)){
		session.setAttribute("userID", userID);
	response.sendRedirect("welcome.jsp");
	}else{
	response.sendRedirect("session.jsp");
		
	}
	
%>
</body>
</html>