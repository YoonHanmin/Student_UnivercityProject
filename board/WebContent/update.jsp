<%@page import="bbs.BbsDao"%>
<%@page import="bbs.Bbs"%>
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
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID= (String)session.getAttribute("userID");
	}
	if(userID ==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.');");
		script.println("location.href='main.jsp';");
		script.println("</script>");
	}
	int bbsId = 0;
	
	if(request.getParameter("bbsId")!=null){
		bbsId = Integer.parseInt(request.getParameter("bbsId"));	
	
	}
	if(bbsId==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지않은 글입니다.');");
		script.println("location.href='bbs.jsp';");
		script.println("</script>");
	}
	Bbs bbs = new BbsDao().getBbs(bbsId);
			if(!userID.equals(bbs.getUserID())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다..');");
				script.println("location.href='bbs.jsp';");
				script.println("</script>");
			}
	%>

<%-- 메뉴 바 구성 --%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="main.jsp">메인</a></li>
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="bbs.jsp">게시판</a></li>
				</ul>
		
				<ul class="navbar-nav navbar-right">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							접속하기 </a>
						
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item active" href="loginout.jsp">로그아웃</a></li>
						</ul>
					</li>
		

				</ul>
			</div>
		</div>
	</nav>
	
	<%-- 글쓰기 화면 구성 --%>
	<div class="container">
	<div class="row">
	    <form method="post" action="updateAction.jsp?bbsId=<%=bbsId%>">
		<table  style="text-align: center; border:1px solid black;
	margin-left: auto; margin-right: auto; width:60%; height:200;">
		<thead>
		<tr>
		<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기
		</th>
		</tr>
		</thead>
	<tbody>
		<tr>
			<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50"
			value="<%=bbs.getBbsTitle()%>"></td>
		</tr>
		<tr>
			<td><textarea class="form-control" placeholder="글내용" name="bbsContent" maxlength="2048" style="height:350px;"
			value="<%=bbs.getBbsContent()%>">
			</textarea></td>
		</tr>
	</tbody>
	</table>
		<input type="submit" value="수정하기" class="btn btn-primary pull-right" style="float:right;">
	</form>
	</div>
	</div>
	<script type="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
