<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>account</title>
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
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
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
     <c:if test="${loginID!=null}"> ${loginName}님 안녕하세요.</c:if>
     <div class="collapse navbar-collapse" id="navbarCollapse">
       <ul class="navbar-nav ms-auto">
         <li class="nav-item"><a class="nav-link active" id="home" href="home">Home</a></li>
       	 <li class="nav-item"><a class="nav-link" href="ccontent_main">문화공간 정보보기</a></li>
       	 <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="docsDropdownMenuLink" href="index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              게시판메뉴</a>
           <div class="dropdown-menu dropdown-menu-end" aria-labelledby="docsDropdownMenuLink">
             <h6 class="dropdown-header fw-normal">게시판</h6>
	             	<a class="dropdown-item" href="rlist">후기</a>
    	         	<a class="dropdown-item" href="nlist">공지</a>
    	         	<a class="dropdown-item" href="qlist">QnA</a>
           </div>
         </li>
    	 <!-- 고객별 메뉴 01: 사업자만 로그인 --> 
    	 <c:if test="${loginCno!=null && loginID==null}">
				<li class="nav-item"><a class="nav-link" href="cinfo_main">마이페이지</a></li>
		 </c:if>
		 <!-- 고객별 메뉴 02: 일반회원만 로그인 --> 
    	 <c:if test="${loginCno==null && loginID!=null}">
	   	        <li class="nav-item"><a class="nav-link" href="paccountf">마이페이지</a></li>
		 </c:if>
         <!-- 관리자일때만 메뉴확인가능 -->
		 <c:if test="${loginID == 'admin'}">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="homeDropdownMenuLink" href="home" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   회원목록</a>
                <div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="pcplist">일반회원 목록</a><a class="dropdown-item" href="comlist">사업자회원 목록</a><div class="dropdown-divider"></div><a class="dropdown-item" href="#">예약관리</a></div>
              </li>
         </c:if>
		 <!-- 로그인 전용 사용가능 메뉴 -->
		 <c:if test="${loginID!=null || loginCno!=null}">
	 			<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
         </c:if>
         <!-- 비로그인 사용가능 메뉴-->
         <c:if test="${loginCno==null && loginID==null}">
	       		<li class="nav-item"><a class="nav-link" href="loginf_total">로그인</a></li>
	       		<li class="nav-item"><a class="nav-link" href="joinf_total">회원가입</a></li>
	     </c:if>
       </ul>
     </div>
   </div>
 </nav>
</header>
    <section class="py-5">
      <div class="container">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-start">
          <li class="breadcrumb-item"><a href="home">홈</a></li>
          <li class="breadcrumb-item active">마이페이지</li>
        </ol>
        <h1 class="hero-heading mb-0">마이페이지</h1>
        <p class="text-muted mb-5"></p>
        <div class="row">
          <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#identity-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="pdetail">개인정보</a></h5>
                <p class="text-muted card-text text-sm">개인정보를 관리하세요.</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#pay-by-card-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="#">예약내역</a></h5>
                <p class="text-muted card-text text-sm">예약한 내역을 확인할 수 있습니다.</p>
              </div>
            </div>
          </div>
           <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#chat-app-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="#">문의하기</a></h5>
                <p class="text-muted card-text text-sm">궁금하신 내용에 대해 문의하세요.</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#diary-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="#">내 게시판</a></h5>
                <p class="text-muted card-text text-sm">작성한 게시물을 확인할 수 있습니다.</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#setting-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="pdeletef">회원탈퇴</a></h5>
                <p class="text-muted card-text text-sm">회원탈퇴를 원하시면 버튼을 눌러주세요.</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#mix-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="logout">로그아웃</a></h5>
                <p class="text-muted card-text text-sm">버튼을 누르면 계정이 로그아웃됩니다.</p>
              </div>
            </div>
          </div>
        </div>
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
                <li class="list-inline-item"><img class="w-2rem" src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/visa.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/mastercard.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/paypal.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/western-union.svg" alt="..."></li>
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