	<%@page import="studentinfo.StudentInfo"%>
<%@page import="studentinfo.StudentDao"%>
<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/nav.css">
<script type="text/javascript" src="script.js?asd"></script>
<style>

</style>

 <link rel="stylesheet" href="css/nav.css">
</head>
<body>
<%
  	String userID = null;
   	int userClass = 1;
   	int userNum = 0;
  if(session.getAttribute("userID")!=null){
	  userID=(String)session.getAttribute("userID");
  
   	UserDao dao = new UserDao();
   	User user = dao.getUser(userID);
   	userClass = user.getUserClass();
  	userNum = user.getUserNum(); 	
  }
  
  
  
  StudentDao stDao = new StudentDao();
  StudentInfo student = stDao.getStudent(userNum);
  
  
  
  
  
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

  <div class="side">
  	<ul class="side_ul"><h3 class="side_name">학적관리</h3>
  		<li><a href="#">내정보</a></li>
  		<li><a href="#">내 정보 변경</a></li>
  		<li><a href="#">안내사항</a></li>
  	</ul>
  
  
  </div>
  <section>
 <div class="info" >
        
        <table border="1">
        <!-- 		스크립트로 넘기기위해서 form에도 name값을 준다  -->
                <form name="info_form" method="post" action="updateInfo.jsp">
                <tr rowspan="2">
                
                    <td colspan="4" style="text-align:center;"><h2>내 정보</h2><br>
                  </td>
                    
                </tr>
                
            
            
                <tr height="30px">
                    <td width="200px">이름</td>
                   <td width="200px"><%=student.getName() %></td>
                    <td >학번</td>
                   <td width="200px"><%=student.getUserNum() %></td>
                </tr>
<!--                 <tr height="30px"> -->
<!--                     <td width="200px">암	호</td> -->
<!--                     <td ><input type="password" name="userPassword" size="10">*</td> -->
<!--                     <td width="200px">암호 확인</td> -->
<!--                     <td><input type="password" name="pwd_check" size="10">*</td> -->
<!--                 </tr> -->
                <tr height="30px">
                   
                    <td width="200px">성별</td>
                    <td width="200px"><%
                    if(student.getGender().equals("M")){
                    	%>남자
                    	<%
                    }else{
                    	%>여자 
                    	<%
                    }
                    %></td>
                </tr>
                <tr height="30px">
                     <td bgcolor="#eee">소속 학과</td>
                    <td width="200px">
                   <%=student.getDept_id() %>
                    </td>
                    <td bgcolor="#eee">학년</td>
                    <td><%=student.getGrade() %></td>
                </tr>
                <tr height="30px">
                    <td width="200px">전화번호</td>
                    <td><input type="text" name="tel" size="30"></td>
                     <td bgcolor="#eee">입학년도</td>
                    <td width="200px"><%=student.getAdmin_year() %></td>
                    
                </tr>
                <tr height="30px">
                    <td width="200px">주    소</td>
                    <td colspan="3"><input type="text" name="address" size="50"></td>
                </tr>
                <tr height="30px">
                    <td width="200px">이메일</td>
                    <td colspan="3"><input type="text" name="email" size="70"></td>
                </tr>
            
                <tr>
                    <td colspan="4" align="center">
                    <input type="button" value="등록" onclick="infocheck_ok()">
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