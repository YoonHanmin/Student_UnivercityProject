<%@ page language="java" contentType="text/html;  charset=UTF-8"
     pageEncoding="UTF-8"%>
    
<jsp:useBean class="question.Money" id="mon"></jsp:useBean>

<jsp:setProperty property="money" name="mon"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% out.print("입력된 금액이 "+mon.getMoney()+"<br>");
	out.print(mon.process());

		%>




</body>
</html>