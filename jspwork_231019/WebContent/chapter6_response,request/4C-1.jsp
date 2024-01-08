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
public String cala(){
String year,month,days = "";

Calendar cal = Calendar.getInstance();
cal.add(Calendar.YEAR,-1);
cal.add(Calendar.MONTH,-1);
cal.add(Calendar.DAY_OF_MONTH,-3);

year = ""+cal.get(Calendar.YEAR);
month = ""+ cal.get(Calendar.MONTH);
days = ""+cal.get(Calendar.DAY_OF_MONTH);

return year+"-"+month+"-"+days;
}
%>





</body>
</html>