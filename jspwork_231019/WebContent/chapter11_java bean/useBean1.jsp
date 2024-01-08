<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="myBean" class="area.Circle"></jsp:useBean>
<jsp:setProperty property="*" name="myBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

원의 면적 출력하기
반지름이 <%= myBean.getRadius() %>인 원의 면적은 <%= myBean.process() %>

</body>
</html>