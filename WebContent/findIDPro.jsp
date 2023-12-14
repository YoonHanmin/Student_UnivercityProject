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

	int num =Integer.parseInt(request.getParameter("userNum"));
	String name = request.getParameter("userName");
	UserDao dao = new UserDao();
	String id = dao.findID(name,num);
	
	if(id!=null){
		%>
		<script>
			alert("아이디는 : <%= id %> 입니다");
			location.href="login.jsp";
		</script>
		
		<% }else {
			%> 
		<script>
			alert("존재하지 않는 이름 또는 학번입니다.");
			location.href="login.jsp";
		</script>
			
			
			<% 
		}
%>



</body>
</html>