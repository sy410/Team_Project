<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체상세정보</title>
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
    <!-- Hero Section-->
    <section class="pt-7 pb-5 d-flex align-items-end dark-overlay bg-cover" style="background-image: url('${Apple.comuploadfile}');">
      <div class="container overlay-content">
        <div class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
          <div class="text-white mb-4 mb-lg-0">
            <div class="badge badge-pill badge-transparent px-3 py-2 mb-4">
            	<c:choose>
					<c:when test="${Apple.ctype=='A'}">맛집</c:when>
					<c:when test="${Apple.ctype=='B'}">도서관</c:when>
					<c:when test="${Apple.ctype=='C'}">카페</c:when>
					<c:when test="${Apple.ctype=='D'}">팝업스토어</c:when>
					<c:when test="${Apple.ctype=='E'}">전시</c:when>
					<c:when test="${Apple.ctype=='F'}">축제</c:when>
					<c:when test="${Apple.ctype=='G'}">선택카테고리 없음</c:when>
				</c:choose></div>
            <h1 class="text-shadow verified">${Apple.cname}</h1>
            <p><i class="fa-map-marker-alt fas me-2"></i>${Apple.caddr}</p>
          </div>
           <!-- 리뷰남길수 있는 링크와 연결 -->
          <div class="calltoactions"><a class="btn btn-primary" href="#leaveReview" onclick="$('#leaveReview').collapse('show')" data-smooth-scroll>Leave a Review</a></div>
        </div>
      </div>
    </section>
    <section class="py-6">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <!-- About Listing-->
            <div class="text-block">
              <h3 class="mb-3">About</h3>
              <p class="text-muted">${Apple.cinfo}</p>
            </div>
            <div class="text-block">
              <!-- Listing Location : 카카오맵으로 이용-->
              <h3 class="mb-4">Location</h3>
              <div class="map-wrapper-300 mb-3">
                <div class="h-100" id="detailMap">${Apple.caddr}</div>
					<script>	//이 스크립트는 BODY 영역에 작성 한다. 
					var mapContainer = document.getElementById('detailMap'), // 지도를 표시할 div 
						mapOption = {
					    	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 //lat : 위도(latitude) , lng [long] : 경도(longitude)
					    	level: 3 // 지도의 확대 레벨
							};    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					var geocoder = new kakao.maps.services.Geocoder();
					var address = '${Apple.caddr}' ;
					var description = '${Apple.cname}' ;
					
					geocoder.addressSearch(address, function(result, status) { 
						if (status === daum.maps.services.Status.OK) { 							
							var coords = new daum.maps.LatLng(result[0].y, result[0].x);  
							var marker = new daum.maps.Marker({ map: map, position: coords }); 
							var infowindow = new daum.maps.InfoWindow({ 
								content: '<div style="width:150px;text-align:center;padding:6px 0;">'+description+'</div>' }); 
							infowindow.open(map, marker); 
							map.setCenter(coords); 
						} // if
						}); // addressSearch
					 </script>
              </div>
            </div>
            <div class="text-block"> 
              <!-- Gallery-->
              <h3 class="mb-4">Gallery</h3>
              <div class="row gallery ms-n1 me-n1">
                <div class="col-lg-6 col-6 px-1 mb-2"><a href="${Apple.comuploadfile}"><img class="img-fluid" src="${Apple.comuploadfile}" alt="..."></a></div>
              </div>
            </div>
            <!-- Amenities-->
            <div class="text-block">
              <h3 class="mb-4">상세정보</h3>
              <ul class="amenities-list list-inline">
                    <li class="list-inline-item mb-3"><div class="d-flex align-items-center"><a class="text-sm text-decoration-none" href="#"><i class="fa fa-credit-card me-3"></i>
                    	<span class="text-muted">입장료&nbsp;:&nbsp;&nbsp;
                    		<c:choose>
								<c:when test="${Apple.cprice==0}">무료</c:when>
								<c:when test="${Apple.cprice!=0}">${Apple.cprice}원</c:when>
							</c:choose></span></a></div></li>
					<br>
                    <li class="list-inline-item mb-3"><div class="d-flex align-items-center"><a class=" text-sm text-decoration-none" href="#"><i class="fa fa-car me-3"></i>
                    	<span class="text-muted">주차　&nbsp;:&nbsp;&nbsp;
                    		<c:choose>
								<c:when test="${Apple.cpark=='Y'}">가능</c:when>
								<c:when test="${Apple.cpark=='N'}">불가능</c:when>
							</c:choose></span></a></div></li>
					<br>
                    <li class="list-inline-item mb-3"><div class="d-flex align-items-center"><a class=" text-sm text-decoration-none" href="#"><i class="fa  fa-calendar  me-3" aria-hidden="true"></i>
                    	<span class="text-muted">휴무일　&nbsp;:&nbsp;&nbsp;${Apple.cdate}</span></a></div></li>
               </ul>
            </div>
            
                        
             <!-- 리뷰게시판이랑 연결 -->
            <div class="text-block">
              <p class="subtitle text-sm text-primary">Reviews    </p>
              <h5 class="mb-4">최근 리뷰 보기 </h5>
               <!-- 리뷰게시판 글쓴이/ 글내용/ 글 날짜 연결 -->
              <div class="d-flex d-block d-sm-flex review">
                <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="resources/img/avatar/avatar-8.jpg" alt="Padmé Amidala"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                <div>
                  <h6 class="mt-2 mb-1">Padmé Amidala</h6>
                  <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                  </div>
                  <p class="text-muted text-sm">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections     </p>
                </div>
              </div>
              <!-- 리뷰 추가 -->
              <div class="py-5">
                <button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview">리뷰 남기기</button>
                <div class="collapse mt-4" id="leaveReview">
                  <h5 class="mb-4">리뷰 작성</h5>
                  <form class="form" id="contact-form" method="get" action="#">
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="mb-4">
                          <label class="form-label" for="name">작성자이름 *</label>
                          <input class="form-control" type="text" name="id" id="id" value="${loginID}" readonly>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="mb-4">
                          <label class="form-label" for="rating">평가해주세요 *</label>
                          <select class="form-select focus-shadow-0" name="rating" id="rating">
                            <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733; (5/5)</option>
                            <option value="4">&#9733;&#9733;&#9733;&#9733;&#9734; (4/5)</option>
                            <option value="3">&#9733;&#9733;&#9733;&#9734;&#9734; (3/5)</option>
                            <option value="2">&#9733;&#9733;&#9734;&#9734;&#9734; (2/5)</option>
                            <option value="1">&#9733;&#9734;&#9734;&#9734;&#9734; (1/5)</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="email">이메일 *</label>
                      <input class="form-control" type="email" name="email" id="email" placeholder="이메일을 입력하세요" required="required">
                    </div>
                    <div class="mb-4">
                      <label class="form-label" for="review">리뷰 작성 *</label>
                      <textarea class="form-control" rows="4" name="review" id="review" placeholder="20자 이상으로 리뷰남겨주세요" required="required"></textarea>
                    </div>
                    <button class="btn btn-primary" type="submit">작성 완료</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="ps-xl-4">
              <!-- 영업시간/ 예약가능시간  -->
              <div class="card border-0 shadow mb-5">
                <div class="card-header bg-gray-100 py-4 border-0">
                  <div class="d-flex align-items-center justify-content-between">
                    <div>
                      <h4 class="mb-0">예약 가능한 시간 </h4>
                      <p class="subtitle text-sm text-primary">&nbsp;예약시간은 변경될 수도 있습니다</p>
                    </div>
                    <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                      <use xlink:href="#wall-clock-1"> </use>
                    </svg>
                  </div>
                </div>
                <div class="card-body">
                  <table class="table text-sm mb-0">
                    <tr>
                      <th class="ps-0">월요일</th>
                      <td class="pe-0 text-end">${Apple.period_s} - ${Apple.period_e}</td>
                    </tr>
                    <tr>
                      <th class="ps-0">화요일</th>
                       <td class="pe-0 text-end">${Apple.period_s} - ${Apple.period_e}</td>
                    </tr>
                    <tr>
                      <th class="ps-0">수요일</th>
                       <td class="pe-0 text-end">${Apple.period_s} - ${Apple.period_e}</td>
                    </tr>
                    <tr>
                      <th class="ps-0">목요일</th>
                       <td class="pe-0 text-end">${Apple.period_s} - ${Apple.period_e}</td>
                    </tr>
                    <tr>
                      <th class="ps-0">금요일</th>
                       <td class="pe-0 text-end">${Apple.period_s} - ${Apple.period_e}</td>
                    </tr>
                    <tr>
                      <th class="ps-0">토요일</th>
                      <td class="pe-0 text-end">휴무일</td>
                    </tr>
                    <tr>
                      <th class="ps-0">일요일</th>
                      <td class="pe-0 text-end">휴무일</td>
                    </tr>
                    <tr>
                      <th class="ps-0 border-0">휴무일</th>
                      <td class="pe-0 text-end border-0">${Apple.cdate}</td>
                    </tr>
                  </table>
                </div>
              </div>
              <!-- Contact-->
              <div class="card border-0 shadow mb-5">
                <div class="card-header bg-gray-100 py-4 border-0">
                  <div class="d-flex align-items-center justify-content-between">
                    <div>
                      <h4 class="mb-0">문의 및 SNS</h4>
                    </div>
                    <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                      <use xlink:href="#fountain-pen-1"> </use>
                    </svg>
                  </div>
                </div>
                <div class="card-body">
                  <ul class="list-unstyled mb-4">
                    <li class="mb-2"> <a class="text-gray-00 text-sm text-decoration-none" href="#"><i class="fa fa-phone me-3"></i><span class="text-muted">${Apple.ctel}</span></a></li>
                    <li class="mb-2"> <a class=" text-sm text-decoration-none" href="${Apple.csite}" target="blank"><i class="fa fa-envelope me-3"></i><span class="text-muted">${Apple.csite}</span></a></li>
                  </ul>
                  <div class="d-grid text-center"><a class="btn btn-outline-primary" href="rmainf?cno=${Apple.cno}&cname=${Apple.cname}"> <i class="far fa-paper-plane me-2"></i>예약하기</a></div>
                </div>
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
          markerPath: 'resources/img/marker.svg',
      })
    </script>
