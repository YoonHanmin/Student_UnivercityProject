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
	System.out.print(request.getParameter("name"));
	
	Cookie[] cookies = request.getCookies();
	for(int i=0;i<cookies.length;i++){
		
		if(cookies[i].getName().equals(request.getParameter("name")))
		{
			cookies[i].setMaxAge(0);
			cookies[i].setPath("/");
			response.addCookie(cookies[i]);
			System.out.print("쿠키제거완료");
		}
	}
	
	response.sendRedirect("cookie.jsp");
	
	%>
</body>
</html>