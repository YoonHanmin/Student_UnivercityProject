<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// pageContext : jsp 기본 객체, input에 null값 셋팅
pageContext.setAttribute("input","");
pageContext.setAttribute("input2","bbb");
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[표현 언어의 연산자]</h3>
<!-- empty : 타당성 검사 연산자,값이 없으면 true -->
	\${empty ""} => ${empty "" }<br> <!-- true --> 
	\${empty ""} => ${empty "aa" }<br>
	\${empty input} => ${empty input }<br> <!-- input 필드에 값이 없으므로 true -->
	\${empty input2} => ${empty input2 }<br> <!-- input2 필드에 값이 있으므로 false -->
	
	\${(5>2)?5:2} =>${(5>2)?5:2} <br>
	\${2 gt 10} =>${2 gt 10} <br>
	\${5/2} =>${5/2} <br>
	\${5 mod 2} =>${5 mod 2} <br>
	\${5%2} =>${5%2} <br>
	
	
	
</body>
</html>