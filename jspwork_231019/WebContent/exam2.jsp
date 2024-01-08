<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String uid="scott";
	String pwd= "tiger";
	StringBuffer selectQuery = new StringBuffer();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="400" border="1">
		<tr>
			<td>컬럼명</td>
			<td>컬럼형식</td>
			<td>컬럼길이</td>
			<td>널값여부</td>
		</tr>
		<%
			try{
				String tname = request.getParameter("table");
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url,uid,pwd);
				stmt = conn.createStatement();
				selectQuery.append("Select column_name");
				selectQuery.append("		,data_type");
				selectQuery.append("		,data_length");
				selectQuery.append("		,nullable");
				selectQuery.append(" FROM User_Tab_colums");
				selectQuery.append(" where table_name='"+tname+"'");
				rs = stmt.executeQuery(selectQuery.toString());
// 				StringBuffer 반복시 쿼리가 쌓이기때문에 초기화
				selectQuery.setLength(0);
				
				while(rs.next()){
					%>
					<tr>
						<td><%= rs.getString("column_name") %></td>
						<td><%= rs.getString("data_type") %></td>
						<td><%= rs.getInt("data_length") %></td>
						<td><%= rs.getString("nullable") %></td>
					<% 
					
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try{
					if(rs !=null) rs.close();
					if(stmt !=null) stmt.close();
					if(conn !=null) conn.close();
				}catch(SQLException se){
					se.printStackTrace();
					
				}
				
			}
		%>
		
	</table>


</body>
</html>