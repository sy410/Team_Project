<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 사업자 Info **</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="resources/myLib/jquery-3.6.0.min.js"></script>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<!--  <script>
function setClock() {
	var now = new Date();
	var t = "* Now : "
		+now.getFullYear()+"년"+(now.getMonth()+1)+"월"+now.getDate()+"일_"
		+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds() ;
	document.getElementById("clock").innerHTML=t;	
}
</script> -->
<script>
function updateDone() {
	alert('회원정보가 정상적으로 수정되었습니다.');
}
</script>
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
    <section class="py-5">
      <div class="container">
        <!-- Breadcrumbs -->
        <ol class="breadcrumb ps-0  justify-content-start">
          <li class="breadcrumb-item"><a href="home">홈</a></li>
          <li class="breadcrumb-item"><a href="cinfo_main">계정</a></li>
          <li class="breadcrumb-item active">사업자회원 정보수정  </li>
        </ol>
        <h1 class="hero-heading mb-0">사업자회원 정보수정</h1>
        <p class="text-muted mb-5"><strong>[정보 수정하기] </strong> 버튼을 눌러 수정하세요.</p>
        <div class="row">
          <div class="col-lg-7 mb-5 mb-lg-0">
            <div class="text-block"> 
              <div class="row mb-3">
                <div class="col-sm-9">
                  <h5>사업자회원 정보</h5>
                </div>
                <div class="col-sm-3 text-end">
                  <button class="btn btn-link ps-0 text-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#personalDetails" aria-expanded="false" aria-controls="personalDetails">정보 수정하기</button>
                </div>
              </div>
              <!-- 수정 전 정보보여주기 -->
              <p class="text-sm text-muted"><i class="fa fa-id-card fa-fw me-2"></i><b>${Apple.cname}</b>&nbsp;님&nbsp;&nbsp;(사업자번호 : ${Apple.cno})<br>
              <i class="fa fa-tag fa-fw me-2"></i> 
              			<c:choose>
							<c:when test="${Apple.ctype=='A'}">맛집</c:when>
							<c:when test="${Apple.ctype=='B'}">도서관</c:when>
							<c:when test="${Apple.ctype=='C'}">카페</c:when>
							<c:when test="${Apple.ctype=='D'}">팝업스토어</c:when>
							<c:when test="${Apple.ctype=='E'}">전시</c:when>
							<c:when test="${Apple.ctype=='F'}">축제</c:when>
							<c:when test="${Apple.ctype=='G'}">선택카테고리 없음</c:when>
						</c:choose><br>
			  <i class="fa fa-map fa-fw flex-shrink-0 me-2"></i>${Apple.caddr}<br>
              <i class="fa fa-envelope-open fa-fw me-2"></i>${Apple.csite}<span class="mx-2"> | </span><i class="fa fa-phone fa-fw me-2"></i>${Apple.ctel}<br>
              <i class="fa fa-clock fa-fw me-2"></i>${Apple.period_s}-${Apple.period_e}<span class="mx-2"> | </span><i class="fa fa-calendar-times-o fa-fw me-2"></i>${Apple.cdate}<br>
              <i class="fa fa-check-circle-o fa-fw me-2"></i>
              			<c:choose>
							<c:when test="${Apple.cprice==0}">무료</c:when>
							<c:when test="${Apple.cprice!=0}">${Apple.cprice}원</c:when>
						</c:choose>      
              <span class="mx-2"> | </span>
              <i class="fa fa-car fa-fw me-2"></i>
              			<c:choose>
							<c:when test="${Apple.cpark=='Y'}">가능</c:when>
							<c:when test="${Apple.cpark=='N'}">불가능</c:when>
							<c:when test="${Apple.cpark==null}">알수없음</c:when>
						</c:choose></p>
			
			<!-- ** 드롭다운으로 정보수정할 수 있는 칸보여줌   -->
              <div class="collapse" id="personalDetails">
                <form action="cupdate" method="post" enctype="multipart/form-data">
                  <div class="row pt-4">
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="name">사업자명</label>
                      <input class="form-control" type="text" name="cname" id="cname" value="${Apple.cname}">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="number">사업자번호</label>
                      <input class="form-control" type="number" name="cno" id="cno" value="${Apple.cno}" readonly="readonly">
                    </div>
					<div class="mb-4 col-md-6">
                      <label class="form-label" for="cpw">비밀번호</label>
                      <input class="form-control" type="password" name="cpw" id="cpw" value="${Apple.cpw}">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="ctype">카테고리</label>
                      <select class="form-control dropdown-toggle" name="ctype" id="ctype">
							<c:choose>
							<c:when test="${Apple.ctype=='A'}">
								<option value="A" selected>맛집</option>
								<option value="B">도서관</option>
								<option value="C">카페</option>
								<option value="D">팝업스토어</option>
								<option value="E">전시</option>
								<option value="F">축제</option>
							</c:when>
							<c:when test="${Apple.ctype=='B'}">
								<option value="A">맛집</option>
								<option value="B" selected>도서관</option>
								<option value="C">카페</option>
								<option value="D">팝업스토어</option>
								<option value="E">전시</option>
								<option value="F">축제</option>
							</c:when>
							<c:when test="${Apple.ctype=='C'}">
								<option value="A">맛집</option>
								<option value="B">도서관</option>
								<option value="C" selected>카페</option>
								<option value="D">팝업스토어</option>
								<option value="E">전시</option>
								<option value="F">축제</option>
							</c:when>
							<c:when test="${Apple.ctype=='D'}">
								<option value="A">맛집</option>
								<option value="B">도서관</option>
								<option value="C">카페</option>
								<option value="D" selected>팝업스토어</option>
								<option value="E">전시</option>
								<option value="F">축제</option>
							</c:when>
							<c:when test="${Apple.ctype=='E'}">
								<option value="A">맛집</option>
								<option value="B">도서관</option>
								<option value="C">카페</option>
								<option value="D">팝업스토어</option>
								<option value="E" selected>전시</option>
								<option value="F">축제</option>
							</c:when>
							<c:when test="${Apple.ctype=='F'}">
								<option value="A">맛집</option>
								<option value="B">도서관</option>
								<option value="C">카페</option>
								<option value="D">팝업스토어</option>
								<option value="E">전시</option>
								<option value="F" selected>축제</option>
							</c:when>
							<c:when test="${Apple.ctype=='G'}">
								<option value="G" selected>선택해주세요</option>
								<option value="A">맛집</option>
								<option value="B">도서관</option>
								<option value="C">카페</option>
								<option value="D">팝업스토어</option>
								<option value="E">전시</option>
								<option value="F">축제</option>
							</c:when>
							</c:choose>
						</select>                
                    </div>
                    <div class="mb-4 col-md-12">
                      <label class="form-label" for="caddr">위치 및 장소</label>
                      <input class="form-control" type="text" name="caddr" id="caddr" value="${Apple.caddr}">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="csite">SNS 및 사이트</label>
                      <input class="form-control" type="text" name="csite" id="csite" value="${Apple.csite}">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="ctel">연락처</label>
                      <input class="form-control" type="tel" name="ctel" id="ctel" value="${Apple.ctel}">
                    </div>
					<div class="mb-4 col-md-3">
                      <label class="form-label" for="period_s">시작시간</label>
                      <input class="form-control" type="time" name="period_s" id="period_s" value="${Apple.period_s}">
                    </div>
                    <div class="mb-4 col-md-3">
                      <label class="form-label" for="period_e">마감시간</label>
                      <input class="form-control" type="time" name="period_e" id="period_e" value="${Apple.period_e}">
                    </div>
					<div class="mb-4 col-md-6">
                      <label class="form-label" for="cdate">휴무일</label>
                      <input class="form-control" type="text" name="cdate" id="cdate" value="${Apple.cdate}">
                    </div>
                    
                 <c:if test="${Apple.cdate_s!=null || Apple.cdate_e!=null}">
                 	<div class="mb-4 col-md-6">
                      <label class="form-label" for="cdate_s">행사 시작일</label>
                      <input class="form-control" type="date" name="cdate_s" id="cdate_s" value="${Apple.cdate_s}">
                    </div>
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="cdate_e">행사 종료일</label>
                      <input class="form-control" type="date" name="cdate_e" id="cdate_e" value="${Apple.cdate_e}">
                    </div>           
                 </c:if>

					<div class="mb-4 col-md-6">
                      <label class="form-label" for="cprice">입장료</label>
                      <input class="form-control" type="number" name="cprice" id="cprice" value="${Apple.cprice}">
                      <small class="form-text text-muted mt-2">입장료가 무료일 경우에는 '0'이라고 기입하십시오</small>
                    </div>                    
                    <div class="mb-4 col-md-6">
                      <label class="form-label" for="cpark">주차 여부</label>
                      <select class="form-control dropdown-toggle" name="cpark" id="cpark">
						<c:choose>
							<c:when test="${Apple.cpark=='Y'}">
								<option class="dropdown-item active" value="Y" selected>가능</option>
								<option class="dropdown-item" value="N">불가능</option>
							</c:when>
							<c:when test="${Apple.cpark=='N'}">
								<option class="dropdown-item" value="Y">가능</option>
								<option class="dropdown-item active" value="N" selected>불가능</option>
							</c:when>
							<c:when test="${Apple.cpark==null}">
								<option class="dropdown-item active" selected>선택해주세요</option>
								<option class="dropdown-item" value="Y">가능</option>
								<option class="dropdown-item" value="N">불가능</option>
							</c:when>
						</c:choose>
					</select>
                    </div>
					<div class="mb-4 col-md-12">
                      <label class="form-label" for="cinfo">상세정보</label>
                      <textarea class="form-control" name="cinfo" id="cinfo" rows="5">${Apple.cinfo}</textarea>
                    </div>                    
                    <div class="mb-4 col-md-12">
                      <label class="form-label" for="comuploadfile">대표이미지</label><br>
                      <img src="${Apple.comuploadfile}" class="select_img" width="200" height="200"><br>
							<input type="hidden" name="comuploadfile" value="${Apple.comuploadfile}"><br>
							<input class="form-control" type="file" name="comuploadfilef" id="comuploadfilef">
							<script>
							$('#comuploadfilef').change(function(){
								if(this.files && this.files[0]) {
									var reader = new FileReader;
							 			reader.onload = function(e) {
						 				$(".select_img").attr("src", e.target.result)
						 					.width(100).height(100); 
						 				} // onload_function
						 				reader.readAsDataURL(this.files[0]);
						 		} // if
							}); // change	
							</script>
                    </div>
                  </div>
                  <input class="btn btn-outline-success mb-4 col-md-12" type="submit" value="정보 수정 완료">
                </form>
              </div> <!-- 드롭다운 정보수정 -->
            </div>
          </div>
          <!-- 옆에 창 -->
          <div class="col-md-8 col-lg-4 ms-lg-auto">
            <div class="card border-0 shadow">
              <div class="card-header bg-primary-light py-4 border-0">
                <div class="d-flex align-items-center">
                  <div>
                    <h4 class="h6 subtitle text-sm text-primary">문화공간정보 수정페이지입니다</h4>
                  </div>
                  <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-primary flex-shrink-0">
                    <use xlink:href="#identity-1"> </use>
                  </svg>
                </div>
              </div>
              <div class="card-body p-4">
                <p class="text-muted text-sm card-text">현재 수정하는 정보는 일반회원에게 <br>보여지는 문화공간정보입니다.</p>
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