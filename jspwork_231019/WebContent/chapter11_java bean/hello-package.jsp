<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- id : 클래스 참조변수 명  scope : 이 페이지에서만 사용-->
<!-- HelloBean 클래스로 myBean 객체 생성 -->
<jsp:useBean class="hello.HelloBean" id="myBean" scope="page"></jsp:useBean>
<hr>
빈 생성후 저장된 값 출력하기<br>
이름 : <%= myBean.getName()  %><br>
나이 : <%= myBean.getAge() %><br>

<hr>
값을 변경하고 값 출력하기<br>
<% myBean.setName("전수빈"); %>
<% myBean.setAge(25); %>
이름 : <%= myBean.getName()  %><br>
나이 : <%= myBean.getAge() %><br>
