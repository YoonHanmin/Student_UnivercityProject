<%@page import="user.User"%>
<%@page import="user.UserDao"%>
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
  	String userID = null;
   	int userClass = 1;
   	int userNum = 0;
  if(session.getAttribute("userID")!=null){
	  userID=(String)session.getAttribute("userID");
  }
   	UserDao dao = new UserDao();
   	User user = dao.getUser(userID);
  	userNum = user.getUserNum(); 	
	String pw = request.getParameter("pw");
	int re = dao.changePW(userNum, user.getUserPassword(), pw);
if(re==1){
		
		%>
		
	<script>
		alert('비밀번호 변경이 완료 되었습니다. 다시 로그인하세요.');
		location.href='logout.jsp';
		</script>
		<%
	}else{
		
		out.print("<script>");
		out.print("alert('비밀번호 변경에 실패 하였습니다.');");
		out.print("history.back();");	
		out.print("</script>");
		
	}
	


  %>
</body>
</html>