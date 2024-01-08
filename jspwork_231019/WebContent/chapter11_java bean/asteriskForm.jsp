<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Asterick" id="asterick"></jsp:useBean>
<jsp:setProperty property="num" name="asterick"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print(asterick.getNum()+"는 <br>"+asterick.process());

%>
</body>
</html>