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
 <link rel="stylesheet" href="css/nav.css?a">
<script type="text/javascript" src="script.js?aa"></script>
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
                <form name="reg_form" method="post" action="absenceAction.jsp">
                <tr rowspan="2">
                
                    <td colspan="4" style="text-align:center;"><h2>휴학 신청</h2><br>
                  </td>
                    
                </tr>
                
            
            
                <tr height="30px">
                    <td bgcolor="#eee">이름</td>
                    <td width="200px"><%=student.getName() %></td>
                    <td bgcolor="#eee">학번</td>
                    <td width="200px"><%=student.getUserNum() %></td>
                </tr>
               
                <tr height="30px">
                    <td bgcolor="#eee">소속 학과</td>
                    <td width="200px">
                   <%=student.getDept_name() %>
                    </td>
                    <td bgcolor="#eee">학년</td>
                    <td><%=student.getGrade() %></td>
                   
                </tr>
                <tr height="30px">
                    <td bgcolor="#eee">성별</td>
                    <td width="200px"><%
                    if(student.getGender().equals("M")){
                    	%>남자
                    	<%
                    }else{
                    	%>여자 
                    	<%
                    }
                    %></td>
                    <td bgcolor="#eee">생일</td>
                    <td width="200px"><%=student.getBirth() %></td>
                </tr>
                <tr height="30px">
                    <td bgcolor="#eee">전화번호</td>
                    <td width="200px"><%=student.getTel() %></td>
                    <td bgcolor="#eee">입학년도</td>
                    <td width="200px"><%=student.getAdmin_year() %></td>
                </tr>
                <tr>
                	<td bgcolor="#eee">학적상태</td>
                    <td width="200px">
                    <%if(student.getStatus()==0){
                    	%> 휴학
                   <% }else if(student.getStatus()==1){
                   %>
                    	재학
                    	  <% }else if(student.getStatus()==2){
                   %>졸업
                   <%} %></td>
                    <td bgcolor="#eee">등록여부</td>
                    <td width="200px">
                      <%if(student.getRegisted()==1){
                    	%> 등록
                   <% }else{
                   %>
                    	미등록
                    	<%} %>
                    </td>
                </tr>
                <tr height="30px">
                    <td bgcolor="#eee">주    소</td>
                    <td colspan="3"><%=student.getAddress() %></td>
                </tr>
                <tr height="30px">
                    <td bgcolor="#eee">이메일</td>
                    <td colspan="3"><%=student.getEmail()%></td>
                </tr>
				<tr height="70px">
                    <td bgcolor="#eee">구 분</td>
                    <td colspan="3">
						<input type="radio" value="normal" name="absence">일반휴학
						<input type="radio" value="millitury" name="absence">군휴학
						


					</td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                    <input type="button" value="휴학 신청하기" onclick="absence_ok()">
           
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