<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
	<table border="1" align="center">
		<form method="post" action="loginOK.jsp">
		<tr height="30">
			<td width="100" align="center">사용자 ID</td>
			<td width="100" align="center">
			<input type="text" id="id" name="mem_uid" size="10"></td>
			
		</tr>
		<tr height="30">
			<td width="100" align="center">비밀번호</td>
			<td width="100" align="center">
			<input type="password" id="pw" name="mem_pwd" size="10"></td>
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="submit" value="로그인">
			<input type="button" onclick="location.href='register.jsp'" value="회원가입">
			</td>
			
		</tr>
	
	</form>
	</table>



</body>
</html>