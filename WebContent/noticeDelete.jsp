<%@page import="java.io.PrintWriter"%>
<%@page import="noticebbs.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int bbsID =Integer.parseInt(request.getParameter("bbsID"));
	
	NoticeDao noticeDao = new NoticeDao();
	int result = noticeDao.bbsDelete(bbsID);
	if(result==-1){
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('삭제실패')");
		pw.print("</script>");
		response.sendRedirect("notice.jsp");
	}else {
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('글 삭제 완료')");
		pw.print("</script>");
		response.sendRedirect("notice.jsp");
		
	}
	
	
	
	
	%>



</body>
</html>