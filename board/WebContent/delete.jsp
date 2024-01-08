<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDao"%>
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
	int bbsId = 0;
	if(request.getParameter("bbsId")!=null){
		bbsId = Integer.parseInt(request.getParameter("bbsId"));
	}
	BbsDao bbs = new BbsDao();
	int result= bbs.delete(bbsId);
	if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 삭제에 실패했습니다.');");
		script.println("location.href='bbs.jsp';");
		script.println("</script>");
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 삭제에 성공했습니다.');");
		script.println("location.href='bbs.jsp';");
		script.println("</script>");
	}


%>



</body>
</html>