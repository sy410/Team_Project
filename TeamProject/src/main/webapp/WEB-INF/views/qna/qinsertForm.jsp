<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA InsertForm</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script>
// 1) 전역변수 정의
// => 스위치 변수들
var pCheck=false;

// 2) 개별컬럼의 무결성 점검
$(function(){
	$('#password').focusout(function() {
		pCheck=pwCheck();
	}); //password_focusout
}); //ready

//3) submit 처리
function inCheck() {
	if (pCheck==false) {
		$('#pMessage').html(' Password 를 입력하세요 ~~');
	}
} //inCheck
</script>
</head>
<body>
<h2 class="n">홈페이지 이름</h2>
<table class="table"><form action="qinsert" method="get">
<tr height="40"><td bgcolor="Silver">Id</td>
		<td><input type="text" name="id" value="${loginID}" readonly></td></tr>
	<tr height="40"><td bgcolor="Silver">Title</td>
		<td><input type="text" name="title"></td></tr>	
	<tr height="40"><td bgcolor="Silver" >Content</td>
		<td><textarea name="content" rows="10" cols="40"></textarea></td>
	</tr>
	<tr height="40"><td bgcolor="Silver">Password</td>
  	  <td><input type="password" name="password" id="password" size="10"><br>
		<span  id="pMessage" class="eMessage"></span></td>
	<tr height="40"><td></td>
		<td><input type="submit" value="전송">&nbsp;&nbsp;
			<input type="reset" value="취소">
		</td>
	</tr>

</form></table>
</body>
</html>