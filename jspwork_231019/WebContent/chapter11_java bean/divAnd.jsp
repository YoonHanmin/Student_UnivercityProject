<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.DivAndRemains" id="div"></jsp:useBean>
<jsp:setProperty property="num" name="div"/>
<jsp:setProperty property="ten" name="div"/>
<jsp:setProperty property="one" name="div"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>당신이 입력한 정보입니다.</h3>
<%
div.setOne(div.getNum());
div.setTen(div.getNum());

%>
입력된 정수가 <%= div.getNum()%>은 10의 자리와 1의 자리가
 <%
if(div.process()){%>
 같습니다.<% 
 }else{%> 다릅니다.
 
<% 
}
%>



</body>
</html>