<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체상세정보_메인</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
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
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;400;700&display=swap" rel="stylesheet">
<!-- 카카오지도 -->
<script type="text/javascript" 
	    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f5dcbef1cd3952145377eede59582d7&libraries=services">
</script>
<!-- compaging -->
<script>
$(function() {	
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#keyword').val('');
	}); //change
	$('#searchBtn').on("click", function() {
		self.location="bcplist"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&keyword='
			+$('#keyword').val()				
	}); //on_click	
}) //ready
</script>
</head>
 <body style="padding-top: 72px;">
<c:if test="${message != null}">
	<script>
		alert("${message}");
 	</script>	
</c:if>
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
  <section>
     <div class="map-wrapper-450">
       <div class="h-100" id="categoryMap">
	    <script>	//이 스크립트는 BODY 영역에 작성 한다. 
			var mapContainer = document.getElementById('categoryMap'), // 지도를 표시할 div 
				mapOption = {
			    	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 //lat : 위도(latitude) , lng [long] : 경도(longitude)
			    	level: 5 // 지도의 확대 레벨
					};    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var geocoder = new kakao.maps.services.Geocoder();
			var address = '서울특별시' ;
			var description = '' ;
			
			geocoder.addressSearch(address, function(result, status) { 
				if (status === daum.maps.services.Status.OK) { 							
					var coords = new daum.maps.LatLng(result[0].y, result[0].x);  
/* 	표시 지우기			var marker = new daum.maps.Marker({ map: map, position: coords }); 
					var infowindow = new daum.maps.InfoWindow({ 
						content: '<div style="width:150px;text-align:center;padding:6px 0;">'+description+'</div>' }); 
					infowindow.open(map, marker);  */
					map.setCenter(coords); 
				} // if
				}); // addressSearch
		</script>
       </div>
     </div>
   </section>
   <section class="py-5 bg-gray-100 shadow">
     <div class="container">
       <h1>서울특별시</h1><h4 class="text-gray-600">Seoul</h4> 
       <p class="lead mb-5 text-gray-600 fs-5">과거와 현재가 공존하며 하루가 다르게 변하는 서울을 여행하는 일은 매일이 새로운 경험을 선사합니다.<br>도시 한복판에서 600년의 역사를 그대로 안고 있는 아름다운 고궁들과 더불어 대한민국의 트렌드를 이끌어나가는<br>예술과 문화의 크고 작은 동네들을 둘러볼 수 있는 서울은 도시 여행에 최적화된 장소입니다.</p>
       <ul class="nav nav-pills-custom">
         <li class="nav-item"><a class="nav-link" href="#">종로구</a></li>
         <li class="nav-item"><a class="nav-link" href="#">동대문구</a></li>
         <li class="nav-item"><a class="nav-link" href="#">용산구</a></li>
         <li class="nav-item"><a class="nav-link" href="#">강남구${test.totalRowCount}</a></li>
       </ul>
     </div>
   </section>
   <section class="py-5">
     <div class="container">
       <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
         <div class="me-3">
           <p class="mb-3 mb-md-0"><strong> <!-- 전체글 개수 ${pageMaker.TotalRowCount}-->${test.totalRowCount}</strong> results found ${fn:substring(list.addr,0,2)}</p>
         </div>
<!--          <div>
           <label class="form-label me-2" for="form_sort">Sort by</label>
           <select class="selectpicker" name="sort" id="form_sort" data-style="btn-selectpicker" title="">
             <option value="sortBy_0">Most popular   </option>
             <option value="sortBy_1">Recommended   </option>
             <option value="sortBy_2">Newest   </option>
             <option value="sortBy_3">Oldest   </option>
             <option value="sortBy_4">Closest   </option>
           </select>
         </div> -->
       </div>
       <div class="row">
        <c:forEach var="list" items="${Banana}">
