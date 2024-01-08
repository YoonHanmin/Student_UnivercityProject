<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="boardmodel.Dto"  %> 
  <%@page import="boardmodel.Dao"  %> 
  <%@page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Dto dto = new Dto();
	dto.setId(id);
	dto.setName(name);
	dto.setTitle(title);
	dto.setContent(content);
	
	Dao dao = new Dao();
	dao.insert();
	
	response.sendRedirect("index.jsp");

	
	

%>



</body>
</html>