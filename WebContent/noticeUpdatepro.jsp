<%@page import="noticebbs.NoticeBBS"%>
<%@page import="noticebbs.NoticeDao"%>
<%@page import="java.io.PrintWriter"%>
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
	request.setCharacterEncoding("utf-8");

// 세션 일치여부 확인
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	
	
	
	// 로그인 여부 검사
	if(userID==null){
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('로그인 하세요.')");
		pw.print("</script>");
		response.sendRedirect("login.jsp");
	}else{
	int bbsID =0;
	if(request.getParameter("bbsID")!=null){
	bbsID =Integer.parseInt(request.getParameter("bbsID"));
	}
	// 쿼리스트링으로 안넘어오면
	if(bbsID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지않은 글입니다..')");
		script.println("history.back();");
		script.println("</script>");
	}
	
	
	// 빈칸 입력여부 
	if(request.getParameter("bbsTitle")==null || request.getParameter("bbsContent")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
	} else {
		
	NoticeDao noticeDao = new NoticeDao(); 
	NoticeBBS noticebbs = noticeDao.getBBS(bbsID);
		
	
	int result = noticeDao.bbsUpdate(userID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
	if(result==-1){
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('글쓰기에 실패했습니다')");
		pw.print("</script>");
		response.sendRedirect("update.jsp");
	}else {
		PrintWriter pw = response.getWriter();
		pw.print("<script>");
		pw.print("alert('글 수정 완료')");
		pw.print("</script>");
		response.sendRedirect("notice.jsp");
		
	}
	}
	
	}
	%>
</body>
</html>