<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 예약 meta -->
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>** Reservation **</title>

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

<!-- 예약 css -->
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

<!-- 예약js -->
<script src="resources/resLib/js/vendor.js"></script>
<script src="resources/resLib/js/polyfills.js"></script>
<script src="resources/resLib/js/app.js"></script>

<!-- 예약 선택사항 확인 창 -->
<script type="text/javascript">
$(document).ready(function(){
	/* 날짜선택 */
	$("#rpdate").change(function(){
		$("#rdate").text($("#rpdate").val());
	});
	/* 인원선택 */
	$("#rperson").change(function(){
		$("#sum_rperson").text($("#rperson").val());
		var cprice = '${cprice}';
		var rprice = parseInt($("#rperson").val())*parseInt(cprice);
		$("#rprice").text(rprice);
	});
	/* 단계별 접고, 펴기 */
	$('#material-icons1').click(function(){
		$(this).css('color','green');
		$('#form-collapsilble1').fadeToggle('slow');
	});
	$('#material-icons2').click(function(){
		$(this).css('color','green');
		$('#form-collapsilble2').fadeToggle('slow');
	});
	$('#material-icons3').click(function(){
		$(this).css('color','green');
		$('#form-collapsilble3').fadeToggle('slow');
	});
	$('#material-icons4').click(function(){
		$(this).css('color','green');
		$('#form-collapsilble4').fadeToggle('slow');
	});
});
/* 예약시간 라벨값출력 */
function getRadioText(event)  {
	  const radioId = event.target.id;
	  const query = 'label[for="'+ radioId + '"]'
	  const text = 
	        document.querySelector(query).innerText;
	  
	  document.getElementById("rtime").innerText = text;
	}
</script>

