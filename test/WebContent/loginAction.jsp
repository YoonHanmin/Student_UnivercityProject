<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트문을 작성하기 위해 사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 모든 데이터를 UTF-8로 받음 -->
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- scope => 현재의 페이지에서만 빈즈 사용 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDao userDAO = new UserDao();
	int result = userDAO.login(user.getUserID(),user.getUserPassword()); 
	if(result ==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	} else if (result ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(비밀번호가 틀립니다.)");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert(존재하지않는 ID입니다.)");
		script.println("history.back()");
		script.println("</script>");
	}
	


%>




</body>
</html>