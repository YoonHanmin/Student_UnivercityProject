<%@page import="user.UserDao"%>
<%@page import="user.User"%>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userName"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
 	String userID= null;
	if(session.getAttribute("userID")!=null){
		userID= (String)session.getAttribute("userID");
	}
	if(userID !=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다');");
		script.println("location.href='main.jsp';");
		script.println("</script>");
	}
	
	
	
 	UserDao userDao = new UserDao();
 	String userid = userDao.searchID(user.getUserName());
 	
 	if(userid!=null){ %>
 		<div class="p-5 text-center bg-light" style="margin-top: 20px;">
		<form method="post" action="login.jsp">
			<h3 class="mb-3"style="text-align: center">아이디 찾기</h3>
			<div class="form-group">
				<h2 style="border: 1px solid #eee; text-align:center;">요청하신 ID는 <%=userid %>입니다.</h2>
			</div>
			
			<input type="submit" class="btn btn-primary form-control mb-3" value="로그인하기">
			
		</form>
	</div>
</div>
<% 
 	}else{
 		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 잘못되었습니다');");
		script.println("location.href='main.jsp';");
		script.println("</script>");
 	}
 	%>	
	
	
 
	
</body>
</html>