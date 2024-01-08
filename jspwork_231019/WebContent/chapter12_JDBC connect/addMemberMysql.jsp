<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

		Connection conn=null;
		Statement stmt=null;
			String dburl= "jdbc:mysql://localhost:3307/jspdb";
			String dbuser= "root";
			String dbpw = "1234";

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String sclass = request.getParameter("mclass");
			String p1= request.getParameter("phone1");
			String p2= request.getParameter("phone2");
			String p3= request.getParameter("phone3");
		 
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dburl, dbuser, dbpw);
			stmt = conn.createStatement();			
			StringBuffer insert = new StringBuffer();
			insert.append("INSERT INTO MEMBER2 VALUES('");
			insert.append(id+"','");
			insert.append(pw+"','");
			insert.append(name+"','");
			insert.append(sclass+"','");
			insert.append(p1+"-"+p2+"-"+p3+"')");
	
			int re = stmt.executeUpdate(insert.toString());
			if(re==1){ 
			%>
				<p>등록 성공!!</p>
			
			<a href="addform.html">다시 등록</a>
			<a href="viewMemberMysql.jsp">검색하기</a>
			
			<% 
			}else{
				%>
				추가실패
				<% 
			}
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>




</body>
</html>