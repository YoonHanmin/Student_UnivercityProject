<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="arith" class="question.Arithmetic"></jsp:useBean>
<jsp:setProperty property="*" name="arith"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>당신이 입력한 정보입니다.</h4>

<%=arith.getFirst() %>와  <%=arith.getSecond() %>의 계산 결과는 

<%=arith.process(arith.getFirst(), arith.getStr(), arith.getSecond()) %>





</body>
</html>