<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>*** Spring Mybatis LoginForm **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script src="resources/myLib/axTest01.js"></script>
<script>
// 1) 전역변수 정의
// => 스위치 변수들
var pCheck=false;

// 2) 개별컬럼의 무결성 점검
$(function(){
	//password : 길이4이상, 영문자,숫자
	$('#password').focusout(function() {
		pCheck=pwCheck();
	}); //password_focusout
}); //ready

//3) submit 처리
//=> Error 있으면: return false
//         없으면: return true -> submit 진행
//=> JS function inCheck() ....
function inCheck() {
	// 개별적 오류 확인 : switch 변수
	if (pCheck==false) {
		$('#pMessage').html(' Password 를 입력하세요 ~~');
	}
	if (pCheck) return true; 
	else return false;
} //inCheck

</script>

</head>
<body>
<h2>*** Spring Mybatis LoginForm **</h2>
<br>
	<tr><td bgcolor="PaleTurquoise ">Password</td>
		<td><input type="password" name="password" id="password"><br>
			<span id="pMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td></td>
		<td><input type="submit" value="확인" onclick="return inCheck()">&nbsp;
			<input type="reset" value="Reset">&nbsp;
		</td>
	</tr>
</form></table>
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
<hr>
<a href="home">HOME</a>
</body>
</html>