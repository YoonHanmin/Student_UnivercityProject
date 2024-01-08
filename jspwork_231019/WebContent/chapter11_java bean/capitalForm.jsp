<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="capital" class="question.Capital" ></jsp:useBean>
<jsp:setProperty property="str" name="capital"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% out.print("입력된 알파벳은 "+capital.getStr()+capital.process()); %> 는</h2>





</body>
</html>