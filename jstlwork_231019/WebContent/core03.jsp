<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>구구단(forEach : 반복문)</h3>
	<h4>begin : 시작 , end : 끝</h4>
	<table border="1">
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="1" end="9">
					<td width="100">
					${i}*${j}=${i*j}
					</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>