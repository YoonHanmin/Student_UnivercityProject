<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	int sum(int a,int b){
		return a+b;
	}
	%>
<!-- 	스크립틀릿 내에서는 메소드 만들수 없다. -->
<%-- 	
// 	int sum(int a,int b){
// 		return a+b;
// 	}
	
 --%>
<%
	out.print("2+3= "+sum(2,3));
%>



</body>
</html>