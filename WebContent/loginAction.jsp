<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>한국대 학사정보시스템 로그인</title>
</head>
<body>
<% UserDao userDao = new UserDao();
	int result = userDao.login(user.getUserID(),user.getUserPassword());
	
	
	if(result==1){
		user = userDao.getUser(user.getUserID());
		session.setAttribute("userID", user.getUserID());
		session.setAttribute("userClass", user.getUserClass());
		
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('로그인 성공');");
		pw.println("location.href='main.jsp';");
		pw.println("</script>");
	}else if (result==0){
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('비밀번호가 틀렸습니다.');");
		pw.println("history.back();");
		pw.println("</script>");
		
	}else if (result==-1){
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('존재하지 않는 아이디 입니다.');");
		pw.println("history.back();");
		pw.println("</script>");
		
	}else{ 
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('DB 오류!!');");
		pw.print("history.back();");
		pw.print("</script>");
	}

%>
</body>
</html>