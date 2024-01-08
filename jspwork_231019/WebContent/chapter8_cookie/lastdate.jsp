<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Cookie lastDate=null;
	String msg=""; //화면 출력 메시지
	boolean found = false; // 첫 방문 여부
	String newValue= ""+System.currentTimeMillis(); //현재 시간 정보 값(Long타입이므로 ""더하면 편하게 형변환 됨)
	Cookie[] cookies = request.getCookies();
	
	if(cookies !=null){ //만약 쿠키가 있으면
		System.out.print("@# cookies.length===>"+cookies.length);
		for(int i=0;i<cookies.length;i++){ // 반복하면서 쿠키이름이 lastDateCookie가 있으면 첫방문이 아니다.
			lastDate = cookies[i];
			if(lastDate.getName().equals("lastDateCookie")){ // 첫 방문시 lastDateCookie의 found값을 true로 바꿔줌.
				found=true;
				break;
			}
		}
		
//	if/else 처음/아닐때(lastDate 쿠키 객체에 값이 있음)
//	첫방문이든 아니든 lastDate 쿠키 객체를 만들어 줌	
		if(!found){ // 처음 방문이라면 쿠키를 만들어 준다.
			msg="처음 방문 입니다.";
//			처음 방문일때 lastDateCookie 이름으로 시간정보를 저장
			lastDate =new Cookie("lastDateCookie",newValue);
			lastDate.setMaxAge(365*24*60*60);
			lastDate.setPath("/");
			response.addCookie(lastDate);
		
		
		}else {
			//lastDate 시간 정보를 Long으로 감싸서 가져옴
			long conv = Long.parseLong(lastDate.getValue());
			msg="당신의 마지막 방문 : "+new Date(conv); //Date객체로 현재시간정보를 계산해서 의미있는 시간정보로 출력해준다.
			lastDate.setValue(newValue); //다음에 또 방문할수있으니 새로 시간값 넣어줌
			response.addCookie(lastDate);
			
		}
		
	}
	for(int i=0;i<cookies.length;i++){
		out.print(i+"번째 쿠키의 이름=>"+cookies[i].getName());
		out.print("<br><hr>");
		out.print("쿠키의 설정된 값=>"+cookies[i].getValue());
		out.print("<br><hr>");
	}
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2><%= msg %></h2>
</body>
</html>