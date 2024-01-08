<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
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
		Connection conn=null;
	//	커넥션풀을 위한 DataSource 객체 선언
		DataSource ds=null;
	%>
	<%
		try{
			// InitialContext : 커넥션풀을 사용하기위한 객체 생성해서 Context 타입으로 받음.
			Context ctx =new InitialContext();
			//java:comp/env/ : 'server.xml에서 리소스 태그에 name을 찾아가겠다' 라는것을
			// lookup 메소드를 이용해서 DataSource타입 ds로 받는다.
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			// ds가 커넥션 객체를 생성하며 커넥션 연결
			conn = ds.getConnection();
			System.out.println("DBCP 연동 성공");
		}catch(NamingException ne){ //커넥션 풀 이름을 못찾을때 예외
			ne.printStackTrace();
		}
	catch(SQLException se){
			se.printStackTrace();
		}finally{
			try{
//				dbcp 연결된 정보가 있으면 자원 반납				
				if(conn!=null) conn.close();
				System.out.println("반납완료");
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
	%>
</body>
</html>