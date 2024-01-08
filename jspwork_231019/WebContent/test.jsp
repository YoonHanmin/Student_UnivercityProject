<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 쿼리스트링을 이용하여 "test.jsp?str="에서
	str값을 get방식으로 받아와 출력
	"공지사항","게시판"은 한글이므로 쿼리스트링으로 보낼때
	URLEncoder객체를 통해 UTF-8로 인코딩 처리     -->
<%	request.setCharacterEncoding("UTF-8");	
	String str=null;
	if(request.getParameter("str")!=null){
//  str에 request객체를 통해 쿼리스트링으로 받아온 값을 할당	
	str = request.getParameter("str");}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body { display: flex; flex-direction: column; align-items: center;}
header{ width: 800px; height: 100px; border: 1px solid black;}
header a{ padding: 0 auto;}
.main1{ display: flex; }
nav{ border: 1px solid black; width: 150px; height: 500px; background-color: #eee; }
nav ul{ list-style:none; margin: 30px; }
main { width : 650px; height: 500px; border: 1px solid black; text-align:justify }
footer{ width: 800px; height: 50px;  border: 1px solid black; text-align: center; }
</style>
<body>
    <header> <!-- "공지사항","게시판"은 한글로 인코딩 오류처리를 위해 URLEncoder객체의 encode메소드를 통해 UTF-8로 인코딩하여 전송 -->
        <a href="test.jsp?str=<%=URLEncoder.encode("공지사항","UTF-8")%>">공지사항</a>|
        <a href="test.jsp?str=<%=URLEncoder.encode("게시판","UTF-8")%>">게시판</a>|
        <a href="test.jsp?str=FAQ">FAQ</a>|
        <a href="test.jsp?str=QNA">QNA</a>
    </header>
    <div class="main1">
	    <nav>
	        <ul>
	            <li><a href="test.jsp?str=JAVA">JAVA</a></li>
	            <li><a href="test.jsp?str=JSP">JSP</a></li>
	           <li><a href="test.jsp?str=Oracle">Oracle</a></li>
	            <li><a href="test.jsp?str=HTML">HTML</a></li>
	            <li><a href="test.jsp?str=CSS">CSS</a></li>
	        </ul>            
	    </nav>
    
	    <main>
	        <p> <!--쿼리스트링으로 받아온 str을 표현식을 통해 출력   -->
	           <%= str %> 입니다.
	        </p>
	    </main>
	</div>

    <footer>
        since 2021
    </footer>
    

</body>
</html>