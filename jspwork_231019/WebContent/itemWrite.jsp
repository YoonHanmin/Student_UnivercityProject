<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
ResultSet rs=null;
Connection conn = null;
Statement stmt = null;
String url="jdbc:oracle:thin:@localhost:1521:xe";
String username = "scott";
String password = "tiger";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<% 
try{ // DB연동 및 item Table Select로 가져오기 
String sql = "select * from item";
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, username, password);
stmt = conn.createStatement();

rs = stmt.executeQuery(sql);
while(rs.next()){ // item Table row값 출력
	%>
		<tr> 
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getInt("price") %></td>
			<td><%=rs.getString("description") %></td>
		</tr>
	<% 
}
}catch(SQLException se){
	se.printStackTrace();
}finally{ // 자원 반납
	if(rs !=null) rs.close(); 
	if(stmt !=null) stmt.close(); 
	if(conn !=null) conn.close();
}
%>
</table>
</body>
</html>