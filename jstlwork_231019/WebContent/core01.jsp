<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	id 변수값 설정 (aaa 값 설정)
<!-- c:set 변수값 세팅  -->
	<c:set var="id" value="aaa"></c:set><br>
	<c:out value="${id}"/><br>
	
	id 변수값 설정 (aaa 값 설정)
	<c:remove var="id"/> <!-- 변수값 삭제 -->
	<c:out value="${id}"></c:out><br>
	
	
	
</body>
</html>