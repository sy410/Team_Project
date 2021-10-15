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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var cnoFCheck=false;
var cpwFCheck=false;
var cpw2FCheck=false;
var cnmFCheck=false;
var cifFCheck=false;
var cadFCheck=false;
var cdtFCheck=false;
var perisFCheck=false;
var perieFCheck=false;
var priFCheck=false;

$(function(){
	$('#cno').focus();
	$('#cno').focusout(function(){
		cnoFCheck=cnoCheck();		
	}); //cnoCheck
	$('#cpw').focus();
	$('#cpw').focusout(function(){
		cpwFCheck=cpwCheck();		
	});	//cpwCheck
	$('#cname').focus();
	$('#cname').focusout(function(){
		cnmFCheck=cnmCheck();		
	});	//cnmCheck
	$('#cinfo').focus();
	$('#cinfo').focusout(function(){
		cifFCheck=cifCheck();		
	});	//cifCheck
	$('#caddr').focus();
	$('#caddr').focusout(function(){
		cadFCheck=cadCheck();		
	});	//cadCheck
	$('#cdate').focus();
	$('#cdate').focusout(function(){
		cdtFCheck=cdtCheck();		
	});	//cnmCheck
	$('#period_s').focus();
	$('#period_s').focusout(function(){
		perisFCheck=periCheck();		
	});	//cnmCheck
	$('#period_e').focus();
	$('#period_e').focusout(function(){
		perieFCheck=periCheck();		
	});	//cnmCheck
	$('#cprice').focus();
	$('#cprice').focusout(function(){
		priFCheck=priCheck();		
	});	//cnmCheck	
})//ready

function comInCheck() {
	if(cnoFCheck==false){
		$('#cnoMessage').html('사업자 번호를 입력하세요');
	}
	if(cpwFCheck==false){
		$('#cpwMessage').html('비밀번호를 입력하세요');
	}
	if (cnoFCheck && cpwFCheck) {
		alert('~~ 입력 완료 , 회원 가입 됩니다. ~~');
		return true;
	}
	else return false;
}//cnoIncheck

