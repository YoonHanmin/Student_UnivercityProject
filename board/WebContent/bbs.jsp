
<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDao"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%-- bootstrap 5 적용 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<title>Main Page</title>
</head>
<body>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>




	<%-- 메뉴 바 구성 --%>
	<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><nav class="navbar navbar-expand-lg navbar-light bg-light">
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
				<% if(userID==null){
				%>
				<ul class="navbar-nav navbar-right">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							접속하기 </a>
						
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item active" href="login.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				<%
				} else {%>
				<ul class="navbar-nav navbar-right">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							접속하기 </a>
						
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item active" href="logout.jsp">로그아웃</a></li>
						</ul>
					</li>
				<%} %>
				
				
				
				
				
				
				</ul>
			</div>
		</div>
	</nav>
	
	<%-- 게시판 화면 구성 --%>
	<div class="container">
		<table  style="text-align: center; border:1px solid black;
	margin-left: auto; margin-right: auto; width:60%; height:200;">
		<thead>
		<tr>
			<th style="background-color: grey; text-align:center;" >번호</th>
			<th style="background-color: grey; text-align:center;">제목</th>
			<th style="background-color: grey; text-align:center;">작성자</th>
			<th style="background-color: grey; text-align:center;">작성일</th>
		</tr>
	</thead>
	<tbody style="border: 1px solid black;">
		<%
			BbsDao bbsDao = new BbsDao();
			ArrayList<Bbs> list = bbsDao.getList(pageNumber);
			for(int i=0;i<list.size();i++){
		%>		
		<tr >
			<td><%=list.get(i).getBbsID() %></td>
			<td><a href="view.jsp?bbsId=<%=list.get(i).getBbsID() %>">
				<%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll(">","&gt;").replaceAll("<","&lt;").replaceAll("\n","<br>") %></a></td>
			<td><%=list.get(i).getUserID() %></td>
			<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13)+"시"+
			list.get(i).getBbsDate().substring(11, 13)+"분"%></td>
			
		</tr>
		<% 
			}
		%>
		
		
	</tbody>
	</table>
	<div style ="text-align: center;">
		<%
			if(pageNumber != 1){
		%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber-1%>" 
			class="btn btn-success btn-arraw-left;">이전</a>
			<%
			}if(bbsDao.nextPage(pageNumber+1)){
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber+1%>"
			class="btn btn-success btn-arraw-right;">다음</a>
			<%} 
			int pageNum = bbsDao.getNext();
			int pages = (pageNum-1)/10;
			for(int i=1;i<=pages;i++){ %>
				<a href="bbs.jsp?pageNumber=<%=i%>"><%=i %></a>
				
				<% 
			}
			
			%>
		<a href="write.jsp" class="btn btn-primary pull-right" style="margin-right:50px";>글쓰기</a>
		</div>					

	</div>
	<script type="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>