<%--           <c:if test=${fn:substring(list.addr,0,2) eq '서울'}> --%>       
         <!-- 업체당 미리보기-->
         <div class="col-sm-6 col-lg-4 mb-5 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
           <div class="card h-100 border-0 shadow">
             <div class="card-img-top overflow-hidden dark-overlay bg-cover" style="background-image: url('${list.comuploadfile}'); min-height: 200px;">
             		<a class="tile-link" href="cdetail01?cno=${list.cno}&cname=${list.cname}"></a>
               <div class="card-img-overlay-bottom z-index-20">
                 <h4 class="text-white text-shadow">${list.cname}</h4>
               </div>
               <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                 <div class="badge badge-transparent badge-pill px-3 py-2">
						<c:choose>
							<c:when test="${list.ctype=='A'}">맛집</c:when>
							<c:when test="${list.ctype=='B'}">도서관</c:when>
							<c:when test="${list.ctype=='C'}">카페</c:when>
							<c:when test="${list.ctype=='D'}">팝업스토어</c:when>
							<c:when test="${list.ctype=='E'}">전시</c:when>
							<c:when test="${list.ctype=='F'}">축제</c:when>
							<c:when test="${list.ctype=='G'}">선택카테고리 없음</c:when>
						</c:choose></div>
                 <a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                   <svg class="svg-icon text-white">
                     <use xlink:href="#heart-1"> </use>
                   </svg></a>
               </div>
             </div>
             <div class="card-body">
               <p class="text-sm text-muted mb-3">${list.cinfo}</p>
               <p class="text-sm mb-0"><a class="me-1" href="#">
              			<c:choose>
						<c:when test="${list.ctype=='A'}">맛집</c:when>
						<c:when test="${list.ctype=='B'}">도서관</c:when>
						<c:when test="${list.ctype=='C'}">카페</c:when>
						<c:when test="${list.ctype=='D'}">팝업스토어</c:when>
						<c:when test="${list.ctype=='E'}">전시</c:when>
						<c:when test="${list.ctype=='F'}">축제</c:when>
						<c:when test="${list.ctype=='G'}">선택카테고리 없음</c:when>
					</c:choose>,</a>
					<a class="me-1" href="#">${list.caddr}</a>
               </p>
             </div>
           </div>
         </div>
<%--          </c:if> --%>
	     </c:forEach>
	     </div>
       <!-- Paging : 업체정보 미리보기 ********수정해야함 -->
        <nav aria-label="Page navigation example">
        <ul class="pagination pagination-template d-flex justify-content-center">
        	<li class="page-item">
          		<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
					<a class="page-link" href="compaging${pageMaker.makeQuery(1)}">FF</a>&nbsp;
					<a href="compaging${pageMaker.makeQuery(pageMaker.spageNo-1)}">Prev</a>
				</c:if>
				
				<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
				<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
					<c:if test="${i==pageMaker.cri.currPage}">
						<font size="5" color="Orange">${i}</font>&nbsp;
					</c:if>
					<c:if test="${i!=pageMaker.cri.currPage}">
						<a href="compaging${pageMaker.makeQuery(i)}">${i}</a>&nbsp;
					</c:if>
				</c:forEach> 
				<!-- 3) Next >  ,  Last >>  처리 -->
				<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
					<a href="compaging${pageMaker.makeQuery(pageMaker.epageNo+1)}">Next</a>&nbsp;
					<a href="compaging${pageMaker.makeQuery(pageMaker.lastPageNo)}">LL</a>&nbsp;&nbsp;
				</c:if>
				
				
			<!-- 
			         <ul class="pagination pagination-template d-flex justify-content-center">
            <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-left"></i></a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#"> <i class="fa fa-angle-right"></i></a></li>
          </ul> -->
          </ul>
        </nav>
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
   <!-- Map-->
   <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
   <!-- Available tile layers-->
   <script src="resources/js/map-layers.js"> </script>
   <script src="resources/js/map-category.js">                               </script>
   <script>
     createListingsMap({
         mapId: 'categoryMap',
         jsonFile: 'js/restaurants-geojson.json',
         //tileLayer: tileLayers[5] - uncomment for a different map styling
     }); 
   </script>
 </body>
</html>