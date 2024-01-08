<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
// int id = 0;
// if(request.getParameter("id")!=null){
// id= Integer.parseInt(request.getParameter("id"));
	
// }
int b_level=0;
int pages = 1;
 BoardDBBean manager = BoardDBBean.getInstance();
 ArrayList<BoardBean> list = manager.getList(pages);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
		<center>
		<h1> 글목록</h1>
		<table width="600">
		<tr>
		<td align="right"><a href="write.jsp">글쓰기</a></td>
		</tr>
		</table>
	</center>
	<center>
		<table border="1"  width="800px" cellspcing="0">
		<tr>
		<th align="right">번호</th>
		<th>글제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		</tr>
	
		<%
		for(int i=0;i<list.size();i++){
		
		
		%>
		<tr bgcolor="#f7f7f7"
		onmouseover="this.style.backgroundColor='#eeeeef'"
			onmouseout="this.style.backgroundColor='#f7f7f7'"
		>
			<td align="center"><%= list.get(i).getB_id() %></td>
			<td>
			<%
			//b_level 기준으로 화살표 이미지를 들여쓰기로 출력
			if(list.get(i).getB_level() >0){ //답변글
				for(int j=0;j<b_level;j++){ // for 기준으로 들여쓰기를 얼마만큼 할것인지 정함  ex)level=4면 들여쓰기 4번
					%> 
					&nbsp;
			<% 
				}%>
<!-- for문 끝난시점 = 이미지 추가 -->
				<img src="./images/AnswerLine.gif" width="16" height="16">
				<% 
			} %>
			<a href="show.jsp?b_id=<%=list.get(i).getB_id()%>">
			<%= list.get(i).getB_title() %></a></td>
			<td align="center">
			<a href="mailto:<%= list.get(i).getB_email()%>"><%= list.get(i).getB_name() %>
			</a>
			</td>
			<td><%=sdf.format(list.get(i).getB_date()) %></td>
			<td><%=list.get(i).getB_hit() %></td>
		</tr>
		<%
		}
		%>
		
		</table>
	</center>
		
</body>
</html>