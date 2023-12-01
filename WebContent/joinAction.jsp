<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userClass"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	UserDao userDao = new UserDao();
 	int result = userDao.join(user);
 	
 	if(result==-1){
 		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('회원가입 실패');");
		pw.println("location.href='main.jsp';");
		pw.println("</script>");
 	}else {
 		session.setAttribute("userID",user.getUserID());
 		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('회원가입 성공');");
		pw.println("location.href='main.jsp';");
		pw.println("</script>");
 	}

%>


</body>
</html>