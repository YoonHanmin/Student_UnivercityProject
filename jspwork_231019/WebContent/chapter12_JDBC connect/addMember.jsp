<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn= null;
	Statement stmt = null;


	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
		
		<%
			request.setCharacterEncoding("utf-8");
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String name= request.getParameter("name");
		String sclass= request.getParameter("mclass");
		String p1= request.getParameter("phone1");
		String p2 = request.getParameter("phone2");
		String p3= request.getParameter("phone3");
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			StringBuffer insertQuery = new StringBuffer();
			//insert 쿼리 조립
			insertQuery.append("INSERT INTO MEMBER2 VALUES('");
			insertQuery.append(id+"','");
			insertQuery.append(pw+"','");
			insertQuery.append(name+"','");
			insertQuery.append(sclass+"','");
			insertQuery.append(p1+"-"+p2+"-"+p3+"')");
			
			System.out.println(insertQuery.toString());
			// insert,update,delete할때 사용
			int re = stmt.executeUpdate(insertQuery.toString());
			
			if(re==1){
				%>
				추가 성공
				<br>
				<a href="addfrom.html">추가 작업</a>
				<a href="viewMember.jsp">검색 작업</a>
				<% 	
			}else{
				%>
				추가 실패
				
				<% 
			}
			
			
		}catch(SQLException ex){
			out.print("데이터베이스 연결 실패!!");
			out.print("SQLException : "+ex.getMessage());			
		}finally{

			try{
	
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		%>
	

	
	
</body>
</html>