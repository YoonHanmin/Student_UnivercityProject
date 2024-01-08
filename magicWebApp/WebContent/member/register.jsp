<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<table border="1">
<!-- 		스크립트로 넘기기위해서 form에도 name값을 준다  -->
		<form name="reg_form" method="post" action="registerOK.jsp">
		<tr rowspan="2" >
		<tr height="50">
			<td colspan="3" style="text-align:center;"><h2>회원 가입 신청</h2><br>
			'*'표시항목은 필수 입력 항목입니다.</td>
			
		</tr>
		</tr>
	
	
		<tr height="30">
			<td width="80">User ID</td>
			<td colspan="2"><input type="text" name="mem_uid" size="10">*</td>
		</tr>
		<tr height="30">
			<td width="80">암	호</td>
			<td colspan="2"><input type="password" name="mem_pwd" size="10">*</td>
		</tr>
		<tr height="30">
			<td width="80">암호 확인</td>
			<td colspan="2"><input type="password" name="pwd_check" size="10">*</td>
		</tr>
		<tr height="30">
			<td width="80">이    름</td>
			<td colspan="2"><input type="text" name="mem_name" size="10">*</td>
		</tr>
		<tr height="30">
			<td width="80">E-mail</td>
			<td colspan="2"><input type="text" name="mem_email" size="50">*</td>
		</tr>
		<tr height="30">
			<td width="80">주	소</td>
			<td colspan="2"><input type="text" name="mem_address" size="50"></td>
		</tr>
		
		<tr>
			<td colspan="3">
			<input type="button" value="등록" onclick="check_ok()">
			<input type="reset" value="다시입력">
			<input type="button" value="가입안함">
			</td>
			
		</tr>
	</form>
	
	</table>




</body>
</html>