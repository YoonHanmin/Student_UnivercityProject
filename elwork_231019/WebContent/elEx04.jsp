<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name","홍길동");

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP 표현</h3>
	<%= request.getAttribute("name") %>
	<hr>
	
	<h3>[표현 언어와 내장 객체와 접근자]</h3>
	<h4>닷 연산자로 접근</h4>
<!-- 	requestScope : request 객체에 <속성,값>이 매핑되어 저장된 객체 -->
	${requestScope.name}
	<h4>브라켓 연산자로 접근</h4>
	${requestScope["name"]}
	${requestScope['name']}
	
<!-- 	파라미터로 넘어온 값을 param객체에 속성-값형식인 Map 객체로 저장해 바로 꺼내쓸수있게해준다.  -->
	${param.firstName }
	
</body>
</html>