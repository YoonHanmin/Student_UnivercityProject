<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  // 1번 jsp smart upload 방식으로 파일업로드 하기 (로직 문제로 더이상 안씀) 
	// upload.jar를 통한 객체 생성
	SmartUpload upload = new SmartUpload();
	// initialize : 업로드할 파일이 있으면 비움 (초기화)
	upload.initialize(pageContext);
	// 업로드 준비 단계
	upload.upload();
	// last : 업로드할 Files의 갯수
	int last = upload.getFiles().getCount();
	int cnt=0;
	// 업로드 파일의 갯수만큼 반복
	for(int i=0;i<last;i++){
	// 업로드하는 파일 객체	
		File file = upload.getFiles().getFile(i);
	// isMissing : 파일 존재여부 참/거짓 메소드
		if(!file.isMissing()){ // 파일이 존재하면
			//saveAs(경로,파일이름) : 해당 경로에 해당 파일 이름으로 저장한다.
			file.saveAs("/upload/"+file.getFileName());
			
			
			out.print("폼 태그 필드 이름: "+file.getFieldName()+"<br>");
			out.print("파일 이름: "+file.getFileName()+"<br>");
			out.print("파일 크기: "+file.getSize()+"<br>");
			out.print("파일 확장자: "+file.getFileExt()+"<br>");
			out.print("파일 경로:"+file.getFilePathName()+"<br>");
			out.print("<br>============================<br>");
			cnt++;
		}
	}
	out.print("파일"+cnt+" 개를 업로드 했습니다.");
%>
</body>
</html>