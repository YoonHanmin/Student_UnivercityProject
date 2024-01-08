<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int bid = Integer.parseInt(request.getParameter("id"));
	System.out.println(bid);
	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getFileName(bid);
	String fileName = "";
	String realFileName = "";
	
	
	if(board!=null){ // 첨부파일이 있으면
		fileName = board.getB_fname();
		realFileName = board.getB_rfname();
	
	}
	// 실제 파일이 업로드 되어 있는 경로
	String saveDirectory = application.getRealPath("/upload");
	// File.separator : 디렉토리명과  파일명을 연결하는 구분자(운영체마다 상이할수 있음)
	// fileName는 중복 넘버링 처리된 파일명
	String path = saveDirectory+File.separator+fileName; // ex) /upboad/a1.png 
	// file : 다운로드 대상 파일 
	File file = new File(path);
	long length = file.length();
	// jsp 기본 한글 처리
	realFileName = new String(realFileName.getBytes("ms949"),"8859_1");
	
	// response 객체에 필요한 내용들을 담아서 전송, 
	// octet-stream : 기본 ContntType
	response.setContentType("application/octet-stream");
	response.setContentLength((int)length);
	// Content-Dispostion : 브라우저에 실제 파일명 컨텐츠가 있다고 알린다.
	response.setHeader("Content-Disposition","attachment;filename="+realFileName);
	// 파일 다운로드할때 임시 저장공간을 사용
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	// 빈번하게 사용시, 기존 파일이 남아있을수 있기 때문에 초기화 
	out.clear();
	// 다운로드 준비 완료
	out = pageContext.pushBody();
	// 다운로드로 파일을 내보낼때 사용하는 임시 저장공간
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	int data;
	// bis로 읽어서 bos로 쓰기
	while((data=bis.read())!=-1){
		bos.write(data);
		
	}
	bis.close();
	bos.close();

%>

