<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn= null;
//  쿼리문 이용을 위한 인터페이스 Statement를 통해 DB에 쿼리문을 주입한다.
	Statement stmt = null;
//  쿼리 결과를 받기위한 인터페이스
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	String sql = "Select * from member2";
%>
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
			<td>구분</td>
			<td>전화번호</td>
		</tr>
		<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			// createStatement 메소드를 호출해서 쿼리 이용하는 stmt 객체 생성
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql); // executeQuery 메소드를 통해 sql구문을 담아서 쿼리 실행후 rs로 받는다.
			
			while(rs.next()){ // 쿼리 결과가 있으면 참
				%>
				<tr>
<!--getString : 문자타입의 행값  , getInt : int 타입 -->
<%-- 					<td><%= rs.getString("id")%></td> --%>
<!-- 						쿼리스트링으로 해당 id값을 가지고 updateMember.jsp로 감 -->
<!-- 데이터 넘기는 방법 
1. 해당키(ex아이디)만 넘길때 : 아이디를 가지고 가서 조회 -> select~ where id=? //다중 사용자가 수시로 조회할때 접속하는 순간에도 시시각각 쿼리스트링이 꼬일수있기때문에, PK만 들고와서
해당 pk의 데이터를 조회에서  들고오는 방법이 더 좋다.
2. 모든 데이터 넘길때 : ?id= &?name= ?tel=


 -->


					<td><a href="updateMember.jsp?id=<%=rs.getString("id") %>"><%= rs.getString("id")%>
					</a></td>
					<td><%= rs.getString("name") %></td>
					<td><%
						int n_class = rs.getInt("class");
					if(n_class==1){
						out.print("일반회원");
					}else { out.print("교수님");}
					%></td>
					<td><%= rs.getString("tel") %></td>
				</tr>
				<%
			}
//			out.print("데이터베이스 연결이 성공했습니다.");
		}catch(SQLException ex){
			out.print("데이터베이스 연결 실패!!");
			out.print("SQLException : "+ex.getMessage());			
		}finally{
	// 	자원반납시에도 예외처리
			try{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		%>
	
	</table>
	
	
</body>
</html>