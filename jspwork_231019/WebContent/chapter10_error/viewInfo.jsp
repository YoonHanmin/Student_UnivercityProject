<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error02.jsp"%>
<%!
	String s_name;
	int age;

%>

<%
request.setCharacterEncoding("UTF-8");
s_name = request.getParameter("name");
age = Integer.parseInt(request.getParameter("age"));

	
%>
<h3>회원 정보 출력</h3>
당신의 이름은 <%= s_name %> 입니다. <br>
당신의 나이는 <%= age %> 입니다. <br>