<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h3>
	[설정된 세션값을 얻어오는 예제-2]
	</h3>
	</center>
	<hr> getAttributeNames()메소드를 사용하여 세션값을 얻어오는 예제입니다.
	<hr>
	<% 
	String str_validate = "현재 페이지는 물론 이전 페이지에서 설정된 세션 값들도 나타납니다.";
	session.setAttribute("Validate",str_validate);
	session.setAttribute("Validate2","세션2의 value");
	session.setAttribute("Validate3","세션3의 value");
	String str_name;
	String str_value;
	Enumeration enum_app = session.getAttributeNames();
	int i=0;
	// hasMoreElements: 열거형 객체가 있으면 true
	while(enum_app.hasMoreElements()){
		i++;
		// nextElement : 열거형 값을 가져옴.
		str_name = enum_app.nextElement().toString();
		//session 이름으로 session value을 가져옴.
		str_value =session.getAttribute(str_name).toString();
		
		out.print("<br>얻어온 세션 이름["+i+"]"+str_name+"<br>");
		out.print("<br>얻어온 세션 값 ["+i+"]"+str_value+"<br>");
	}
	%>
	
</body>
</html>