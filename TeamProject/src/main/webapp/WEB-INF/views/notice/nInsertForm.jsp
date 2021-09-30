<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Notice Insert Form **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2 class="n" align="center">홈페이지 이름</h2>
<table class="table"><form action="ninsert" method="get">
<tr height="40"><td bgcolor="Silver" align="center">Id</td>
		<td><input type="text" name="id" value="${loginID}" readonly></td></tr>
	<tr height="40"><td bgcolor="Silver" align="center">Title</td>
		<td><input type="text" name="title"></td></tr>	
	<tr height="40"><td bgcolor="Silver" align="center">Content</td>
		<td><textarea name="content" rows="10" cols="40"></textarea></td>
	</tr>
	<tr height="40"><td></td>
		<td align="center"><input type="submit" value="전송">&nbsp;&nbsp;
			<input type="reset" value="취소">
		</td>
	</tr>

</form></table>
</body>
</html>