<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 사업자 로그인 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css" >
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">
<script src="resources/myLib/jquery-3.6.0.min.js"></script>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/axCompany.js"></script>
<script>
// * 로그인을 위한 무결성체크 
var cnoFCheck=false;
var cpwFCheck=false;
var cnmFCheck=false;

$(function(){
	$('#cno').focus();
	$('#cno').focusout(function(){
		cnoFCheck=cnoCheck();		
	}); //cnoCheck
	$('#cpw').focus();
	$('#cpw').focusout(function(){
		cpwFCheck=cpwCheck();		
	});	//cpwCheck
	$('#cname').focus();
	$('#cname').focusout(function(){
		cnmFCheck=cnmCheck();		
	});	//cnmCheck
})//ready

function comInCheck() {
	if(cnoFCheck==false){
		$('#cnoMessage').html('사업자 번호를 입력하세요');
	}
	if(cpwFCheck==false){
		$('#cpwMessage').html('비밀번호를 입력하세요');
	}
	if (cnoFCheck && cpwFCheck) return true;
	else return false;
}//cnoIncheck
</script>
</head>
<body>
<div class ="login-form">
	<h4>** 사업자 로그인 **</h4><br>
	<form action="clogin" method="get">
		<input type="text" name="cno" id="cno" class="text-field" placeholder="사업자번호"><br>
		<span id="cnoMessage" class="eMessage"></span><br>
		<input type="password" name="cpw" id="cpw" class="text-field" placeholder="비밀번호"><br>
		<span id="cpwMessage" class="eMessage"></span><br>
		<input type="submit" value="로그인" class="submit-btn" onclick="return comInCheck()">&nbsp;
		<input type="reset" value="취소" class="submit-btn">&nbsp;
	</form>
	<c:if test="${message != null}">
		<br>${message}<br><br>	
	</c:if>
</div>

<%-- <div class ="login-form"> 
<h2>** 사업자 로그인 **</h2>
<br>
<table><form action="clogin" method="get">
	<tr><td bgcolor="YellowGreen">사업자번호</td>
		<td><input type="text" name="cno" id="cno"><br>
			<span id="cnoMessage" class="eMessage"></span></td>
	</tr>
	<tr><td bgcolor="YellowGreen">비밀번호</td>
		<td><input type="password" name="cpw" id="cpw"><br>
			<span id="cpwMessage" class="eMessage"></span></td>
	</tr>
	<tr height="50"><td></td>
		<td><input type="submit" value="로그인" class="submit-btn" onclick="return comInCheck()">&nbsp;
			<input type="reset" value="취소">&nbsp;
		</td>
	</tr>
</form></table>
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
<hr>
<a href="home">HOME</a>
 --%>
</body>
</html>