<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class=question.Three"bak" id="bak"/>

<jsp:setProperty property="num" name="bak"/>
<jsp:setProperty property="res" name="bak"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

입력한 정보는
<%= bak.getNum() %>
<%= bak.process(bak.getNum()) %>
</body>
</html>