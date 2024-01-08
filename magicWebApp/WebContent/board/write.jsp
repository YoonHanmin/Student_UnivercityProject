<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int b_id = 0;
int b_ref=1,b_step=0,b_level=0;
String b_title = "";


if(request.getParameter("b_id")!=null){// 쿼리스트링으로 id값을 받아온다 = 답변글이다.
b_id = Integer.parseInt(request.getParameter("b_id"));
}

BoardDBBean db = BoardDBBean.getInstance();
BoardBean board =db.getBoard(b_id,false);
if(board!=null){ //getBoard(id=0)이라면 신규 글이고, board가 있다면 답변글이므로 write_ok에 아래 값,위의 id값도 hidden으로 들고 가야한다. 
	b_ref = board.getB_ref();
	b_step = board.getB_step();
	b_level = board.getB_level();
	b_title = board.getB_title();
}


%>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<script type="text/javascript" src="script.js?as"></script>
</head>
<body>



		<center>
		<h1> 글 올 리 기</h1>
	<form name="writeform" action="write_ok.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="b_id" value="<%=b_id%>">
		<input type="hidden" name="b_ref" value="<%=b_ref%>">
		<input type="hidden" name="b_step" value="<%=b_step%>">
		<input type="hidden" name="b_level" value="<%=b_level%>">
		
	<table border="1" align="center" width="600px" padding="10px">
		<tr>
		<td>작성자</td>
		<td width="140"><input type="text" name="b_name" size="10" maxlength="20"></td>
		<td width="80">이메일</td>
		<td width="240"><input type="text" name="b_email" size="24" maxlength="50"></td>
		</tr>
		<tr height="30">
		<td width="80">글 제목</td>
		<td colspan="3">
		<%
		if(b_id==0){// 신규글
			%>
	<input type="text" name="b_title" size="55" maxlength="80"></td>
<% 			
		}else{ //답변글
		%>
		 
	<input type="text" name="b_title" size="55" maxlength="80" value="[답변]:<%=b_title%>"></td>
			
			<%} %>
		
		</tr>
		<tr height="30">
		<td width="80">파	일</td>
		<td colspan="3" width="140">
		<input type="file" name="b_fname" size="40" maxlength="100">
		</td>
		</tr>
				
		<tr>
		<td colspan="4">
		<textarea cols="65" rows="10" name="b_content" maxlength="3000"></textarea></td>
		
		</tr>
		<tr>
		<td>암호</td>
		<td><input type="password" name="b_pwd"></td>
		</tr>
		<tr height="50" align="center">
		<td colspan="4">
		<input type="button" onclick="write_ok()" value="글쓰기">&nbsp;
		<input type="reset" value="다시작성">
		<input type="button" value="글목록" onclick="location.href='list.jsp'">
		</td>
		</tr>
</table>
	</form>
	</center>


</body>
</html>