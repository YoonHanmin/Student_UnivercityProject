<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="circle" class="area.Circle"></jsp:useBean>
<jsp:setProperty property="radius" name="circle"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4> 당신이 입력한 정보입니다.</h4>
반지름이 <%= circle.getRadius() %>인 원의 면적은 <%= circle.process() %>


</body>
</html>