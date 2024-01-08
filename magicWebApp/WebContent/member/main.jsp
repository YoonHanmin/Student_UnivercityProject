<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("Member")==null){
		%>
		<jsp:forward page="login.jsp"></jsp:forward>
		<% 
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String userID =null;
	String userName = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	if(session.getAttribute("name")!=null){
		userName = (String)session.getAttribute("name");
	}
		%>
		
<table border="1" style="padding : 0 auto;">	
<form method="post" action = "logOut.jsp">
<tr>	
<td>

<%= session.getAttribute("name") %>
환영합니다!<%=userName %>(<%=userID %>) 님. </td>
</tr>
<tr>
<td>
<input type="submit" value="로그아웃">
<input type="button" onclick="location.href='memberUpdate.jsp'" value="회원정보변경">
</td>
</tr>
</form>
</table>
</body>
</html>