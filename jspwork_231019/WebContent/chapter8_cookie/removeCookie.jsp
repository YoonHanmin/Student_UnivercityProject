<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	for(int i=0;i<cookies.length;i++){
		out.print(i+"번째 쿠키"+ cookies[i].getName()+"삭제<br>");
		cookies[i].setMaxAge(0); // 기간을 0으로 주면 삭제된다.
		cookies[i].setPath("/"); 
		response.addCookie(cookies[i]); // addCookie까지 해줘야 한다.
		
	}
%>