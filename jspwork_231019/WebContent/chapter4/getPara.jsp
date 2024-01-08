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
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
%>
<h2>아이디 는 <%=id %></h2>
<h2>이름은  <%=name %></h2>

</body>
</html>