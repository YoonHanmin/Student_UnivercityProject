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
<%
String s_name = "1번째 name";
String s_name2 = "2번째 name";
String s_value = "1번째 value";
String s_value2 = "2번째 value";
session.setAttribute("s_name", s_value);
session.setAttribute("s_name2", s_value2);

out.print("<hr><h3>-----세션값을 삭제하기 전</h3>");

Enumeration enum_ap = session.getAttributeNames();
int i=0;

while(enum_ap.hasMoreElements()){
	i++;
	s_name = enum_ap.nextElement().toString();
	s_value = session.getAttribute(s_name).toString();
	out.print("<br>얻어온 세션 이름["+i+"]"+s_name+"<br>");
	out.print("<br>얻어온 세션 값["+i+"]"+s_name+"<br>");
}
// session 이름이 s_name2 인것을 삭제
session.removeAttribute("s_name2");

out.print("<hr><h3>-----세션값을 삭제한 후</h3>");

enum_ap = session.getAttributeNames();


while(enum_ap.hasMoreElements()){
	i++;
	s_name = enum_ap.nextElement().toString();
	s_value = session.getAttribute(s_name).toString();
	out.print("<br>얻어온 세션 이름["+i+"]"+s_name+"<br>");
	out.print("<br>얻어온 세션 값["+i+"]"+s_name+"<br>");
}


%>


</body>
</html>