<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// is 객체 생성 : 이진데이터로 받기 위해서
 InputStream is = request.getInputStream();
// 자바 채팅 프로그램 동일 방식 : 인풋 입력을 받을수있는 객체 생성
 BufferedReader br = new BufferedReader(new InputStreamReader(is));
String str = null;

// readLine()으로 내용이 있을때 까지 반복해서 읽어들인다.
while((str=br.readLine())!=null){
	%>
	<%= str %>
	<%
	
}
%>