<%-- <table>
	<tr height="40">
		<td bgcolor="Lavender">사업자번호</td><td>${Apple.cno}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">비밀번호</td><td>${Apple.cpw}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">사업자명</td><td>${Apple.cname}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">카테고리</td>
		<td ><c:choose>
			<c:when test="${Apple.ctype=='A'}">
				<option value="A" selected>맛집</option></c:when>
			<c:when test="${Apple.ctype=='B'}">
				<option value="B" selected>도서관</option></c:when>
			<c:when test="${Apple.ctype=='C'}">
				<option value="C" selected>카페</option></c:when>
			<c:when test="${Apple.ctype=='D'}">
				<option value="D" selected>팝업스토어</option></c:when>
			<c:when test="${Apple.ctype=='E'}">
				<option value="E" selected>전시</option></c:when>
			<c:when test="${Apple.ctype=='F'}">
				<option value="F" selected>축제</option></c:when>
			<c:when test="${Apple.ctype=='G'}">
				<option value="G" selected>선택카테고리 없음</option></c:when>
		</c:choose></td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">상세내용</td><td>${Apple.cinfo}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">주소</td><td>${Apple.caddr}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">휴무일</td><td>${Apple.cdate}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">이벤트기간</td><td>${Apple.cdate_s}부터 ${Apple.cdate_e}까지</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">영업시간</td><td>${Apple.period_s} - ${Apple.period_e}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">전화번호</td><td>${Apple.ctel}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">입장료</td>
		<td ><c:choose>
			<c:when test="${Apple.cprice==0}">
				<option value="free">무료</option></c:when>
			<c:when test="${Apple.cprice!=0}">
				<option value="pay">${Apple.cprice}원</option></c:when>
		</c:choose></td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">홈페이지</td><td>${Apple.csite}</td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">주차</td>
		<td ><c:choose>
			<c:when test="${Apple.cpark=='Y'}">
				<option value="Y">가능</option></c:when>
			<c:when test="${Apple.cpark=='N'}">
				<option value="N">불가능</option></c:when>
		</c:choose></td>
	</tr>
	<tr height="40">
		<td bgcolor="Lavender">Image</td>
		<td><img src="${Apple.comuploadfile}" width="200" height="200"></td>
	</tr>
</table>
<hr>
<a href="cdetail?id=${Apple.cno}&jcode=U">내정보수정</a>&nbsp;&nbsp;
<!-- ** 내정보수정
		=> 내정보를 표시하는 폼이 출력 (mdetail) -> 수정후, 수정버튼 -> 수정 서블릿 
-->
<a href="cdelete?id=${Apple.cno}">회원탈퇴</a>
	<!-- 관리자가 삭제하는 경우 id 가 필요함 -->
<hr>
<a href="home">HOME</a> --%>
</body>
</html>