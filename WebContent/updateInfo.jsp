<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@page import="studentinfo.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="studentinfo.StudentInfo" id="std"></jsp:useBean>
<jsp:setProperty property="tel" name="std"/>
<jsp:setProperty property="address" name="std"/>
<jsp:setProperty property="email" name="std"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String userID = null;
	int userNum = 0;
if(session.getAttribute("userID")!=null){
  userID=(String)session.getAttribute("userID");

	UserDao dao = new UserDao();
	User user = dao.getUser(userID);
	
	userNum = user.getUserNum(); 
	std.setUserNum(userNum);
}



	StudentDao dao= new StudentDao();
 	int re = dao.updateInfo(std);
 	System.out.println(re);
 	if(re==1){
 		out.println("<script>");
		out.println("alert('수정되었습니다.');");
		out.println("location.href='studentinfo.jsp';");
		out.println("</script>");
 	}else{
 		out.println("<script>");
		out.println("alert('수정에 실패했습니다..');");
		out.println("history.back()';");
		out.println("</script>");
 		
 	}

%>
</body>
</html>