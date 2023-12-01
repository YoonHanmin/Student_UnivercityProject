<%@page import="bbs.BBS"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticebbs.NoticeBBS"%>
<%@page import="noticebbs.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한국대 공지사항</title>
</head>
    <link rel="stylesheet" href="css/nav.css">
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
  int pageNumber=1;
  
  	if(request.getParameter("pageNumber")!=null){
  		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));}
  %>
  
  
  
  <section class="noticeList">
        <div >
            <table class="list" border="1">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>게시일자</th>
                    </tr>
                <tbody>
                    <% 
                    
  		NoticeDao noticeDao = new NoticeDao();
  		ArrayList<NoticeBBS> list = noticeDao.getList(pageNumber);
 	
                    for(int i=0;i<list.size();i++){ 
                    %> 
                    <tr>
                       <td><%=list.get(i).getBbsID() %></td>     
                         
                       <td><a href="noticeView.jsp?bbsID=<%=list.get(i).getBbsID()%>">
                       <%=list.get(i).getBbsTitle() %>
                       </a></td>     
                       <td><%= list.get(i).getUserID()%></td>     
                       <td><%= list.get(i).getBbsDate()%></td> 
                    </tr>
                <% } %>

                </tbody>
    <div class="list_tag">
  <button type="button" onclick="location.href='write.jsp'">글작성</buttom>
            </div>
    
    
            <% 
 		int pages = ((noticeDao.getNext()-1)/10)+1;
            for(int i=1;i<=pages;i++){ 
            %>
			<a href="notice.jsp?pageNumber=<%=i
			
			%>"><%=i%> </a>                
            <%} %>
            <a href="#"></a>
  
            </table>
        </div>
    </section>
  
  
  
  <div>
	<footer>
		<p>All right reserve KoreaUniversity</p>
		<p>서울광역시 강남구 역삼동 가로수길 9-3</p>
	</footer>
	
	</div>
  
  
  
  
  
  

</body>
</html>