//** 사업자번호 중복 확인하기
function cnoDupCheck() {
	if (cnoFCheck==false) {
		cnoFCheck=cnoCheck();
	}else {
		var url="cnoCheck?cno="+$('#cno').val();
		window.open(url,"_blank",
			"toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=600,height=450");
	}
} //cnoDupCheck
</script>
<style>
#date_start:before {content:'시작일:';margin-right:.6em; color:#9d9d9d;}
#date_end:before {content:'종료일:';margin-right:.6em; color:#9d9d9d;}
#time_start:before {content:'시작시간:';margin-right:.6em; color:#9d9d9d;}
#time_end:before {content:'마감시간:';margin-right:.6em; color:#9d9d9d;}
</style>
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
      <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5">
    <form action="cjoin" method="post" id="myForm" enctype="multipart/form-data">
      <div class="container">
        <p class="subtitle text-primary">사업자회원가입</p>
        <h1 class="h2 mb-5"><strong>사업자 정보 입력</strong></h1>
          <!-- 1. 사업자번호 -->
          <div class="row form-block">
            <div class="col-lg-4">
              <h4>사업자번호</h4>
              <p class="text-muted text-sm">사업자 번호를 도용하여 가입시, 형사처벌 대상에 해당됩니다.<br>인증에 문제가 있을경우 홈페이지 관리자에게 문의부탁드립니다.</p>
            </div>
            <div class="col-lg-7 ms-auto">
              <div class="mb-4">
                <label class="form-label">사업자번호</label>
                <input class="form-control" name="cno" id="cno" maxlength="10" placeholder="하이픈(-)없이 숫자 10자리 입력하세요"><br>
                <input class="form-control btn-primary" type="button" value="사업자번호 중복확인" id="cnoDup" onclick="cnoDupCheck()">
              	<span id="cnoMessage" class="eMessage"></span>
              </div>
              <div class="mb-4">
                <label class="form-label" for="form_name">비밀번호</label>
                <input class="form-control" type="password" name="cpw" id="cpw" >
                <span id="cpwMessage" class="eMessage"></span>
              </div>
              <div class="mb-4">
                <label class="form-label" for="form_name">사업장명</label>
                <input class="form-control" type="text" name="cname" id="cname">
                <span id="cnmMessage" class="eMessage"></span>
              </div>
            </div>
          </div>
          <!-- 2. 위치 및 주소 -->
          <div class="row form-block">
            <div class="col-lg-4">
              <h4>위치 및 주소</h4>
              <p class="text-muted text-sm">일반회원 고객이 찾아갈 수 있는 위치 및 주소를 입력해주세요.<br>주소는 콘텐츠에 지도로 표현됩니다.</p>
            </div>
            <div class="col-lg-7 ms-auto">
	            <div class="mb-4">
					<label class="form-label" for="caddr">주소 찾기</label>
					<input class="form-control btn-primary" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				</div>
				<div class="mb-4"><input class="form-control" name="cpostcode" id="cpostcode" type="text" placeholder="우편번호" ></div>
				<div class="mb-4"><input class="form-control" name="caddr" id="caddr" type="text" placeholder="주소"></div>
				<div class="mb-4"><input class="form-control" name="detailAddr" id="cdetailaddr" type="text" placeholder="상세주소"></div>
				<div class="mb-4"><input class="form-control" name="extraAddr" id="extraAddr" type="hidden" placeholder="참고항목"></div>
					<script>
				      function execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var caddr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    caddr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                   	caddr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                    }
				                    // 조합된 참고항목을 해당 필드에 넣는다.
				                    document.getElementById("extraAddr").value = extraAddr;                
				                } else {
				                    document.getElementById("extraAddr").value = '';
				                }
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('cpostcode').value = data.zonecode;
				                document.getElementById("caddr").value = caddr;
				                document.getElementById("detailaddr").focus();
				          		  }
				        	}).open();
				   		 }
					</script>
				</div>
			</div>
          <!-- 3. 상세정보 -->
           <div class="row form-block">
            <div class="col-lg-4">
              <h4>업체 상세 정보</h4>
              <p class="text-muted text-sm">일반회원 고객에게 보여질 사업장의 정보입니다.<br>카테고리 및 상세 정보를 양식에 맞게 기입하세요.</p>
            </div>
            <div class="col-lg-7 ms-auto">
              <div class="mb-5">
                <label class="form-label" for="form_description">카테고리</label>
                <select class="selectpicker form-control" name="ctype" id="ctype" data-style="btn-selectpicker" data-live-search="true">
                	<option value="G" selected="selected">선택해주세요</option>
					<option value="A">맛집</option>
					<option value="B">도서관</option>
					<option value="C">카페</option>
					<option value="D">팝업스토어</option>
					<option value="E">전시</option>
					<option value="F">축제</option>
                </select>
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_description">상세정보</label>
                <textarea class="form-control" name="cinfo" id="cinfo" rows="5" placeholder="[예시] 000갤러리는 개관 이후 지금까지 대표적인 국내 화랑으로서 세계적으로 유명한 현대미술 작가의 작품과 그 흐름을 접하고 감상할 수 있는 흔치 않은 기회를 제공합니다."></textarea>
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_description">행사기간</label>
                <input class="form-control " type="date" name="cdate_s" id="date_start">
				<input class="form-control" type="date" name="cdate_e" id="date_end">
				<input class="form-check-input" type="checkbox">
				<label class="form-check-label text-muted">없음    </label>
                <small class="form-text text-muted mt-2">(행사기간은 전시·이벤트에만 해당되므로 없을시에 체크 후 이동)</small>
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_description">이용시간</label>
                <input class="form-control mb-2 " type="time" name="period_s" id="time_start" placeholder="시작시간">
                <input class="form-control" type="time" name="period_e" id="time_end" placeholder="마감시간">
                <small class="form-text text-muted mt-2"><span id="periMessage" class="eMessage"></span></small>
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_description">휴무일</label>
                <input class="form-control mb-2 " type="text" name="cdate" id="cdate" placeholder="[예시] 연중무휴, 일요일 휴무 등">
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_description">입장료</label>
                <input class="form-control mb-2 " type="text" name="cprice" id="cprice" value="" size="10" placeholder="'원'은 제외하고 가격만 적어주세요.">
                <small class="form-text text-muted mt-2">입장료가 무료일 경우에는 '0'이라고 기입하십시오</small>
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_description">주차여부</label>
                <select class="selectpicker form-control" name="cpark" id="cpark" data-style="btn-selectpicker" >
                	<option value="Y" selected="selected">가능</option>
  	  				<option value="N">불가능</option>
                </select>
              </div>            
            </div>
          </div>
          <div class="row form-block">
            <div class="col-lg-4">
              <h4>문의정보</h4>
              <p class="text-muted text-sm">일반회원 고객에게 보여질 문의정보입니다.<br>정확한 SNS·전화번호를 양식에 맞게 기입하세요.</p>
            </div>
            <div class="col-lg-7 ms-auto">
              <div class="mb-5">
                <label class="form-label" for="form_description">SNS 및 홈페이지</label>
                <input class="form-control" type="text" name="csite" id="csite" value="" size="30">
              </div>
              <div class="mb-5">
                <label class="form-label" for="form_description">전화번호</label>
                <input class="form-control" type="text" name="ctel" id="ctel" value="" size="10">
              </div>            
            </div>
          </div>
                  <div class="row form-block">
			          <div class="col-lg-4">
			            <h4>대표이미지</h4>
			            <p class="text-muted text-sm">일반회원 고객에게 보여질 업체 대표사진입니다.</p>
			          </div>
			          <div class="col-lg-7 ms-auto">
			            <div class="mb-4"> 
			                <div class="dz-message text-muted">
			                  <img src="" class="select_img" width="300"><br>
			                  <input type="file" name="comuploadfilef" id="comuploadfilef">
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
			          </div>
			        </div>
          
          <div class="row form-block flex-column flex-sm-row">
            <div class="col text-center text-sm-start"></div>
            <div class="col text-center text-sm-end">
            <input type="submit" value="가입완료" onclick="return comInCheck()" disabled id="submit" class="btn btn-primary px-3">
            </div>
          </div>
        </div>
        </form>     
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