<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_id="hong";
	String s_pw="1234";
	String s_name="홍길동";
	
	if(s_id.equals(request.getParameter("id"))&&
			s_pw.equals(request.getParameter("pw"))){

	//	response.sendRedirect("main.jsp");
	//	쿼리 스트링을 이용하여 s_name값을 붙여서 url 주소를 넘길수도 있음.
		//URLEncoder.encode : 변수에 있는 한글 값을 인코딩
		response.sendRedirect("main.jsp?name="+URLEncoder.encode(s_name, "utf-8"));
		// response.sendRedirect("main.jsp?name="+s_name);
	}else{
		response.sendRedirect("login.html");	
	}

%>