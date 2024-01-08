<%@page import="magic.member.MemberDBBean"%>
<%@page import="magic.member.MemberBean"%>
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
<% 
	String userID =null;
	String userName = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	if(session.getAttribute("name")!=null){
		userName = (String)session.getAttribute("name");
	}
	MemberDBBean manager = MemberDBBean.getInstance();
	MemberBean mb = manager.getMember(userID);
			
	
	
		%>

	<table border="1" align="center">
<!-- 		스크립트로 넘기기위해서 form에도 name값을 준다  -->
		<form name="reg_form" method="post" action="memberUpdateOK.jsp">
		<tr rowspan="2" >
		<tr height="50">
			<td colspan="3" style="text-align:center;"><h2>회원 정보 수정</h2><br>
			'*'표시항목은 필수 입력 항목입니다.</td>
			
		</tr>
		</tr>
	
	
		<tr height="30">
			<td width="80">User ID</td>
			<td colspan="2"><%=mb.getMem_uid() %></td>
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
			<td colspan="2"><%=mb.getMem_name() %></td>
		</tr>
		<tr height="30">
			<td width="80">E-mail</td>
			<td colspan="2"><input type="text" name="mem_email" size="50" value=<%= mb.getMem_email() %>>*</td>
		</tr>
		<tr height="30">
			<td width="80">주	소</td>
			<td colspan="2"><input type="text" name="mem_address" size="50" value=<%= mb.getMem_address() %>></td>
		</tr>
		
		<tr>
			<td colspan="3">
			<input type="button" value="수정" onclick="update_check_ok()">
			<input type="reset" value="다시입력">
			<input type="button" onclick="location.href='login.jsp'" value="수정안함">
			</td>
			
		</tr>
	</form>
	
	</table>




</body>
</html>