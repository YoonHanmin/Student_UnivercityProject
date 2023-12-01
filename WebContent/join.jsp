<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div class="login-wrapper">
        <h2>회원가입</h2>
        <form method="post" action="joinAction.jsp" id="login-form">
            <input type="text" name="userID" placeholder="아이디">
            <input type="text" name="userName" placeholder="이름">
            <input type="password" name="userPassword" placeholder="비밀번호">
            <input type="radio" name= "userClass" value="1">학생
            <input type="radio" name= "userClass" value="0">교직원
           
            <input type="submit" value="가입하기">
        </form>
    </div>



</body>
</html>