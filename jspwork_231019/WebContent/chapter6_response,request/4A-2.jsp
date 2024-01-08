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
	<%! 
	public String calDate(){
	Calendar ca = Calendar.getInstance();
	ca.add(Calendar.DATE,1);
	int year = ca.get(Calendar.YEAR);
	int month = ca.get(Calendar.MONTH)+1;
	int day = ca.get(Calendar.DATE);
	return year+"-"+month+"-"+day;
	}
	%>
	
	내일 = <%= calDate() %>
</body>
</html>