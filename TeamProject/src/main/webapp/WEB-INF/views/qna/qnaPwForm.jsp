<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>공지 게시판</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
	<!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/css/style.default.222cad84.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/css/custom.0a822280.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/favicon.png">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
 <script>
//1) 전역변수 정의
var bqCheck = false;

//2) 개별컬럼의 무결성 점검	
$(function(){
	$('#bqpw').focusout(function() {
		bqCheck=bqpwCheck();
	});
}); //ready

// 3) submit 처리
// => Error 있으면 : return false
//	        없으면 : return true -> submit 진행
function qpwCheck() {
	if (bqCheck == false) {
		$('#pwMessage').html('비밀번호를 입력 하세요.');
		return false;
	} else {
		return true;
	}
} //qpwCheck

</script>
<style>
.eMessage { font-size: x-small;
			font-style: italic; }
</style>
</head>
<body>
<div class="container-fluid px-3">     
	<div class="row min-vh-100">
		<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
			<div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
            	<div class="mb-5"><img class="img-fluid mb-3" src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/logo-square.svg" alt="..." style="max-width: 4rem;">
              	<h2>비밀번호</h2>
              	<label>문의내용을 보기 위해서는 비밀번호가 필요합니다.</label>
            </div>
            
<form action="qnapw" method="post" class="form-validate">
   	<div class="mb-4">
		 <label class="form-label" for="bqpw"> 비밀번호 </label>
		 <input type="hidden" name="bqno" id="bqno" value="${bqno}">
	     <input class="form-control" name="bqpw" id="bqpw" type="password" placeholder="비밀번호" required>
    	 <span id="pwMessage" class="eMessage form-label text-danger"></span>
    </div>
	<!-- Submit-->
    <div class="d-grid">
		<button class="btn btn-lg btn-primary" type="submit" onclick="return qpwCheck()">OK</button>
    </div>
</form>
<a class="close-absolute me-md-5 me-xl-6 pt-5" href="qlist"> 
	<svg class="svg-icon w-3rem h-3rem">
      <use xlink:href="#close-1"> </use>
    </svg></a>
   </div>
  </div>
  <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
  	<!-- Image-->
          <div class="bg-cover h-100 me-n3" style="background-image: url(https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/photo/photo-1497436072909-60f360e1d4b1.jpg);"></div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
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
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.69651a96.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="resources/js/demo.36f8799a.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="resources/js/theme.0750373b.js"></script>
  </body>
</html>