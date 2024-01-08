<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="hello.HelloBean" id="myBean"></jsp:useBean>
<hr>
빈 생성후 저장된 값 출력하기<br>
이름 : <%= myBean.getName() %>
<!-- property : 가져올 객체의 필드, name : 가져올 객체명  -->
이름 : <jsp:getProperty property="name" name="mybean"/><br>
나이 : <jsp:getProperty property="age" name="mybean"/><br>
<hr>
값 변경한후 값 출력하기 <br>
<%-- <% myBean.setName("전수빈"); %> --%>
<%-- <% myBean.setAge(10); %> --%>
<!-- 액션 태그를 이용해 mybean 객체값 변경 -->
 <jsp:setProperty property="name" name="mybean" value="홍길순"/><br>
 <jsp:setProperty property="age" name="mybean" value="22"/><br>

이름 : <jsp:getProperty property="name" name="mybean"/><br>
나이 : <jsp:getProperty property="age" name="mybean"/><br>