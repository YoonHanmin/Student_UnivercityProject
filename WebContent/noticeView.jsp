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
  <link rel="stylesheet" href="css/notice.css">
<body>
<%
  	String userID = null;
  if(session.getAttribute("userID")!=null){
	  userID=(String)session.getAttribute("userID");
  }
  %>
  <div id="head">
  <header>
  <a href="main.jsp"><h3>한국대학교 학사정보시스템</h3></a>
  </header>
  </div>
  
  
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
  
  
  <div id="main">
<div id="side">
   <ul><h3><b><%=userID %>님</b><br> 반갑습니다!</h3>
  		<li><a href="studentinfo.jsp">내 정보 </a></li>
  		<li><a href="#">내 학과 </a></li>
  		<li><a href="#">등록내역 조회</a></li>
  		<li><a href="#">안내사항</a></li>
  	</ul>
  
  
  
  </div>
  
		<%
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		NoticeDao bbsDao = new NoticeDao();
		NoticeBBS bbs = bbsDao.getBBS(bbsID);
		%>
		<div id="notice">
        <table border="1" align="center" width="800px" padding="10px">
           
                <tr>
                <th><%=bbs.getBbsID() %></th>
                <th><%= bbs.getUserID() %></th>
                <th colspan="2"><%= bbs.getBbsDate()%></th>
            </tr>
            <tr>
                <th colspan="4"><%=bbs.getBbsTitle() %></th>
            </tr>
            <tr >
                <td height="500px" class="content" colspan="4" ><%=bbs.getBbsContent() %></th>
            </tr>
          
        	<tr>
        		<td colspan="3"><a href="notice.jsp" align="center;">목록
        		<%
        		if(userID!=null&&userID.equals(bbs.getUserID())){
        		%>
        		<a href="noticeDelete.jsp?bbsID=<%=bbs.getBbsID()%>">글 삭제</a>
        		<a href="noticeUpdate.jsp?bbsID=<%=bbs.getBbsID()%>">글 수정</a>
<%
}

%>
	</td>
        	</tr>
        
        </table>
 </div>
		
		</div>
		
		 <div>
	<footer style="text-align : center;">
		All right reserve KoreaUniversity		
	</footer>
	
	</div>
		
</body>
</html>