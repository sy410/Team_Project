<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ReservationConf **</title>

<!-- 헤더 css -->
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

<link rel="stylesheet" href="resources/resLib/css/vendor.css">
<link rel="stylesheet" href="resources/resLib/css/style.css">
<link rel="stylesheet" href="resources/resLib/css/font-awesome.css">

<!-- 헤더 js -->
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

<script src="resources/resLib/js/vendor.js"></script>
<script src="resources/resLib/js/polyfills.js"></script>
<script src="resources/resLib/js/app.js"></script>
</head>
<body>

<!-- header start -->
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
				 </c:if>
		   <!-- 고객별 메뉴 03: 사업자회원 로그인 안 했을경우/ 일반회원 로그인 -> 일반회원만 로그인 --> 
    	         <c:if test="${loginCno==null && loginID!=null}">
    	         <h6 class="dropdown-header fw-normal">회원 메뉴</h6>
    	        	<a class="dropdown-item" href="paccountf">마이페이지</a>&nbsp;&nbsp;
	   	         	<a class="dropdown-item" href="pdetail">내정보보기</a>&nbsp;&nbsp;
				 </c:if>
           </div>
         </li>
         <!-- 관리자일때만 메뉴확인가능 -->
		 <c:if test="${loginID == 'admin'}">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="homeDropdownMenuLink" href="home" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   회원목록</a>
                <div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="pcplist">일반회원 목록</a><a class="dropdown-item" href="comlist">사업자회원 목록</a><div class="dropdown-divider"></div><a class="dropdown-item" href="#">예약관리</a></div>
              </li>
         </c:if>
		 <!-- 로그인 전용 사용가능 메뉴 -->
		 <c:if test="${loginID!=null || loginCno!=null}">
	 			<li class="nav-item"><a class="nav-link" href="logout">LOGOUT</a></li>
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
<!-- header end -->

<!-- page title start -->
<section class="jumbotron jumbotron-fluid mb-0">
   <div class="container">
      <h1 class="jumbotron-title mb-0">Make A Reservation</h1>
   </div>
</section>
<!-- page title end -->

<!-- page content start -->
<section class="section py-21 flex-grow-1 d-flex">
    <div class="container bg-secondary d-flex justify-content-center align-items-center flex-column py-20">
        <h1 style="font-size: 21px" class="font-weight-normal mb-0">Great, you are booked!</h1>
        <i class="material-icons text-primary fs-13 my-2">done</i>
        <strong class="fs-5 mb-2">${cname}</strong>
        <p class="mb-0">${rpdate}, ${rptime}</p>
        <div class="d-flex flex-wrap flex-md-nowrap align-items-center my-10">
            <div class="price fs-7 text-black">
                <div class="price-value">${rperson}</div>
            </div>
        </div>
        <button class="btn btn-link">Add to my calendar</button>
    </div>
</section>
<!-- page content end -->

</body>
</html>