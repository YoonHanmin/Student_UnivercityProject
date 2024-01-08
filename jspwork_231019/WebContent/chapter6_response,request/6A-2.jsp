<%@page import="java.util.Calendar"%>
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
Calendar cal = Calendar.getInstance();
int hour = cal.get(Calendar.HOUR);
int minute = cal.get(Calendar.MINUTE);
int second = cal.get(Calendar.SECOND);
int ap = cal.get(Calendar.AM_PM);
String ampm = (ap==Calendar.AM_PM)?"AM":"PM";

out.print("현재 시간은 "+hour+":"+minute+": "+second+ampm);
%>
<br>
<a href="response_data.jsp">Google 홈페이지로 이동하기</a>

</body>
</html>