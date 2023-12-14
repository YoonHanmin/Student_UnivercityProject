<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/main.css">
    <title>한국대 학생 정보관리시스템</title>
  </head>
  
  <body>
   <%
  	String userID = null;
   	int userClass = 1;
  if(session.getAttribute("userID")!=null){
	  userID=(String)session.getAttribute("userID");
  
   	UserDao dao = new UserDao();
   	User user = dao.getUser(userID);
   	userClass = user.getUserClass();}
  %>
  
  <div class="header">
  	<a href="main.jsp"><h3>한국대학교 학사정보시스템</h3></a>
  </div>
  
  <div class="container">
        <nav class="navi">
            <ul>
            <%
            	if(userClass==1){
                %> 
                <li><a href="studentinfo.jsp">학적관리</a></li>
                <li><a href="test.jsp">수업관리</a></li>
                <li><a href="#">성적관리</a></li>
                <li><a href="#">등록관리</a></li>
                <li><a href="#">장학관리</a></li>
                <li><a href="notice.jsp">공지사항</a></li>
                <%}else if(userClass==0){ %>
                
                <li><a href="studentInfo">사용자 관리</a></li>
                <li><a href="#">학생 학적관리</a></li>
                <li><a href="#">교수 학적관리</a></li>
                <li><a href="notice.jsp">공지사항</a></li>
                
                <%}%>
                
                
                
                 <% if(userID==null){
                %>
                <li class="login"><a href="login.jsp">로그인</a></li>
                <%
                }else{%>
                
                <li class="login"><a href="logout.jsp">로그아웃</a></li>
            <%}
                 %>
               
            </ul>
        </nav>
    </div>

<%
	if(userID!=null){
%>
  <div class="side">
  	<ul class="side_ul"><h3 class="side_name"><b><%=userID %>님<b><br> 반갑습니다!</h3>
  		<li><a href="studentinfo.jsp">내 정보 </a></li>
  		<li><a href="#">내 학과 </a></li>
  		<li><a href="#">등록내역 조회</a></li>
  		<li><a href="#">안내사항</a></li>
  	</ul>
  </div>
  <%} %>
  <section style="width: 100%; height: 100%;">
  <div>
  	<img src="image/main_banner.jpg" width=900px; height=400px;  style="padding : 100px auto;float :center; margin:70px; margin-left:350px">

  </div>
  
  
  
  
  
  
  
  
  </section>
  
  
  
  
  
	<div>
	<footer style="text-align : center;">
		All right reserve KoreaUniversity		
	</footer>
	
	</div>



</body>
</html>
	
