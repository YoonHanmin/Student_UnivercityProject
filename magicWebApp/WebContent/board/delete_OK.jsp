<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%int id= Integer.parseInt(request.getParameter("id"));
	String pw = request.getParameter("b_pwd");
	BoardDBBean db = new BoardDBBean();
	int re = db.deleteBoard(id, pw);
if(re==1){
		
		%>
		
	<script>
		alert('삭제가 완료되었습니다.');
		location.href='list.jsp';
		</script>
		<%
	}else{
		
		out.print("<script>");
		out.print("alert('삭제에 실패 하였습니다.');");
		out.print("history.back();");	
		out.print("</script>");
		
	}
	



%>



</body>
</html>