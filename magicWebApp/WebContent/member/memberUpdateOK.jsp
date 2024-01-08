<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberDBBean manager = MemberDBBean.getInstance();
 	mb.setMem_uid((String)session.getAttribute("userID"));
	
	int re = manager.updateMember(mb);
	if(re==1){
		out.print("<script>");
		out.print("alert('수정이 완료되었습니다. 다시 로그인하세요.');");
		out.print("location.href='login.jsp'");	
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('회원정보 수정에 실패했습니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
	
	%>
</body>
</html>