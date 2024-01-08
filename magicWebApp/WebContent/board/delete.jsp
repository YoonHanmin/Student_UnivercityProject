<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
int id= Integer.parseInt(request.getParameter("id"));
%>
	<center> 
		<h1>글 삭 제 하 기</h1>
		<h2>>> 암호를 입력하세요. << </h2>
		<form action="delete_OK.jsp?id=<%=id %>" method="post" name="deleteform">
			암 호 <input type="password" name="b_pwd" size="10"><br>
		<input type="button" onclick="delete_ok()" value="글삭제">&nbsp;
		<input type="reset" value="다시작성">
		<input type="button" value="글목록" onclick="location.href='list.jsp'">
		
		
		</form>
	
	
	</center>
</body>
</html>