<!-- 예약정보 전송 -->
<script type="text/javascript">
$(document).ready(function(){
	$("#reservation").click(function(){
		var formData = new FormData();
		formData.append('rpdate',$('#rpdate').val());
		formData.append('rptime',$('#rptime').val());
		formData.append('rperson',$('#rperson').val());
		formData.append('id',$('#id').val());
		formData.append('cno',$('#cno').val());
		formData.append('rmemo',$('#rmemo').val());
		formData.append('rprice',$('#rprice').val());
		formData.append('rpay',$('#rpay').val());
		var formData = new FormData(document.getElementById('resForm'));
		$.ajax({
			type:'Post',
			url: 'reservation',
			data: formData,
			success:function(resultPage) {
				$('#resultArea1').html(resultPage);
			},
			error:function() {
				$('#resultArea1').html("~~ AjaxReserv Error ~~");
			}
		}); //ajax
});
</script>


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
<form name="resForm" id="resForm" method="post" class="section py-21" action="reservation">
    <div class="section-content container">
       <div class="row">
          <div class="col-12 col-lg-8 mb-20 mb-lg-0">
             <div class="form-collapsible-section mb-4" role="article" aria-expanded="true">
                <div class="form-collapsible-section-head">
                    <span class="form-collapsible-section-number">1</span>
                    <span class="form-collapsible-section-title">날짜/시간선택</span>
                    <span class="form-collapsible-section-toggle">
                        <i class="material-icons" id="material-icons1">keyboard_arrow_down</i>
                    </span>
                </div>
                <div class="form-collapsilble-section-body" id="form-collapsilble1">
                   <div class="form-label mb-6">Choose the date</div>
                   <!-- 달력 구현 -->
                   <!-- 기간 jquery로 년, 월, 일 가져와서 달력 min, max date 입력 -->
                      <input type="date" name="rpdate" id="rpdate" required>
                   <div class="row mt-12">
                      <div class="col-12 col-sm mr-0 mr-md-9 mb-12 mb-sm-0">
                         <div class="mb-7">Morning</div>
                         
                         <!-- 추후 사업자시간 배열로 rptime에 들어가도록 처리 -->
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-1" value="1" onclick='getRadioText(event)'/>
                            <label for="time-slot-1" class="mb-0">10:00 AM</label>
                         </div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-2" value="2" onclick='getRadioText(event)'/>
                            <label for="time-slot-2" class="mb-0">11:00 AM</label>
                         </div>
                      </div>   
                      <div class="col-12 col-sm mr-0 mr-md-9 mb-12 mb-sm-0">
                         <div class="mb-7">Afternoon</div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-3" value="3" onclick='getRadioText(event)'/>
                            <label for="time-slot-3" class="mb-0">12:00 PM</label>
                         </div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-4" value="4" onclick='getRadioText(event)'/>
                            <label for="time-slot-4" class="mb-0">1:00 PM</label>
                         </div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-5" value="5" onclick='getRadioText(event)'/>
                            <label for="time-slot-5" class="mb-0">2:00 PM</label>
                         </div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-6" value="6" onclick='getRadioText(event)'/>
                            <label for="time-slot-6" class="mb-0">3:00 PM</label>
                         </div>
                      </div>  
                      <div class="col-12 col-sm">
                         <div class="mb-7">Evening</div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-7" value="7" onclick='getRadioText(event)'/>
                            <label for="time-slot-7" class="mb-0">5:00 PM</label>
                         </div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="time-slot-8" value="8" onclick='getRadioText(event)'/>
                            <label for="time-slot-8" class="mb-0">6:00 PM</label>
                         </div>
                         <div class="form-selectable-label text-center time-slot mb-4"> 
                            <input type="radio" name="rptime" id="rptime" value="9" onclick='getRadioText(event)'/>
                            <label for="time-slot-9" class="mb-0">7:00 PM</label>
                         </div>
                      </div> 
                   </div> 
                   <div class="pb-19"></div>
                </div> 
             </div> 
             <div class="form-collapsible-section mb-4" role="article" aria-expanded="true">
                <div class="form-collapsible-section-head">
                    <span class="form-collapsible-section-number">2</span>
                    <span class="form-collapsible-section-title">인원선택</span>
                    <span class="form-collapsible-section-toggle">
                        <i class="material-icons" id="material-icons2">keyboard_arrow_down</i>
                    </span>
                </div>
                <div class="form-collapsilble-section-body" id="form-collapsilble2">
                   <div class="form-label mb-6">Choose a number of people</div>
	               <div class="num">
                       <input type="number" name="rperson" id="rperson" size="2" maxlength="4" class="rperson" value="0" >
                   </div>
                   <div class="pb-19"></div> 
                </div> 
             </div> 
             <div class="form-collapsible-section mb-4" role="article" aria-expanded="true">
                <div class="form-collapsible-section-head">
                    <span class="form-collapsible-section-number">3</span>
                    <span class="form-collapsible-section-title">예약자정보</span>
                    <span class="form-collapsible-section-toggle">
                        <i class="material-icons" id="material-icons3">keyboard_arrow_down</i>
                    </span>
                </div>
                <div class="form-collapsilble-section-body" id="form-collapsilble3">
                   <div class="row">
                      <input type="hidden" class="form-control" name="id" id="id" value="${Apple.id}">
                      <div class="col-12 col-sm-6">
                         <div class="form-group mb-5">
                            <label for="name" class="form-lable">Name</label>
                            <input type="text" class="form-control" id="name" value="${Apple.name}" readonly>
                         </div> 
                      </div>
                      <div class="col-12 col-sm-6">
                         <div class="form-group">
                            <label for="tel" class="form-lable">Telephone</label>
                            <input type="text" class="form-control" id="tel" value="${Apple.tel}" readonly>
                         </div> 
                      </div>
                      <div class="col-12 col-sm-6">
                         <div class="form-group">
                            <label for="email" class="form-lable">Email</label>
                            <input type="text" class="form-control" id="email" value="${Apple.email}" readonly>
                         </div> 
                      </div>
                      <div class="col-12 col-sm-6">
                         <div class="form-group">
                            <label for="addr" class="form-lable">Address</label>
                            <input type="text" class="form-control" id="addr" value="${Apple.addr}" readonly>
                         </div> 
                      </div>
                      <div class="col-12">
                         <div class="form-group">
                            <label for="rmemo" class="form-lable">Message</label>
                            <div class="form-label mb-6">If you have any request, please write it down</div>
                            <textarea name="rmemo" id="rmemo" class="form-control" rows="4" ></textarea>
                         </div> 
                      </div>
                   </div> 
                   <div class="pb-19"></div>
                </div> 
             </div> 
             <div class="form-collapsible-section mb-4" role="article" aria-expanded="true">
                <div class="form-collapsible-section-head">
                    <span class="form-collapsible-section-number">4</span>
                    <span class="form-collapsible-section-title">결제방법</span>
                    <span class="form-collapsible-section-toggle">
                        <i class="material-icons" id="material-icons4">keyboard_arrow_down</i>
                    </span>
                </div>
                <!-- 추후 결제방법마다 디체일 구현 -->
                <div class="form-collapsilble-section-body" id="form-collapsilble4">
                   <div class="form-group">
                      <div class="form-label mb-6">Choose payment method</div>
                      <div class="form-check form-check-inline">
                         <input class="custom-radio" type="radio" id="payment-radio-1" name="rpay" value="option1" onclick="javascript:p1()">
                         <script>
                            function p1(){ alert('현장결제로 결제하시겠습니까?'); } 
                         </script>
                         <label class="form-check-label" for="payment-radio-1">현장결제</label>
                      </div>
                      <div class="form-check form-check-inline">
                         <input class="custom-radio" type="radio" id="payment-radio-2" name="rpay" value="option2" onclick="javascript:p2()">
                         <script>
                            function p2(){ alert('계좌이체로 결제하시겠습니까?'); } 
                         </script>
                         <label class="form-check-label" for="payment-radio-2">계좌이체</label>
                      </div>
                      <div class="form-check form-check-inline">
                         <input class="custom-radio" type="radio" id="payment-radio-3" name="rpay" value="option3" onclick="javascript:p3()">
                         <script>
                            function p3(){ alert('신용카드로 결제하시겠습니까?'); } 
                         </script>
                         <label class="form-check-label" for="payment-radio-3">신용카드</label>
                      </div>
                      <div class="form-check form-check-inline">
                         <input class="custom-radio" type="radio" id="payment-radio-4" name="rpay" value="option4" onclick="javascript:p4()">
                         <script>
                            function p4(){ alert('핸드폰으로 결제하시겠습니까?'); } 
                         </script>
                         <label class="form-check-label" for="payment-radio-4">핸드폰</label>
                      </div>
                   </div>
                </div> 
             </div> 
          </div> 
          <div class="col-12 col-lg-4">
             <!-- 선택사항 확인 창 -->
             <div class="sticky-sidebar">
                <div class="card">
                   <div class="card-body">
                      <h1 class=""></h1>
                      <span></span>
                      <div class="bigtext" id="cname" align="center" >${cname}</div>
                      <input type="hidden" class="form-control" name="cno" id="cno" value="${cno}">
                      <div class="bigtext">선택날짜: <span id="rdate"></span></div>
                      <div class="bigtext">선택시간: <span id="rtime"></span></div>
                      <div class="bigtext">인원수: <span id="sum_rperson"></span>명</div>
                      <div class="bigtext">합계금액: <span id="rprice" ></span>원</div>
                      <input class="btn btn-primary d-block" id="reservation" type="submit" value="예약하기">
                      <!-- 폼에 액션=reservation  주고 input name 다 맞추기 -->
                   </div>
                </div>
             </div>
          </div>
       </div> 
    </div> 
</form>
<!-- page content end -->

</body>
</html>