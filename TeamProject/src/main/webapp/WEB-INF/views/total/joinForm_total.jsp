<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="resources/myLib/jquery-3.6.0.min.js"></script>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
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
<!-- Favicon-->
<link rel="shortcut icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<!-- 한글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body style="padding-top: 72px;">
	<header class="header">
	 <!-- Navbar-->
	 <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
	   <div class="container-fluid">
	     <div class="d-flex align-items-center"><a class="navbar-brand py-1" href="home">  
	     <img src="resources/image/logo.svg" alt="Logo"></a></div>
	               
	     <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
	     <!-- Navbar Collapse -->
	     <div class="collapse navbar-collapse" id="navbarCollapse">
	       <ul class="navbar-nav ms-auto">
	         <li class="nav-item"><a class="nav-link active" id="home" href="home">Home</a>
	         </li>
	         <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="homeDropdownMenuLink" href="home" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	           COMMUNITY</a>
	       		<div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="aboard">Notice</a><a class="dropdown-item" href="aboard">Q&A</a><a class="dropdown-item" href="aboard">Review <span class="badge badge-info-light ms-1 mt-n1">New</span></a></div>
	       	 </li>
	       	 <li class="nav-item"><a class="nav-link" href="ccontent_main">문화공간 정보보기</a></li>
	       	 
	       	 <c:if test="${loginCno==null && loginID==null}">	
		        <li class="nav-item"><a class="nav-link" href="loginf_total">로그인</a></li>
		        <li class="nav-item"><a class="nav-link" href="joinf_total">회원가입</a></li>
		     </c:if>
	         <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="docsDropdownMenuLink" href="index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	              회원메뉴</a>
	          <!-- 고객별 메뉴 01: 사업자회원/일반회원 둘다 로그인 안했을경우에 보이는 화면  -->
	           <div class="dropdown-menu dropdown-menu-end" aria-labelledby="docsDropdownMenuLink">
	             	<c:if test="${loginCno==null && loginID==null}">
	             		<h6 class="dropdown-header fw-normal">로그인 후 이용 가능합니다.</h6>
		             	<a class="dropdown-item" href="cloginf">사업자회원 로그인</a>
	    	         	<a class="dropdown-item" href="loginf">일반회원 로그인</a>
	    	         </c:if>
	    	   <!-- 고객별 메뉴 02: 사업자회원 로그인/ 일반회원 로그인 안했을경우 -> 사업자만 로그인 --> 
	    	         <c:if test="${loginCno!=null && loginID==null}">
	    	         <h6 class="dropdown-header fw-normal">사업자회원 메뉴</h6>
		   	         	<a class="dropdown-item" href="cdetail">내정보보기</a>&nbsp;&nbsp;
	    	        	<a class="dropdown-item" href="cdetail?cno=${loginCno}&jcode=U">내정보수정</a>&nbsp;&nbsp;
						<a class="dropdown-item" href="cinfo_main">사업자MyInfo</a>&nbsp;&nbsp;
						<a class="dropdown-item" href="clogout">로그아웃</a>&nbsp;&nbsp;
						<a class="dropdown-item" href="cdelete">회원탈퇴</a>&nbsp;&nbsp;
					 </c:if>
			   <!-- 고객별 메뉴 03: 사업자회원 로그인 안 했을경우/ 일반회원 로그인 -> 일반회원만 로그인 
			   			***************** 세영 수정--> 
	    	         <c:if test="${loginCno==null && loginID!=null}">
	    	         <h6 class="dropdown-header fw-normal">사업자회원 메뉴</h6>
		   	         	<a class="dropdown-item" href="cdetail">내정보보기</a>&nbsp;&nbsp;
	    	        	<a class="dropdown-item" href="cdetail?cno=${loginID}&jcode=U">내정보수정</a>&nbsp;&nbsp;
						<a class="dropdown-item" href="cinfo_main">사업자MyInfo</a>&nbsp;&nbsp;
						<a class="dropdown-item" href="clogout">로그아웃</a>&nbsp;&nbsp;
						<a class="dropdown-item" href="cdelete">회원탈퇴</a>&nbsp;&nbsp;
					 </c:if>
	           </div>
	         </li>
	          <!-- 예약부분 추가할거있으면 추가 
			   			***************** 선민 수정-->
	         <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="rmainf">예약하기</a></li>
	       </ul>
	     </div>
	   </div>
	 </nav>
	</header>
    <div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
      <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <div class="container my-5" style="background-color: #FFFFFF;" >
    <div class="row p-5 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg text-center">
      <div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
        <h2 class="display-4 fw-bold lh-1">회원가입</h2>
        <p class="lead"><br>지금 회원 가입하신 후 문화플랫폼의 다양한 서비스를 만나보세요.</p><br>
        <div class="d-grid gap-2 d-md-flex justify-content-sm-center mb-4 mb-lg-3">
          <a type="button" class="btn btn-outline-primary btn-lg px-4 me-md-2 fw-bold" href="joinf">일반회원가입</a>
          <a  type="button" class="btn btn-outline-secondary btn-lg px-4" href="cjoinf" >사업자회원가입</a>
        </div>
      </div>
      <div class="col-lg-4 offset-lg-1 p-0 overflow-hidden ms-auto">
      	  <img class="img-fluid" src="resources/img/illustration/undraw_High_five_re_jy71.svg" alt="" width="360">
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
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
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