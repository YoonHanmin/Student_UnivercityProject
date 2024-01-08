<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
<jsp:setProperty property="mem_uid" name="mb"/>
<jsp:setProperty property="mem_pwd" name="mb"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDBBean manager = MemberDBBean.getInstance();
	int check = manager.login(mb.getMem_uid(),mb.getMem_pwd());
	mb = manager.getMember(mb.getMem_uid()); 
	if(mb==null){ //회원 없음
		out.print("<script>");
		out.print("alert('존재하지않는 회원입니다.');");
		out.print("location.href='login.jsp'");	
		out.print("</script>");
	}else{
		if(check ==1){ //비밀번호가 일치하면
		session.setAttribute("userID",mb.getMem_uid()); // 회원 아이디
		session.setAttribute("name",mb.getMem_name()); //회원 이름
		session.setAttribute("Member","yes"); //회원 여부
		out.print("<script>");
	
		out.print("location.href='main.jsp';");	
		out.print("</script>");
	}else if(check==0){
		out.print("<script>");
		out.print("alert('비밀번호가 틀렸습니다.');");
		out.print("history.back();");	
		out.print("</script>");
		
	}else{
		out.print("<script>");
		out.print("alert('아이디가 틀렸습니다.');");
		out.print("history.go(-1);");	
		out.print("</script>");
		
		
		
	}
	}
	

%>
</body>
</html>