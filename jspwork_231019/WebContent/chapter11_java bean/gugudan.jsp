<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myBean" class="question.GuGuDan"></jsp:useBean>
<jsp:setProperty property="*" name="myBean"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>구구단 출력하기 </h4>

<%
myBean.setNum(5);

out.print(myBean.process());
out.print(myBean.process());
out.print(myBean.process());

%>


</body>
</html>