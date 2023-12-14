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
 <link rel="stylesheet" href="css/nav.css">
<script type="text/javascript" src="script.js?d"></script>
<style>

</style>

 <link rel="stylesheet" href="css/notice.css">
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
  	<a href="main.jsp"><h3>한국대학교 학사정보시스템</h3></a>
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


  <div id="main">
  <div id="side">
	<div id="user">
  <ul><h3><b><%=userID %>님</b><br> 반갑습니다!</h3>
  		<li><a href="studentinfo.jsp">내 정보 </a></li>
  		<li><a href="changePW.jsp">비밀번호 변경 </a></li>
  		<li><a href="#">내 학과 </a></li>
  		<li><a href="#">등록내역 조회</a></li>
  		<li><a href="#">안내사항</a></li>
  	</ul>
  </div>
  
</div>
			<div id="notice">
  		      <center>
        <table border="1" width="600px" border-collapse="collapse">
        <!-- 		스크립트로 넘기기위해서 form에도 name값을 준다  -->
                <form name="change_form" method="post" action="changePW_pro.jsp">
                <tr rowspan="2">
                
                    <td colspan="4" style="text-align:center;"><h2>비밀번호 변경하기</h2><br>
                  </td>
                    
                </tr>
                
            
            
                <tr height="30px">
                    <td bgcolor="#eee">기존 비밀번호</td>
                    <td width="200px"><input type="password" name="userPassword"></td>
                </tr>
               <tr>
                <td bgcolor="#eee">새로운 비밀번호</td>
                    <td width="200px"><input type="password" name="pw"></td>
                    <td bgcolor="#eee">비밀번호 확인</td>
                    <td width="200px"><input type="password" name="pw_check"></td>
               </tr>
                
                <tr>
                    <td colspan="4" align="center">
                    <input type="button" onclick="pwcheck_ok()"value="비밀번호 변경하기">
           
                    </td>
                    
                </tr>
            </form>
            
            </table>
</center>
   
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