<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>java 문자열 검색</p>
	<p>fn:contains : 문자열 포함 여부 : a 문자열에 b가 포함되어 있으면 true</p>
<!-- 	conatains(a,b) : a 문자열에 b가 포함되어 있으면 true -->
	<p>Hello,Java Server Pages ! => ${fn:contains("Hello,Java Server Pager!","java")}</p>
	<p>Hello,Java Server Pages ! => ${fn:contains("Hello,Java Server Pager!","Java")}</p>

	<p>fn:containsIgnoreCase : 문자열 포함 여부(대소문자 관계없음)</p>

	<p>Hello,Java Server Pages ! => ${fn:containsIgnoreCase("Hello,Java Server Pager!","java")}</p>
	<p>Hello,Java Server Pages ! => ${fn:containsIgnoreCase("Hello,Java Server Pager!","Java")}</p>
	
</body>
</html>