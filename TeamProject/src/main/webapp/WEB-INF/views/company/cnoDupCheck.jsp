<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 사업자번호 중복 확인 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/axCompany.js"></script>
<script>
function cnoOK() {
	opener.$('#cno').val('${newCno}');
	opener.document.getElementById('submit').disabled='';
	opener.document.getElementById('cnoDup').disabled='disabled';
	opener.$('#cno').prop('readonly',true);
	opener.$('#cpw').focus();
	window.close(); 
} //cnoOK
</script>
<style>
	body {
		background: #E6E6FA;
		font-family: 맑은고딕;
	}
	#wrap {
		margin-left: 0;
		text-align: center;
	}
	h3 {
		color: #00008B; 
	}
</style>
</head>
<body>
<div id="wrap">
  <h2>** 사업자번호 중복 확인 **</h2>
  <form action="cnoCheck" method="post">
	UserID :
	<input type="text" id="cno" name="cno">&nbsp;
	<input type="submit" value="중복확인" onclick="return cnoCheck()"><br>
		<span id="cnoMessage" class="eMessage"></span>		
  </form>
  <br><br><hr><br>
  <div id="msgBlock">
  	<c:if test="${cnoUse=='T'}">
  		${newCno} 는 사용 가능 합니다 ~~
  		<input type="button" value="cnoOK" onclick="cnoOK()"> 
  		<!-- 사용자가 입력한 id 를 사용가능하도록 해주고, 현재(this)창은 close -->
  	</c:if>	
  	<c:if test="${cnoUse=='F'}">
  		${newCno} 는 이미 사용중 입니다 ~~<br>
  		다시 입력 하세요 ~~
  		<!-- 부모창(joinForm, opener)에 남아있는 사용자가 입력한 id 를 지워주고,
  		     현재(this)창 의 id 에 포커스를 주고 재입력 유도 
  		     JScript 코드 필요함-->
  		<script>
  			$('#cno').focus();
  			opener.document.getElementById('cno').value='';
  		</script>     
  	</c:if>	
  </div>	
</div>

</body>
</html>