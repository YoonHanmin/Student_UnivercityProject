<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardBean"%>
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
<%

	int b_id = Integer.parseInt(request.getParameter("b_id"));
	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getBoard(b_id,true);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	<center>
		<h2>글 내용 보기</h2>
	</center>
	<center>
	<table border="1" width="500px">
		<tr align="center">
		<th bgcolor="#f7f7f7">글번호</th>
		<td ><%=board.getB_id() %></td>
		<th bgcolor="#f7f7f7">조회수</th>
		<td ><%=board.getB_hit() %></td>
		</tr>
		<tr align="center">
		<th bgcolor="#f7f7f7">작성자</th>
		<td ><%=board.getB_name() %></td>
		<td bgcolor="#f7f7f7">작성일</td>
		<td><%=sdf.format(board.getB_date()) %></td>
		</tr>
		<tr align="center">
		<td width="110">파&nbsp;&nbsp;일</td>
		<td colspan="3">
		&nbsp;
		
		<p>첨부파일<a href='fileDownload.jsp?id=<%=board.getB_id()%>'><%= board.getB_rfname()%></a></p>
		
		<th bgcolor="#f7f7f7">글제목</th>
		<td ><%=board.getB_title() %></td>
		</tr>
		<tr align="center">
		<th colspan="4" bgcolor="#f7f7f7">글내용</th>
		</tr>
		<tr height="300px" align="center">
		<td colspan="4"><%=board.getB_content() %></td>
		</tr>
		
		<tr>
		<td colspan="3" align="center"><a href="list.jsp">목록</a></td>
		<td><input type="button" value="답글달기" onclick="location.href='write.jsp?b_id=<%=board.getB_id()%>'">
		<td><input type="button" value="글 삭제" onclick="location.href='delete.jsp?b_id=<%=board.getB_id() %>'">
		<td><input type="button" value="글 수정" onclick="location.href='edit.jsp?b_id=<%=board.getB_id() %>'">
		
		
		</tr>
	
	
	</table>

</center>
</body>
</html>