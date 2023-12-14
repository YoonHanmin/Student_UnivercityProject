	<%@page import="studentinfo.StudentInfo"%>
<%@page import="studentinfo.StudentDao"%>
<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(session.getAttribute("userID")==null){
	out.println("<script>");
	out.println("alert('로그인 하세요.');");
	out.println("location.href='login.jsp';");
	out.println("</script>");
}else{
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/staff.css?a">
<script type="text/javascript" src="script.js"></script>
<style>

</style>

 <link rel="stylesheet" href="css/notice.css?a">
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
  <div id="head">
<header>
  	<a href="main.jsp">한국대학교 학사정보시스템</a>
  </header>
  </div>
  

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
                
                <li><a href="studentinfo.jsp">사용자 관리</a></li>
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


  <div id="main">
  <div id="side">
	<div id="user">
	
  <ul><h3><b>교직원</b><br>학생 학적관리</h3>
  		<li><a href="absence_staff.jsp">휴학 신청관리</a></li>
  		<li><a href="changePW.jsp">복학 신청관리 </a></li>
  		<li><a href="absenceApply.jsp">등록관리 </a></li>
  		<li><a href="#">등록내역 조회</a></li>
  		<li><a href="#">안내사항</a></li>
  	
  		</ul>
  	
  </div>
  
</div>
			<div id="notice">
  		   
      
</div>
   
</div>


	 <div>
	<footer style="text-align : center;">
		All right reserve KoreaUniversity		
	</footer>
	
	</div>
	


</body>
</html>
<%
}%>