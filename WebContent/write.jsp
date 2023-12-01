<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .form{
        width: 80%;
        height: 30px;
    }
</style>
<body>
    <form method="post" action="writepro.jsp">
		<table  style="text-align: center; border:1px solid black;
	margin-left: auto; margin-right: auto; width:60%; height:200px;">
		<thead>
		<tr>
		<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기
		</th>
		</tr>
		</thead>
	<tbody>
		<tr>
			<td><input type="text" class="form" placeholder="글제목" name="bbsTitle" maxlength="50"></td>
		</tr>
		<tr>
			<td><textarea class="form" placeholder="글내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea>
             <div><input type="submit" value="작성" class="btn " style="float:right; display:inline-block; width: 50px; height: 30px;"></div>
             <div><input type="reset" value="리셋" class="btn " style="float:right; display:inline-block; width: 50px; height: 30px;"></div>
			</textarea></td>
		</tr>
	</tbody>
</table>
	</form>
</body>
</html>