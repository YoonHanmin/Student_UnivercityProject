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
// 		데이터베이스 연결을 위한 인터페이스인 Connection. 객체생성은 getConnection으로 한다.
		Connection conn = null;
		
// 		DB 서버나 네트워크 오류가 발생할수 있기에 예외처리 필수
		try{
// 			연결정보 => 본인 PC의 포트: 1521, sid : xe
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
// 			DB 아이디,패스워드
			String user = "scott";
			String password = "tiger";
// 			oracle jdbc 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
// 			getConnection 메소드로 연결할 DB정보를 담은 커넥션 객체를 생성하여 DB연결 
			conn = DriverManager.getConnection(url, user, password);
			out.print("데이터베이스 연결이 성공했습니다.");
		}catch(SQLException ex){
			out.print("데이터베이스 연결 실패!!");
			out.print("SQLException : "+ex.getMessage());
			
			
		}finally{
// 			conn이 null아니면 = 아직 연결정보가 있기때문에 닫아준다.
			if(conn!=null){
				conn.close();
			}
		}
		
		
		
		%>
	
	
	
</body>
</html>