<%@page import="studentinfo.StudentDao"%>
<%@page import="studentinfo.StudentInfo"%>
<%@page import="status.StatusDao"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	String userID = null;
   	int userClass = 1;
   	int userNum = 0;
  if(session.getAttribute("userID")!=null){
	  userID=(String)session.getAttribute("userID");
  }
	UserDao dao = new UserDao();
   	User user = dao.getUser(userID);
   	userClass = user.getUserClass();
  	userNum = user.getUserNum(); 	
   	
   	
  	
	String type= request.getParameter("absence");
	StatusDao st = new StatusDao();
	int re = st.absenceApply(type, userNum);
	
  %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>