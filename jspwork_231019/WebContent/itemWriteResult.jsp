<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//Form으로 넘어온 값 셋팅 및 DB 연동 준비
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");	
	int price=Integer.parseInt(request.getParameter("price"));	
	String description=request.getParameter("description");	
	int result = 0;
	Connection conn = null;
	PreparedStatement pstmt = null;
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String username = "scott";
	String password = "tiger";
	
	
	try{ // Connection 객체생성 DB 연결, SQL 구문 삽입하여 DB에 insert
	String sql = "insert into item values(?,?,?)";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, username, password);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setInt(2, price);
	pstmt.setString(3,description);
	
	result = pstmt.executeUpdate();
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		if(pstmt !=null) pstmt.close();
		if(conn !=null) conn.close();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
if(result==1){ // INSERT 성공시 결과보기 <a>태그 출력
	%>
<h1><a href="itemWrite.jsp">결과보기</a></h1>
	
	<%	
	}else {%>
		<h1>등록실패!!</h1>	
		<script>
		history.back();
		</script>
<% }
	%>	


</body>
</html>