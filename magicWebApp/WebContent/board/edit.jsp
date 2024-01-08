<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script.js?a1a"></script>
<title>Insert title here</title>
</head>
<body>
<%
int id= Integer.parseInt(request.getParameter("id"));

BoardDBBean db = new BoardDBBean();
BoardBean board = db.getBoard(id, false);

%>
	<center> 
		<h1>글 수정 하 기</h1>
		
			<table>
		<form action="edit_OK.jsp?id=<%=id %>" method="post" name="editform">
			<tr>
			<td>작성자</td> 
			<td><input type="text" name="b_name" size="10" value="<%=board.getB_name() %>"></td>
			<td>이메일</td>
			<td><input type="text" name="b_email" size="10" value="<%= board.getB_email() %>">
			</td>
			</tr>
			<tr>
			<td >글제목</td>
			<td colspan="3"><input type="text" name="b_title" size="20" value="<%= board.getB_title() %>"></td>
			</tr>
			<tr>
			<td colspan="4">
			<textarea cols="65" rows="10" name="b_content" maxlength="3000"><%=board.getB_content() %></textarea></td>
			</tr>
			<tr>
			<td>암호</td>
			<td><input type="password" name="b_pwd" size="10"></td>
			</tr>
			<tr>
			<td>
		<input type="button" onclick="edit_ok()" value="글수정"></td>
		<td><input type="reset" value="다시작성"></td>
		<td><input type="button" value="글목록" onclick="location.href='list.jsp'"></td>
		</tr>
		</form>
		</table>
	
	
	</center>
</body>
</html>