<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDao"%>
<%@page import="bbs.Bbs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID= (String)session.getAttribute("userID");
		}
		if(userID ==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.');");
			script.println("location.href='login.jsp';");
			script.println("</script>");
		}
		int bbsId = 0;
			if(request.getParameter("bbsId")!=null){
				bbsId = Integer.parseInt(request.getParameter("bbsId"));
			}
		if(bbsId ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않은 글입니다..')");
			script.println("history.back();");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDao().getBbs(bbsId);
		
//		if(!userID.equals(bbs.getUserID())){
	//		PrintWriter script = response.getWriter();
		//	script.println("<script>");
			//script.println("alert('권한이 없습니다..');");
//			script.println("location.href='bbs.jsp';");
//		script.println("</script>");
		//}
	//	
//		else {
		if(request.getParameter("bbsTitle")==null || request.getParameter("bbsContent")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back();");
			script.println("</script>");
		} else {
			BbsDao bbsDao = new BbsDao();
			int result = bbsDao.update(bbsId,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back();");
				script.println("</script>");
			} else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 수정되었습니다.')");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
			}
		}
		
	
	
	
	
	%>



</body>
</html>