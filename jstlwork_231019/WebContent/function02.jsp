<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>fn:split => 문자열을 공백으로 나누어서 배열 형태 texts로 받는다 </p>
	<c:set var="texts" value="${fn:split('Hello,Java Server Pages!',' ')}"></c:set>
	<c:forEach var="i" begin="0" end="${fn:length(texts-1}">
	<p>
	texts[${i}]= ${texts[i]}
	</p>
	
	
	</c:forEach>
</body>
</html>