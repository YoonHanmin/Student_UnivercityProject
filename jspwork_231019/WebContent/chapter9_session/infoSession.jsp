<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str_id = session.getId(); // session 고유 id를 가져온다.
	// 클라이언트로 마지막 요청보낸 시간을 long형으로 반환(밀리세컨트)
	long last_time = session.getLastAccessedTime();
	// getCreationTime : 세션 만들어진 시간(밀리세컨드)
	long create_time = session.getCreationTime();
	//웹 사이트에 머무른 시간(분): 마지막 요청보낸 시간 - 만들어진 시간
	long time_used = (last_time - create_time) / 60000;
	// 세션 유지시간(기본이 초단위)
	int inactive = session.getMaxInactiveInterval()/60; //분으로 계산
	// 처음 생성된 세션이면 true
	boolean b_new = session.isNew();

%>
[1] 세션 ID 는 [<%= str_id %>]. <br><hr>
[2] 마지막으로 요청을 보낸 시간은 [<%= last_time %>]. <br><hr>
[3] 세션이 만들어진 시간은  [<%= create_time %>]. <br><hr>
[4] 웹사이트에 머무른 시간은  [<%= time_used %>]. <br><hr>
[5] 세션유지 시간  [<%= inactive %>]. <br><hr>
[5] 처음생성된 세션인가?  [<%= b_new %>]. <br><hr>
<%
	if(b_new){
		out.print("네");
	}else{
		out.print("아니오");}
%>

</body>
</html>