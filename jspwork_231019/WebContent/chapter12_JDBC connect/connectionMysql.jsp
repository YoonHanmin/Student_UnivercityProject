<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	
	Connection conn = null;
	try{
	String url = "jdbc:mysql://localhost:3307/jspdb";
	String user = "root";
	String pw = "1234";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pw);
	
		out.print("DB 연결 성공!");
		
	}catch(SQLException e){
	out.print("DB연결 실패!");
	}finally{
		if(conn!=null){
			conn.close();
		}
	}



%>




</body>
</html>