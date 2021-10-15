<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>문의 게시판</title>
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
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		// SearchType 이 '---' 면 keyword 클리어
		$('#searchType').change(function() {
			if ($(this).val() == 'n') $('#keyword').val('');
		}); //change

		$('#searchBtn').on("click",function() {
			self.location = "qlist" 
							+ "${pageMaker.makeQuery(1)}"
							+ "&searchType=" 
							+ $('#searchType').val()
							+ '&keyword='
							+ $('#keyword').val()
			}); //on_click
	}) //ready
</script>
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
     <c:if test="${loginID!=null}"> ${loginName}님 안녕하세요</c:if>
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
      <!-- /Navbar --> 
    </header>
    <!-- Hero Section-->
    <section class="py-5 hero py-6 py-lg-7 text-white dark-overlay"><img class="bg-image" src="resources/img/question.png" alt="????" >
      <div class="container overlay-content">
        <!-- Breadcrumbs -->
     	<a href="qlist" class="breadcrumb text-white justify-content-center"><h1 class="hero-heading">QnA</h1></a>
      </div>
    </section>
    <section class="py-5">
      <div class="container">
     	  <div class="d-flex justify-content-between align-items-end mb-4">        
			<div id="searchBar" style="display: inline-block; margin: 0 5px; float: right;"><form class="d-flex">  
			  <select name="searchType" id="searchType" class="selectpicker me-3 mb-3 mb-lg-0" data-style="btn-selectpicker">
				   <option value="n" <c:out value="${pageMaker.cri.searchType==null ? 'selected':''}"/> >---</option>
		           <option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected':''}"/> >Title</option>
		           <option value="w" <c:out value="${pageMaker.cri.searchType=='w' ? 'selected':''}"/> >Writer</option>
		           <option value="tc" <c:out value="${pageMaker.cri.searchType=='tw' ? 'selected':''}"/> >Title & Writer</option>
	           </select>
					<input class="form-control me-2" aria-label="Search" type="search" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
					<button id="searchBtn" class="btn btn-dark">Search</button></form>
		   		</div>
			</div>
		<div class="row">
              <div class="controls">
                <div class="row">
                    <div class="form-group">
                      <table class="table">
                         <tr height="40" bgcolor="White" align="center">
	                         <th width="50">번호</th><th width="300">제목</th><th width="100">작성자</th><th width="100">작성일</th>
                         </tr>
                         <c:forEach var="list" items="${Banana}"><tr height="40">
	                        <td align="center">${list.bqno}</td>
	                        <td>
                           	<!-- 답글 등록후 indent 에 따른 들여쓰기 
		                       	 => 답글인 경우에만 적용  -->
	                        <img src="resources/image/lockopen.png" alt="" height="20" width="20">	
		                    <c:if test="${list.indent>0}">
			                 <c:forEach begin="1" end="${list.indent}">
				              <span>&nbsp;</span>
			                 </c:forEach>
			                 <span style="color:Purple">└</span>
		                    </c:if>
		                    <!-- 로그인 했을때만 글내용을 볼 수 있도록 -->
		                    <c:if test="${loginID!=null || loginCno!=null}">
			                  <a class="a"  href="qdetail?bqno=${list.root}&id=${list.id}">${list.bqtitle}</a>
		                    </c:if>
		                    <c:if test="${loginID==null}">
			                  ${list.bqtitle}
		                    </c:if>
	                        </td>
	                        <td align="center">${list.id}</td>
	                        <td align="center">${list.bqdate}</td>
                            </tr></c:forEach></table><br>
                            <div align="right">
                            <!-- 글쓰기 버튼 -->
		  					<c:if test="${loginID!=null && loginID !='admin'}">
                 					<li class="nav-item mt-3 mt-lg-0 ml-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-outline-primary" href="qinsertf">글쓰기</a></li>
         					</c:if>
          					<c:if test="${loginID == null || loginID!=null && loginID =='admin'}"> 
                 					<li class="nav-item mt-3 mt-lg-0 ml-lg-3 d-lg-none d-xl-inline-block"></li>
          					</c:if>
                     </div>
                  </div>
                </div>
              </div>
    <!-- Pagination : Criteria 적용 -->
    <nav aria-label="Page navigation example">
		<ul class="pagination pagination-template d-flex justify-content-center">
	<!-- 1) First << , Prev < 처리 -->
	<c:if test="${pageMaker.prev && pageMaker.spageNo > 1}">
		<li class="page-item"><a class="page-link" href="qlist${pageMaker.searchQuery(1)}"><<</a></li>
		<li class="page-item"><a class="page-link" href="qlist${pageMaker.searchQuery(pageMaker.spageNo-1)}"><i class="fa fa-angle-left"></i></a></li>
	</c:if>
	
	<!-- 2) sPageNo ~ ePageNo까지, displayPageNo만큼 표시 -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
		<c:if test="${i == pageMaker.cri.currPage}">
			<li class="page-item active"><a class="page-link">${i}</a></li>
		</c:if>
		<c:if test ="${i != pageMaker.cri.currPage }">
			<li class="page-item "><a class="page-link" href ="qlist${pageMaker.searchQuery(i)}">${i}</a></li>
		</c:if>
	</c:forEach>
	
	<!-- 3) Next > , Last >> 처리 -->
	<c:if test="${pageMaker.next && pageMaker.epageNo > 0}">
		<li class="page-item"><a class="page-link" href="qlist${pageMaker.searchQuery(pageMaker.epageNo+1)}"><i class="fa fa-angle-right"></i></a></li>
		<li class="page-item"><a class="page-link" href="qlist${pageMaker.searchQuery(pageMaker.lastPageNo)}">>></a></li>
	</c:if>
       </ul>
      </nav>
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
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
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
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="resources/js/theme.js"></script>
    <!-- Map-->
    <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
    <!-- Available tile layers-->
    <script src="resources/js/map-layers.js"> </script>
    <script src="resources/js/map-detail.js"></script>
    <script>
      createDetailMap({
          mapId: 'detailMap',
          mapCenter: [40.732346, -74.0014247],
          markerShow: true,
          markerPosition: [40.732346, -74.0014247],
          markerPath: 'img/marker.svg',
      })
    </script>
  </body>
</html> 