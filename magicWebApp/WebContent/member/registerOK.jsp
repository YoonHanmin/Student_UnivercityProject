<%@page import="java.io.PrintWriter"%>
<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
<jsp:setProperty property="mem_uid" name="mb"/>
<jsp:setProperty property="mem_pwd" name="mb"/>
<jsp:setProperty property="mem_name" name="mb"/>
<jsp:setProperty property="mem_email" name="mb"/>
<jsp:setProperty property="mem_address" name="mb"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
	MemberDBBean manager = new MemberDBBean();
	if(manager.confirmID(mb.getMem_uid())==1){
		out.print("<script>");
		out.print("alert('중복되는 아이디가 존재합니다.');");
		out.print("history.back();");
		out.print("</script>");
	}else{
		int re = manager.insertMember(mb);
		if(re==1){
		out.print("<script>");
		out.print("alert('회원가입을 환영합니다. 회원으로 로그인해주세요.');");
		out.print("location.href='login.jsp'");	
		out.print("</script>");
		}else{
		out.print("<script>");
		out.print("alert('회원가입에 실패했습니다.');");
		out.print("history.back();");
		out.print("</script>");
		
		}
		
	}
%>


</body>
</html>