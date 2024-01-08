<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Alphabet" id="alpabet"></jsp:useBean>
<jsp:setProperty property="str" name="alpabet"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>입력된 알파벳은 </h2> <%= alpabet.getStr() %>
<%
out.print(alpabet.process());
%>

</body>
</html>