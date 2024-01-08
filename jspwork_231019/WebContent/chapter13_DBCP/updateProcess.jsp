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
<%
request.setCharacterEncoding("utf-8");
%>
<%!
	Connection conn= null;
	DataSource ds=null;
	PreparedStatement pstmt = null;

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
		<%

		try{
// 			Context ctx =new InitialContext();
// 			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
// 			conn = ds.getConnection();
			
			conn =((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
						
		}catch(NamingException ne){ //커넥션 풀 이름을 못찾을때 예외
			ne.printStackTrace();
		}
		
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String vclass = request.getParameter("sclass");
		String tel = request.getParameter("tel");
		String sql = "UPDATE MEMBER2 SET NAME=?,CLASS=?,TEL=? where ID=?";
		try{	
		
		pstmt = conn.prepareStatement(sql);
		// ?값을 순서대로 세팅 
		pstmt.setString(1, name); //varchar2 타입은 setString메소드
		pstmt.setInt(2, Integer.parseInt(vclass));
		// int타입으로 형변환 -> 오라클에서 자동형변환 할수있지만 속도저하
		pstmt.setString(3, tel);
		pstmt.setString(4, id);
		int res = pstmt.executeUpdate();
		if(res==1){
			%>
			<%=id %>의 정보가 수정되었습니다.<br>
			[<a href="viewMember.jsp">목록보기</a>]
			<% 
		}else{
			%>
				수정 실패!!!
			[<a href="viewMember.jsp">목록보기</a>]
			
			<%	
		}

		}
	catch(SQLException se){
			se.printStackTrace();	
		}finally{

			try{
			
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