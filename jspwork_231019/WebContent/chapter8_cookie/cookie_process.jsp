<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
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
	String userID = "admin";
	String userPassword = "admin1234";

	if(request.getParameter("userID").equals(userID)&&request.getParameter("userPassword").equals(userPassword)){
		Cookie cookie = new Cookie(userID,"value");
		cookie.setMaxAge(365*24*60*60); 
		cookie.setPath("/");
		response.addCookie(cookie);
		response.sendRedirect("welcome.jsp?name="+URLEncoder.encode(userID, "utf-8"));
	} else{
		response.sendRedirect("cookie.jsp");
	}
	%>
	
	


</body>
</html>