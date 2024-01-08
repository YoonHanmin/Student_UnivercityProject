<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<table width="400" border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>등급</td>
			<td>전화번호</td>
			
		
		</tr>
	



<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "select * from member2";
	String url = "jdbc:mysql://localhost:3307/jspdb";
	String user = "root";
	String pw = "1234";
%>

<%
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pw);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while(rs.next()){
		%>
		<tr>
			<td><%= rs.getString("id") %></td>
			<td><%= rs.getString("name") %></td>
			<td><% 
			if(rs.getInt("mclass")==1){ out.print("교수님");}
			else {out.print("일반학생");%></td>
			<td><%= rs.getString("tel") %></td>
		
		</tr>
		
		
		<% 
	}
	
	}
	
	
	
		
	}catch(SQLException e){
	out.print("DB연결 실패!");
	}finally{
		if(rs!=null){
			rs.close();
		}
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}



%>
	</table>

</body>
</html>