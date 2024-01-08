<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<form method="post" action="session_process.jsp">
	<table>
		<tr>
			<td align="right"> 아이디 : </td>
			<td align="left">
			 <input type="text" name="userID" size="20" maxlenght="20">
			 </td>
			 </tr>
		<tr>
			<td align="right"> 비밀번호 : </td>
			<td align="left">
			 <input type="password" name="userPW" size="20" maxlenght="20">
			 </td>
			 </tr>
		<tr>
			<td align="center">
			 <input type="submit" value="로그인">
			</td>
			<td align="center">
			 <input type="reset" value="취소">
			</td>
			 </tr>
			 
	</table>
	</form>
	</center>
</body>
</html>