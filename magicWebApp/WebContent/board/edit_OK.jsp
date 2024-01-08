<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int id =Integer.parseInt(request.getParameter("id"));
BoardDBBean db = BoardDBBean.getInstance();

int re = db.editBoard(board);
if(re==1){
	
	%>
	
<script>
	alert('수정이 완료되었습니다.');
	location.href='list.jsp';
	</script>
	<%
}else{
	
	out.print("<script>");
	out.print("alert('수정에 실패 하였습니다.');");
	out.print("history.back();");	
	out.print("</script>");
	
}



%>



</body>
</html>