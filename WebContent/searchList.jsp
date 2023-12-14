<%@page import="user.User"%>
<%@page import="user.UserDao"%>
<%@page import="studentinfo.StudentInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticebbs.NoticeBBS"%>
<%@page import="noticebbs.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>한국대 공지사항</title>
</head>
    <link rel="stylesheet" href="css/notice.css">
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
                <li><a href="studentinfo">학적관리</a></li>
                <li><a href="#">수업관리</a></li>
                <li><a href="#">성적관리</a></li>
                <li><a href="#">등록관리</a></li>
                <li><a href="#">장학관리</a></li>
                <li><a href="notice.jsp">공지사항</a></li>
                <%}else if(userClass==0){ %>
                
                <li><a href="studentinfo">사용자 관리</a></li>
                <li><a href="studentinfo">학생 학적관리</a></li>
                <li><a href="#">교수 학적관리</a></li>
                <li><a href="notice.jsp">공지사항</a></li>
                
                <%} %>
                 <% if(userID==null){
                %>
                <li class="login"><a href="login.jsp">로그인</a></li>
                <%
                }else{%>
                
                <li class="login"><a href="logout.jsp">로그아웃</a></li>
            <%} %>
               
            </ul>
        </nav>
    
    <div id="main">
<div id="side">
	<div id="user">
 <ul><h3><b><%=userID %>님</b><br> 반갑습니다!</h3>
  		<li><a href="studentinfo.jsp">내 정보 </a></li>
  		<li><a href="changePW.jsp">비밀번호 변경 </a></li>
  		<li><a href="#">등록내역 조회</a></li>
  		<li><a href="#">안내사항</a></li>
  	</ul>
  </div>
  
  </div>


  
  <% 
  String field = null;
  String text = null;
  if(request.getParameter("field")!=null){
	   field = request.getParameter("field");
  }
  if(request.getParameter("text")!=null){
	  text = request.getParameter("text");
 }
 
  
  int pageNumber=1;
  
  	if(request.getParameter("pageNumber")!=null){
  		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));}
  %>
  
  
        <div id="notice" >
        <center>
        	<h2>공지 사항</h2>
        
            <table border="1" align="center" width="800px" padding="10px">
                <thead>
                    <tr>
                       <th bgcolor="#eee" width="100px">NO</th>
                        <th bgcolor="#eee" width="350px">제목</th>
                        <th bgcolor="#eee" width="200px">작성자</th>
                        <th bgcolor="#eee" width="150px">게시일자</th>
                    </tr>
                <tbody>
                    <% 
                    
  		NoticeDao noticeDao = new NoticeDao();
                    System.out.println(pageNumber);
  		ArrayList<NoticeBBS> list = noticeDao.noticeSearch(field,text,pageNumber);
 				
                    for(int i=0;i<list.size();i++){ 
                    %> 
                    <tr 
		onmouseover="this.style.backgroundColor='#eeeeef'"
			onmouseout="this.style.backgroundColor='#f7f7f7'">
                       <td><%=list.get(i).getBbsID() %></td>     
                         
                       <td><a href="noticeView.jsp?bbsID=<%=list.get(i).getBbsID()%>">
                       <%=list.get(i).getBbsTitle() %>
                       </a></td>     
                       <td><%= list.get(i).getUserID()%></td>     
                       <td><%= list.get(i).getBbsDate()%></td> 
                    </tr>
                    <tr>
                    <td colspan="4" align="center">
                <% }
 		int pages = (list.size()/10)+1;
            for(int j=1;j<=pages;j++){ 
            %>
			<a href="searchList.jsp?pageNumber=<%=j
			
			%>&field=<%=field %>&text=<%=text%>"><%=j%> </a>                
            <%} %>
           
                <% if(userClass==0){ %>
  
  <button type="button" onclick="location.href='write.jsp'">글작성</buttom>
            
    
    
            <% } %>
                    
                    </td>
                    </tr>
                    <form action="searchList.jsp" method="post">
                    
                    <table>
                    <tr>
						<select name="field">
						<option value="bbsTitle">제목</option>
						<option value="bbsContent">내용</option>
						<option value="UserID">작성자</option>
						</select>                  
						<input type=text name=text>
						<input type="submit" value="찾기"> 
                    </tr>
             
                    
                    </table>
                    </form>

                </tbody>
            
  
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