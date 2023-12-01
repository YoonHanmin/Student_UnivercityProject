<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/nav.css?a12">
    <title>한국대 학생 정보관리시스템</title>
  </head>
  
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
                <li><a href="studentInfo">학생 정보</a></li>
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
  
	<div>
	<footer>
		<p>All right reserve KoreaUniversity</p>
		<p>서울광역시 강남구 역삼동 가로수길 9-3</p>
		
	</footer>
	
	</div>



</body>
</html>
	
