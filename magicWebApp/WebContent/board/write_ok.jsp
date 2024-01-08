<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% //파일 업로드 처리
 	
 	String path = request.getRealPath("upload");
 	int size = 1024*1024*2; // 1024*1024 = 1MB
 	int fileSize = 0;		
 	String file="";
 	String orifile = "";
 	
 	
 // DefaultFileRenamePolicy() : 파일명 넘버링 처리를 해주는 객체
 	MultipartRequest multi = new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
 // 파일명을 가져와 열거형 files에 담는다.	
 	Enumeration files = multi.getFileNames();
 	String str = files.nextElement().toString();
 // file : 넘버링 처리된 파일 명
 	file = multi.getFilesystemName(str);
 	if(file!=null){ // 첨부파일이 있으면
	// orifile : 중복 가능한 실제 파일 명
 		orifile = multi.getOriginalFileName(str);
 		fileSize = file.getBytes().length;
 	}
 %>
    
    <% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 


//	int b_id = Integer.parseInt(request.getParameter("b_id"));
//	board.setB_id(b_id);
// board 객체에 오늘 날짜를 나타내는 커런트타임 메소드를 사용하는 Timestamp 객체 추가
	board.setB_date(new Timestamp(System.currentTimeMillis()));

	// 자바 클래스에서 제공하는 사용자 ip 객체 메소드
	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();
	
	// JSP에서 제공하는 request객체의 IP 메소드
	//board.setB_ip(request.getRemoteAddr());
	board.setB_ip(ip);
	
	
	// MultipartRequest 객체 사용시 board bean 객체 리셋되므로 수동으로 데이터 저장시켜 줘야함
	board.setB_name(multi.getParameter("b_name"));
	board.setB_title(multi.getParameter("b_title"));
	board.setB_content(multi.getParameter("b_content"));
	board.setB_pwd(multi.getParameter("b_pwd"));
	board.setB_id(Integer.parseInt(multi.getParameter("b_id")));
	board.setB_ref(Integer.parseInt(multi.getParameter("b_ref")));
	board.setB_step(Integer.parseInt(multi.getParameter("b_step")));
	board.setB_level(Integer.parseInt(multi.getParameter("b_level")));
	
	
	
	if(file!=null){ // 첨부파일이 있으면
		// orifile : 중복 가능한 실제 파일 명
			board.setB_fname(file);
			board.setB_fsize(fileSize);
			board.setB_rfname(orifile);
	 		
	 	
	 	}
	
	
	BoardDBBean manager =BoardDBBean.getInstance();
	int re = manager.insertBoard(board);
	if(re==1){
		
		%>
		
	<script>
		alert('작성이 완료되었습니다.');
		location.href='list.jsp?id=<%=board.getB_id()%>';
		</script>
		<%
	}else{
		
		out.print("<script>");
		out.print("alert('작성이 실패 하였습니다.');");
		out.print("history.back();");	
		out.print("</script>");
		
	}
	


%>



</body>
</html>