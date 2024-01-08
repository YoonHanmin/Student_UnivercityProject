<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[액션 태그와 표현 언어]</h3>
	<jsp:useBean class="glory.User" id="user"></jsp:useBean>
	<jsp:getProperty property="firstName" name="user"/>
	<jsp:getProperty property="lastName" name="user"/>
	<hr>
<!-- el 액션 태그 표헌언어로 객체의 값을 가져올 수 있다. -->
	${user.firstName}
	${user.lastName}
	<hr>
	<jsp:setProperty property="firstName" name="user" value="Gildong"/>
	<jsp:setProperty property="lastName" name="user" value="Hong"/>
	<jsp:getProperty property="firstName" name="user"/>
	<jsp:getProperty property="lastName" name="user"/>
	<hr>
<!-- el 액션 태그 표헌언어로 객체의 값을 가져올 수 있다. -->
	${user.firstName}
	${user.lastName}
	
	<form action="elEx04.jsp" method="post">
	<input type="text" name="firstName">
	<input type="submit">
	</form>
	
</body>
</html>