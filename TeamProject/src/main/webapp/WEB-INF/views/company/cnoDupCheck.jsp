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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Price Slider Stylesheets -->
<link rel="stylesheet" href="resources/vendor/nouislider/nouislider.css">
<!-- Google fonts - Playfair Display-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
<!-- Google fonts - Poppins-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
<!-- swiper-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/css/custom.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function cnoOK() {
	opener.$('#cno').val('${newCno}');
	opener.document.getElementById('submit').disabled='';
	opener.document.getElementById('cnoDup').disabled='disabled';
	opener.$('#cno').prop('readonly',true);
	window.close();
} //cnoOK
</script>
</head>
<body style="padding-top: 24px; text-align: center;">
	<div class="col-md-10 mx-auto col-lg-5 p-4 p-md-5 border rounded-3 bg-light" id="wrap">
	  <form action="cnoCheck" method="post">
	  	<h6>사업자번호 중복 확인</h6>
	    <div class="form-floating mb-3">
	      <input type="text" id="cno" name="cno" class="form-control" placeholder="하이픈(-)없이 숫자 10자리 입력">
	      <label for="floatingInput">사용 할 사업자번호 입력</label>
	    </div>
	    <span id="cnoMessage" class="eMessage"></span><br>
	    <input type="submit" class="w-80 btn btn-md btn-primary" value="중복확인" onclick="return cnoCheck()" >
	  </form>
	  <hr class="my-4">
      <div id="msgBlock">
	  	<c:if test="${cnoUse=='T'}">
	  		${newCno} 는 사용 가능한 사업자번호입니다.<br>
	  		<input type="button" class="w-80 btn btn-md btn-secondary" value="사용하기" onclick="cnoOK()"> 
	  	</c:if>	
	  	<c:if test="${cnoUse=='F'}">
	  		${newCno} 는 이미 사용중인 사업자번호입니다.<br>
	  		다시 입력 하세요.
	  		<script>
	  			$('#cno').focus();
	  			opener.document.getElementById('cno').value='';
	  		</script>     
	  	</c:if>	
	  </div>	    
	</div>
</body>
</html>