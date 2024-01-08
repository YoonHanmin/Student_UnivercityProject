<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn= null;
	DataSource ds=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
		<%
		String id = request.getParameter("id");
		try{
			Context ctx =new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			conn = ds.getConnection();
			System.out.println("DBCP 연동 성공");
			
			
			StringBuffer select = new StringBuffer();
			select.append("select name,class,tel from member2 where id=?");
			
		PreparedStatement pstmt = conn.prepareStatement(select.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if(rs.next()){ //쿼리 결과값을 출력후, 해당 내용 수정해서 넘기기위한 form 작성
			
			%>
			<form method="post" action="updateProcess.jsp">
				아이디 : <%=id%><br>
				이름 : <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
				회원등급 : <input type="text" name="sclass" value="<%=rs.getString("class")%>"><br>
				전화번호 : <input type="text" name="tel" value="<%=rs.getString("tel")%>"><br>
				<input type="submit" value="수정">
				<a href="viewMember.jsp">목록보기</a>
			</form>

			<% 
		}else{ 
			
			%>
			<font color="red">아이디가 없습니다.</font>
				<a href="viewMember.jsp">목록보기</a>
			
	<%}
		
		
		
		}catch(NamingException ne){ //커넥션 풀 이름을 못찾을때 예외
			ne.printStackTrace();
		}
	catch(SQLException se){
			se.printStackTrace();	
		}finally{

			try{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		%>
	

	
	</table>
	
</body>
</html>