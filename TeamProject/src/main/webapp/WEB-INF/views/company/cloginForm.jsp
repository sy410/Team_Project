<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자회원 로그인</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css" > -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="resources/myLib/jquery-3.6.0.min.js"></script>
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
<!-- Magnigic Popup-->
<link rel="stylesheet" href="resources/vendor/magnific-popup/magnific-popup.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/css/custom.css">
<!-- Favicon : 웹브라우저 주소창에 아이콘 표시-->
<link rel="shortcut icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<!-- 한글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
    <div class="container-fluid px-3">
      <div class="row min-vh-100">
        <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
          <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            <div class="mb-5">
              <h2>사업자회원 로그인</h2>
            </div>
            <form class ="login-form" action="clogin" method="get">
              <div class="mb-4">
                <label class="form-label" for="loginCno"> 사업자번호</label>
                <input class="form-control" name="cno" id="cno" type="text" placeholder="사업자번호" autocomplete="off">
              </div>
              <div class="mb-4">
                <div class="row">
                  <div class="col">
                    <label class="form-label" for="loginCpw"> 비밀번호</label>
                  </div>
                  <div class="col-auto"><a class="form-text x-small text-primary" href="#">비밀번호 찾기</a></div>
                </div>
                <input class="form-control" name="cpw" id="cpw" placeholder="비밀번호" type="password">
              </div>
              <!-- Submit-->
              <div class="d-grid">
        	    <input type="submit" value="로그인" class="btn btn-lg btn-primary" onclick="return comInCheck()">&nbsp;
              </div>
              <hr class="my-4">
              <p class="text-center"><small class="text-muted text-center">아직 계정이 없으신가요? <a href="cjoinf">&nbsp;&nbsp;&nbsp;사업자회원 회원가입</a></small></p>
            </form><a class="close-absolute me-md-5 me-xl-6 pt-5" href="loginf_total"> 
              <svg class="svg-icon w-3rem h-3rem">
                <use xlink:href="#close-1"> </use>
              </svg></a>
          </div>
        </div>
        <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
          <!-- 오른쪽 Image : 교체-->
          <div class="bg-cover h-100 me-n3" style="background-image: url(resources/img/photo/photo-1497436072909-60f360e1d4b1.jpg);"></div>
        </div>
      </div>
    </div>
    
    <!-- JavaScript files-->
    <script>
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      } 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');      
	</script>
	
<!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Magnific Popup - Lightbox for the gallery-->
<script src="resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<!-- Smooth scroll-->
<script src="resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
<!-- Bootstrap Select-->
<script src="resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script src="resources/vendor/object-fit-images/ofi.min.js"></script>
<!-- Swiper Carousel                       -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script>var basePath = ''</script>
<!-- Main Theme JS file    -->
<script src="resources/js/theme.js"></script>
</body>
</html>