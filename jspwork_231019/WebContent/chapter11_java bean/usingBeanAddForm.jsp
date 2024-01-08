<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.MemberBean" id="memBean" ></jsp:useBean>

<!-- property="id" : 넘어오는 name="id"값을 받아주고 jsp:setProperty할때 -->
<!-- 자동으로 setter로 저장 -->
<%-- <jsp:setProperty property="id" name="memBean"/> --%>
<!-- property에 *를 입력하면 모든 필드값을 한번에 사용가능  -->
<jsp:setProperty property="*" name="memBean"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
당신이 입력한 정보입니다.
<hr>
아이디 :
<jsp:getProperty property="id" name="memBean"/>
<br> 이름 :
<jsp:getProperty property="name" name="memBean"/>
<br> 회원 구분 :
<%
if(memBean.getMclass()==1){
	out.print("일반회원");
}else {
	out.print("교수님");
}
%>
<br> 전화번호 :
<jsp:getProperty property="phone1" name="memBean"/>-
<jsp:getProperty property="phone2" name="memBean"/>-
<jsp:getProperty property="phone3" name="memBean"/>-


</body>
</html>