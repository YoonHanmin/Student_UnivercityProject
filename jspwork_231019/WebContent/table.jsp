<%@page import="java.util.ArrayList"%>
<%@page import="exam.TableDTO"%>
<%@page import="exam.TableDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
TableDAO dao = new TableDAO();
ArrayList<TableDTO> list = dao.getTable(name);
%>

<table border="1">
	<tr>
		<td>컬럼명</td>
		<td>컬럼형식</td>
		<td>컬럼길이</td>
		<td>널값여부</td>
	</tr>
	<%
	for(int i=0;i<list.size();i++){
%> 
			<tr>
			<td><%= list.get(i).getColumn_name() %></td>
			<td><%= list.get(i).getColumn_type() %></td>
			<td><%= list.get(i).getColumn_length() %></td>
			<td><%= list.get(i).getNullable() %></td>
			</tr>
		<%	
		}
 	%>

</table>



</body>
</html>