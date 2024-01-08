<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	int pageCount=0;
void addCount(){
	pageCount++;
}
%>

<%
	addCount();
%>
<p>이 사이트 방문횟수 <%= pageCount %> </p>
