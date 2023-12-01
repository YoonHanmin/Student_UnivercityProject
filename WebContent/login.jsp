<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="css/nav.css?a" rel="stylesheet">

    <title>한국대학교 학생정보 관리 시스템</title>
  </head>
  <style>
 
 	

  .login-wrapper{
  	margin : 0 auto;
    width: 400px;
    height: 400px;
    padding: 40px;
    box-sizing: border-box;
    border: 1px solid #eee;
}

.login-wrapper > h2{
    font-size: 24px;
    color: #9370DB;
    margin-bottom: 20px;
}
#login-form > input{
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
    
}
#login-form > button{
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #232D6E;
    
}
#login-form > input::placeholder{
    color: #D2D2D2;
}
#login-form > input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #232D6E;
    margin-top: 20px;
}
#login-form > button{
    color: #fff;
    font-size: 16px;
    background-color: #232D6E;
    margin-top: 20px;
}
  #login-form > input[type="checkbox"]{
    display: none;
}
#login-form > label{
    color: #999999;
}
#login-form input[type="checkbox"] + label{
    cursor: pointer;
    padding-left: 26px;
    background-image: url("checkbox.png");
    background-repeat: no-repeat;
    background-size: contain;
}
#login-form input[type="checkbox"]:checked + label{
    background-image: url("checkbox-active.png");
    background-repeat: no-repeat;
    background-size: contain;
}
  
  
  
  </style>
  
  
  
  
  
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
    
		
		 <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="loginAction.jsp" id="login-form">
            <input type="text" name="userID" placeholder="아이디">
            <input type="password" name="userPassword" placeholder="비밀번호">
            <label for="remember-check">
                <input type="checkbox" id="remember-check">아이디 저장하기
            </label>
            <input type="submit" value="로그인">
            <button id="login-form" type="button" onclick="location.href='join.jsp'" value="회원가입">
        </form>
    </div>
	<div>
	<footer>
		<p>All right reserve KoreaUniversity</p>
		<p>서울광역시 강남구 역삼동 가로수길 9-3</p>
		
	</footer>
	
	</div>
		
  </body>
</html>