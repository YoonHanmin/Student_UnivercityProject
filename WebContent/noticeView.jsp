<%@page import="noticebbs.NoticeDao"%>
<%@page import="noticebbs.NoticeBBS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시글 조회</title>
</head>
  <link rel="stylesheet" href="css/nav.css?as">
<body>
<%
  	String userID = null;
  if(session.getAttribute("userID")!=null){
	  userID=(String)session.getAttribute("userID");
  }
  %>
  <div class="header">
  <a href="main.jsp"><h3>한국대학교 학사정보시스템</h3></a>
  </div>
  
  <div class="container">
        <nav class="navi">
            <ul>
                <li><a href="#">학생 정보</a></li>
                <li><a href="#">수강 신청</a></li>
                <li><a href="#">성적 조회</a></li>
                <li><a href="notice.jsp">공지사항</a></li>
                 <% if(userID==null){
                %>
                <li class="login"><a href="login.jsp">로그인</a></li>
                <%
                }else{%>
                
                <li class="login"><a href="logout.jsp">로그아웃</a></li>
            <%} %>
               
            </ul>
        </nav>
    </div>
<div class="side">
  	<ul class="side_ul"><h3 class="side_name">학생정보</h3>
  		<li><a href="#">학적 사항</a></li>
  		<li><a href="#">내 정보 변경</a></li>
  		<li><a href="#">등록내역 조회</a></li>
  		<li><a href="#">안내사항</a></li>
  	</ul>
  
  
  </div>
  
		<%
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		NoticeDao bbsDao = new NoticeDao();
		NoticeBBS bbs = bbsDao.getBBS(bbsID);
		%>
		<section class="noticeView">
		
        <table border="1" class="view">
            <thead>
                <tr>
                <th><%=bbs.getBbsID() %></th>
                <th><%= bbs.getUserID() %></th>
                <th colspan="2"><%= bbs.getBbsDate()%></th>
            </tr>
            <tr>
                <th colspan="4"><%=bbs.getBbsTitle() %></th>
            </tr>
            <tr>
                <td class="content" colspan="4"><%=bbs.getBbsContent() %></th>
            </tr>
            </thead>
        </table>
        	<span style="viewbtn">
        		<a href="notice.jsp">목록</a>
        		
        		<%
        		if(userID!=null&&userID.equals(bbs.getUserID())){
        			
        		
        		%>
        		<a href="noticeDelete.jsp?bbsID=<%=bbs.getBbsID()%>">글 삭제</a>
        		<a href="noticeUpdate.jsp?bbsID=<%=bbs.getBbsID()%>">글 수정</a>
<%
}

%>
        	</span>        
        
 
		</section>
		
		
		
		
</body>
</html>