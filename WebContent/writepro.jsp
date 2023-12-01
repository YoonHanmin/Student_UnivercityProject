<%@page import="java.io.PrintWriter"%>
<%@page import="noticebbs.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="noticebbs" class="noticebbs.NoticeBBS" scope="page" />
<jsp:setProperty name="noticebbs" property="bbsTitle"/>
<jsp:setProperty name="noticebbs" property="bbsContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	
	
	
	
	if(userID==null){
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('로그인 하세요.')");
		pw.print("</script>");
		response.sendRedirect("login.jsp");
	}else{
	if(noticebbs.getBbsTitle()==null||noticebbs.getBbsContent()==null){
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('입력이 안된 사항이 있습니다.')");
		pw.print("</script>");
		response.sendRedirect("write.jsp");
	} else{


	NoticeDao noticeDao = new NoticeDao(); 
	
	int result = noticeDao.write(userID,noticebbs.getBbsTitle(),noticebbs.getBbsContent());
	if(result==-1){
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('글쓰기에 실패했습니다')");
		pw.print("</script>");
		response.sendRedirect("write.jsp");
	}else {
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('글 작성 완료')");
		pw.print("</script>");
		response.sendRedirect("notice.jsp");
		
	}
	}
	}
%>

</body>
</html>