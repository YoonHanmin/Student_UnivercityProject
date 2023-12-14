	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>
<style>

.join{
  	margin : 0 auto;
    width: 700px;
    height: 550px;
    padding: 40px;
    box-sizing: border-box;
    border: 1px solid #eee;
}

</style>

 <link rel="stylesheet" href="css/nav.css">
</head>
<body>
 <div class="header">
  	<a href="main.jsp"><h3>한국대학교 학사정보시스템</h3></a>
  </div>
  
  <div class="container">
        <nav class="navi">
            <ul>
                <li><a href="studentInfo">내 정보</a></li>
                <li><a href="#">수강 신청</a></li>
                <li><a href="#">성적 조회</a></li>
                <li><a href="notice.jsp">공지사항</a></li>
                
                <li class="login"><a href="login.jsp">로그인</a></li>
               
            </ul>
        </nav>
    </div>

<!--   <div class="side"> -->
<!--   	<ul class="side_ul"><h3 class="side_name">내정보</h3> -->
<!--   		<li><a href="#">학적 사항</a></li> -->
<!--   		<li><a href="#">내 정보 변경</a></li> -->
<!--   		<li><a href="#">등록내역 조회</a></li> -->
<!--   		<li><a href="#">안내사항</a></li> -->
<!--   	</ul> -->
  
  
<!--   </div> -->
  <section>
 <div class="join" >
        
        <table border="1">
        <!-- 		스크립트로 넘기기위해서 form에도 name값을 준다  -->
                <form name="reg_form" method="post" action="joinAction.jsp">
                <tr rowspan="2">
                
                    <td colspan="4" style="text-align:center;"><h2>회원 가입 신청</h2><br>
                    '*'표시항목은 필수 입력 항목입니다.</td>
                    
                </tr>
                
            
            
                <tr height="30px">
                    <td width="200px">User ID</td>
                    <td><input type="text" name="userID" size="10">*</td>
                    <td >학번</td>
                    <td><input type="text" name="userNum" size="10">*</td>
                </tr>
                <tr height="30px">
                    <td width="200px">암	호</td>
                    <td ><input type="password" name="userPassword" size="10">*</td>
                    <td width="200px">암호 확인</td>
                    <td><input type="password" name="pwd_check" size="10">*</td>
                </tr>
                <tr height="30px">
                    <td width="200px">회원 구분</td>
                    <td><input type="radio" name="userClass" value="1" size="20">학생
                    <input type="radio" name="userClass" value="0" size="20">교직원</td>
                    <td width="200px">성별</td>
                    <td><input type="radio" name="gender" value="M" size="20">남자
                    <input type="radio" name="gender" value="F" size="20">여자</td>
                </tr>
                <tr height="30px">
                    <td width="200px">이    름</td>
                    <td ><input type="text" name="userName" size="10">*</td>
                   
                </tr>   
                <tr>
                    <td colspan="4" align="center">
                    <input type="button" value="등록" onclick="check_ok()">
                    <input type="reset" value="다시입력">
                    <input type="button" value="가입안함">
                    </td>
                    
                </tr>
            </form>
            
            </table>

    </div>
</section>
<div>
	<footer>
		<p>All right reserve KoreaUniversity</p>		
	</footer>
	
	</div>

</body>
</html>