<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 사업자 회원가입_Step01 **</title>
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
<!-- Magnigic Popup-->
<link rel="stylesheet" href="resources/vendor/magnific-popup/magnific-popup.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/img/favicon.png">
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
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
    	         	<a class="dropdown-item" href="cinfo_main">마이페이지</a>&nbsp;&nbsp;
	   	         	<a class="dropdown-item" href="cinfo_detail">내정보보기</a>&nbsp;&nbsp;
					<a class="dropdown-item" href="cinfo_cinfo">내정보수정</a>&nbsp;&nbsp;
					<a class="dropdown-item" href="clogout">로그아웃</a>&nbsp;&nbsp;
				 </c:if>
		   <!-- 고객별 메뉴 03: 사업자회원 로그인 안 했을경우/ 일반회원 로그인 -> 일반회원만 로그인 
		   			***************** 세영 수정--> 
    	         <c:if test="${loginCno==null && loginID!=null}">
    	         <h6 class="dropdown-header fw-normal">사업자회원 메뉴</h6>
	   	         	<a class="dropdown-item" href="cdetail">내정보보기</a>&nbsp;&nbsp;
    	        	<a class="dropdown-item" href="cdetail?cno=${loginID}&jcode=U">내정보수정</a>&nbsp;&nbsp;
					<a class="dropdown-item" href="cinfo_cinfo">사업자MyInfo</a>&nbsp;&nbsp;
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
      <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5 py-lg-6">
      <div class="container text-center">
        <p class="subtitle text-primary">회원가입완료</p>
        <h1 class="h2 mb-5"> 사업자회원 가입 완료 !!</h1>
        <p class="mb-5"><img class="img-fluid" src="resources/img/illustration/undraw_celebration_0jvk.svg" alt="" style="width: 400px;"></p>
        <p class="text-muted mb-5">감사합니다. 회원가입이 완료되셨습니다.<br> 로그인 후 서비스를 이용하세요.</p>
        <p class="mb-5"><a class="btn btn-outline-muted mb-2" href="cloginf">사업자회원 로그인하기</a></p>
      </div>
    </section>
    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none">
      <!-- Main block - menus, subscribe form-->
      <div class="py-6 bg-gray-200 text-muted"> 
        <div class="container">
          <div class="row">
            <div class="col-lg-4 mb-5 mb-lg-0">
              <div class="fw-bold text-uppercase text-dark mb-3">Directory</div>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
              <ul class="list-inline">
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="twitter"><i class="fab fa-twitter"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="facebook"><i class="fab fa-facebook"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="pinterest"><i class="fab fa-pinterest"></i></a></li>
                <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="vimeo"><i class="fab fa-vimeo"></i></a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Rentals</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="index.html">Rooms</a></li>
                <li><a class="text-muted" href="category-rooms.html">Map on top</a></li>
                <li><a class="text-muted" href="category-2-rooms.html">Side map</a></li>
                <li><a class="text-muted" href="category-3-rooms.html">No map</a></li>
                <li><a class="text-muted" href="detail-rooms.html">Room detail</a></li>
              </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
              <h6 class="text-uppercase text-dark mb-3">Pages</h6>
              <ul class="list-unstyled">
                <li><a class="text-muted" href="compare.html">Comparison                                   </a></li>
                <li><a class="text-muted" href="team.html">Team                                   </a></li>
                <li><a class="text-muted" href="contact.html">Contact                                   </a></li>
              </ul>
            </div>
            <div class="col-lg-4">
              <h6 class="text-uppercase text-dark mb-3">Daily Offers & Discounts</h6>
              <p class="mb-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
              <form action="#" id="newsletter-form">
                <div class="input-group mb-3">
                  <input class="form-control bg-transparent border-dark border-end-0" type="email" placeholder="Your Email Address" aria-label="Your Email Address">
                  <button class="btn btn-outline-dark border-start-0" type="submit"> <i class="fa fa-paper-plane text-lg"></i></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Copyright section of the footer-->
      <div class="py-4 fw-light bg-gray-800 text-gray-300">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
              <p class="text-sm mb-md-0">&copy; 2021, Your company.  All rights reserved.</p>
            </div>
            <div class="col-md-6">
              <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                <li class="list-inline-item"><img class="w-2rem" src="img/visa.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/mastercard.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/paypal.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="img/western-union.svg" alt="..."></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
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