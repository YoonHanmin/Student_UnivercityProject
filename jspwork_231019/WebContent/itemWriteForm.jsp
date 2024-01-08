<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>정보 입력 폼</h1>
<table>
<form action="itemWriteResult.jsp" method="post">
	<tr>
	<td>상품명 :</td>
	<td><input type="text" name="name"><br></td>
	</tr>
	<tr>
	<td>가   격 :</td>
	<td><input type="text" name="price"><br></td>
	</tr>
	<tr>
	<td>설   명 :</td> 
	<td><textarea name="description" rows="10" cols="40"></textarea><br></td>
	</tr>
	<tr colspan="2" align="center">
	<input type="submit" value="전송">
	<input type="reset" value="취소">
	</tr>
	

</form> 
</table>
</body>
</html>


