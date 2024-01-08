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

String select = request.getParameter("pageChange");
if(select==null){
	select = "notice.jsp";
}

%>
	<table border="1" width="1000px" height="700px">
		<tr>
		<td colspan="2">
			<jsp:include page="top.jsp"></jsp:include>
		</tr>
		<tr>
		<td width="100px" height="500px">
			<jsp:include page="left.jsp"></jsp:include></td>
			<td>
			<jsp:include page="<%= select %>"></jsp:include></td>
				
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<jsp:include page="bottom.jsp"></jsp:include>
		</td>	
		</tr>
		
	
	</table>
</body>
</html>