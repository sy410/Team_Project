<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ėŽėė Info_main **</title>
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
<!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<!-- Font Awesome CSS-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script>
//** ėŽėėíė ííī
function win_cdelete() {
		alert('ė ë§ëĄ ííīíėęē ėĩëęđ? ííīíëĐī 1ëŽëė ę°ė ëķę°íĐëëĪ.');
		return true;
		alert('íėííīę° ėëĢëėėĩëëĪ. ííīíëĐī 1ëŽëė ę°ė ëķę°íĐëëĪ.');
}
</script>
</head>
<body>
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
       	 <li class="nav-item"><a class="nav-link" href="ccontent_main">ëŽļíęģĩę° ė ëģīëģīęļ°</a></li>
       	 
       	 <c:if test="${loginCno==null && loginID==null}">	
	        <li class="nav-item"><a class="nav-link" href="loginf_total">ëĄę·ļėļ</a></li>
	        <li class="nav-item"><a class="nav-link" href="joinf_total">íėę°ė</a></li>
	     </c:if>
         <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="docsDropdownMenuLink" href="index.html" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              íėëĐëī</a>
          <!-- ęģ ę°ëģ ëĐëī 01: ėŽėėíė/ėžë°íė ëëĪ ëĄę·ļėļ ėíėęē―ė°ė ëģīėīë íëĐī  -->
           <div class="dropdown-menu dropdown-menu-end" aria-labelledby="docsDropdownMenuLink">
             	<c:if test="${loginCno==null && loginID==null}">
             		<h6 class="dropdown-header fw-normal">ëĄę·ļėļ í ėīėĐ ę°ëĨíĐëëĪ.</h6>
	             	<a class="dropdown-item" href="cloginf">ėŽėėíė ëĄę·ļėļ</a>
    	         	<a class="dropdown-item" href="loginf">ėžë°íė ëĄę·ļėļ</a>
    	         </c:if>
    	   <!-- ęģ ę°ëģ ëĐëī 02: ėŽėėíė ëĄę·ļėļ/ ėžë°íė ëĄę·ļėļ ėíėęē―ė° -> ėŽėėë§ ëĄę·ļėļ --> 
    	         <c:if test="${loginCno!=null && loginID==null}">
    	         <h6 class="dropdown-header fw-normal">ėŽėėíė ëĐëī</h6>
    	         	<a class="dropdown-item" href="cinfo_main">ë§ėīíėīė§</a>&nbsp;&nbsp;
	   	         	<a class="dropdown-item" href="cinfo_detail">ëīė ëģīëģīęļ°</a>&nbsp;&nbsp;
					<a class="dropdown-item" href="cinfo_cinfo">ëīė ëģīėė </a>&nbsp;&nbsp;
					<a class="dropdown-item" href="clogout">ëĄę·ļėė</a>&nbsp;&nbsp;
				 </c:if>
		   <!-- ęģ ę°ëģ ëĐëī 03: ėŽėėíė ëĄę·ļėļ ė íėęē―ė°/ ėžë°íė ëĄę·ļėļ -> ėžë°íėë§ ëĄę·ļėļ 
		   			***************** ėļė ėė --> 
    	         <c:if test="${loginCno==null && loginID!=null}">
    	         <h6 class="dropdown-header fw-normal">ėŽėėíė ëĐëī</h6>
	   	         	<a class="dropdown-item" href="cdetail">ëīė ëģīëģīęļ°</a>&nbsp;&nbsp;
    	        	<a class="dropdown-item" href="cdetail?cno=${loginID}&jcode=U">ëīė ëģīėė </a>&nbsp;&nbsp;
					<a class="dropdown-item" href="cinfo_cinfo">ėŽėėMyInfo</a>&nbsp;&nbsp;
					<a class="dropdown-item" href="clogout">ëĄę·ļėė</a>&nbsp;&nbsp;
					<a class="dropdown-item" href="cdelete">íėííī</a>&nbsp;&nbsp;
				 </c:if>
           </div>
         </li>
          <!-- ėė―ëķëķ ėķę°í ęą°ėėžëĐī ėķę° 
		   			***************** ė ëŊž ėė -->
         <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="rmainf">ėė―íęļ°</a></li>
       </ul>
     </div>
   </div>
 </nav>
</header>
      <section class="py-5">
      <div class="container">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-start">
          <li class="breadcrumb-item"><a href="home">í</a></li>
          <li class="breadcrumb-item active">ë§ėīíėīė§   </li>
        </ol>
        <h1 class="hero-heading mb-0">ë§ėīíėīė§</h1>
        <p class="text-muted mb-5">ë§ėīíėīė§ëĨž íĩíī ëī ė ëģīëĨž ęīëĶŽíėļė.</p>
        <div class="row">
          <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#identity-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="cinfo_detail">ė ëģī ëģīęļ°</a></h5>
                <p class="text-muted card-text text-sm">ęģ ę°ėęē ëģīėŽė§ë ëīė ëģīëĨž íėļíėļė</p>
              </div>
            </div>
          </div>
          <div class="col-6 col-md-4 mb-30px">
            <div class="card h-100 border-0 shadow hover-animate">
              <div class="card-body">
                <div class="icon-rounded bg-secondary-light mb-3">
                  <svg class="svg-icon text-secondary w-2rem h-2rem">
                    <use xlink:href="#password-1"> </use>
                  </svg>
                </div>
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="cinfo_cinfo">ė ëģī ėė </a></h5>
                <p class="text-muted card-text text-sm">ëģęē―ë ė ëģīëĨž ėė íėļė</p>
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
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="#">ėė―ëīė­</a></h5>
                <p class="text-muted card-text text-sm">ėė―ëīė­ė íėļ í  ė ėėĩëëĪ.</p>
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
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="#">ëŽļėíęļ°</a></h5>
                <p class="text-muted card-text text-sm">ęķęļíė  ëīėĐė ëíī ëŽļėíėļė.</p>
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
                <h5 class="card-title mb-3">
                <a class="text-decoration-none text-dark stretched-link" onclick="win_cdelete()" href="cdelete">íė ííīíęļ°</a></h5>
                <p class="text-muted card-text text-sm">Control connected apps, what you share, and who sees it</p>
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
                <h5 class="card-title mb-3"><a class="text-decoration-none text-dark stretched-link" href="clogout">ëĄę·ļėė</a></h5>
                <p class="text-muted card-text text-sm">ëēížė ëëĨīëĐī ęģė ėī ëĄę·ļėėëĐëëĪ.</p>
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
              <li class="list-inline-item"><img class="w-2rem" src="resources/img/visa.svg" alt="..."></li>
              <li class="list-inline-item"><img class="w-2rem" src="resources/img/mastercard.svg" alt="..."></li>
              <li class="list-inline-item"><img class="w-2rem" src="resources/img/paypal.svg" alt="..."></li>
              <li class="list-inline-item"><img class="w-2rem" src="resources/img/western-union.svg" alt="..."></li>
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