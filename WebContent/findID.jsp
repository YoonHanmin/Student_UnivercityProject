<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>
</script>
</head>
<body>
	<table border="1" align="center">
		<form method="post" action="findIDPro.jsp">
		<tr height="30">
			<td width="100" align="center">학번</td>
			<td width="100" align="center">
			<input type="text"name="userNum" size="10"></td>
			
		</tr>
		<tr height="30">
			<td width="100" align="center">이름</td>
			<td width="100" align="center">
			<input type="text" name="userName" size="10"></td>
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="submit" value="아이디 찾기">
			<input type="button" onclick="location.href='register.jsp'" value="회원가입">
			</td>
			
		</tr>
	
	</form>
	</table>



</body>
</html>