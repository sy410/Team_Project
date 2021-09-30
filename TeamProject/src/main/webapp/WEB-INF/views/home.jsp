<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>home</title>
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
          <div class="d-flex align-items-center"><a class="navbar-brand py-1" href="home"><img src="resources/img/logo.svg" alt="Directory logo"></a>
            <form class="form-inline d-none d-sm-flex" action="#" id="search">
              <div class="input-label-absolute input-label-absolute-left input-expand ms-lg-2 ms-xl-3"> 
                <label class="label-absolute" for="search_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="search_search" placeholder="Search" aria-label="Search" type="search">
              </div>
            </form>
          </div>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
          <!-- Navbar Collapse -->
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
              <div class="input-label-absolute input-label-absolute-left w-100">
                <label class="label-absolute" for="searchcollapsed_search"><i class="fa fa-search"></i><span class="sr-only">What are you looking for?</span></label>
                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" id="searchcollapsed_search" placeholder="Search" aria-label="Search" type="search">
              </div>
            </form>
            <ul class="navbar-nav ms-auto">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle " id="docsDropdownMenuLink" href="home" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   RESERVATION</a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="docsDropdownMenuLink">
                  <h6 class="dropdown-header fw-normal">Documentation</h6><a class="dropdown-item" href="docs/docs-introduction.html">Introduction </a><a class="dropdown-item" href="docs/docs-directory-structure.html">Directory structure </a><a class="dropdown-item" href="docs/docs-gulp.html">Gulp </a><a class="dropdown-item" href="docs/docs-customizing-css.html">Customizing CSS </a><a class="dropdown-item" href="docs/docs-credits.html">Credits </a><a class="dropdown-item" href="docs/docs-changelog.html">Changelog </a>
                  <div class="dropdown-divider"></div>
                  <h6 class="dropdown-header fw-normal">Components</h6><a class="dropdown-item" href="docs/components-bootstrap.html">Bootstrap </a><a class="dropdown-item" href="docs/components-directory.html">Theme </a>
                </div>
              </li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="homeDropdownMenuLink" href="home" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   COMMUNITY</a>
               	<div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="aboard">Notice</a><a class="dropdown-item" href="aboard">Q&A</a><a class="dropdown-item" href="aboard">Review <span class="badge badge-info-light ms-1 mt-n1">New</span></a></div>
              </li>
			  <!-- 관리자일때만 메뉴확인가능 -->
			  <c:if test="${loginID == 'admin'}">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="homeDropdownMenuLink" href="home" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   LIST</a>
                <div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink"><a class="dropdown-item" href="pcplist">일반회원 목록</a><a class="dropdown-item" href="comlist">사업자회원 목록</a><div class="dropdown-divider"></div><a class="dropdown-item" href="#">예약관리</a></div>
              </li>
              </c:if>
			   <!-- 로그인했을 시 메뉴확인가능 -->
			 <c:if test="${loginID!=null || loginCno!=null}">
				<li class="nav-item"><a class="nav-link" href="paccountf">MYPAGE</a></li>
	 			<li class="nav-item"><a class="nav-link" href="logout">LOGOUT</a></li>
             </c:if>
              <!-- 로그인 안 했을 시-->
             <c:if test="${loginID==null && loginCno==null}">
              	<li class="nav-item"><a class="nav-link" href="loginf">LOGIN</a></li>
              	<li class="nav-item"><a class="nav-link" href="joinf">JOIN</a></li>
             </c:if>
              <li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="user-add-0.html">Add a listing</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- /Navbar -->
    </header>
    <section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1350&amp;q=80);">
      <div class="container py-6 py-lg-7 text-white overlay-content">
        <div class="row">
          <div class="col-xl-8">
            <h1 class="display-3 fw-bold text-shadow">Let us guide you home</h1>
            <p class="text-lg text-shadow mb-6">Uncover the best offers on the real estate market.</p>
          </div>
        </div>
      </div>
    </section>
    <div class="container position-relative mt-n6 z-index-20">
      <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
        <li class="nav-item me-2"><a class="nav-link active" href="#buy" data-bs-toggle="tab" role="tab">맛집</a></li>
        <li class="nav-item me-2"><a class="nav-link" href="#rent" data-bs-toggle="tab" role="tab">전시회</a></li>
        <li class="nav-item"><a class="nav-link" href="#sell" data-bs-toggle="tab" role="tab">축제</a></li>
      </ul>
      <div class="search-bar search-bar-with-tabs p-3 p-lg-4">
        <div class="tab-content">
          <div class="tab-pane fade show active" id="buy" role="tabpanel">
                <form action="#">
                  <div class="row">
                    <div class="col-lg-4 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker form-control" title="Location" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                        <option value="city_0">San Francisco</option>
                        <option value="city_1">Los Angeles</option>
                        <option value="city_2">Santa Monica</option>
                        <option value="city_3">San Diego</option>
                        <option value="city_4">Fresno</option>
                      </select>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker" title="Type" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                        <option value="type_0">한식</option>
                        <option value="type_1">일식</option>
                        <option value="type_2">양식</option>
                        <option value="type_3">중시</option>
                        <option value="type_4">카페</option>
                      </select>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker" title="Max price" data-style="btn-form-control">
                        <option value="price_0">$5,000</option>
                        <option value="price_1">$10,000</option>
                        <option value="price_2">$25,000</option>
                        <option value="price_3">$50,000</option>
                      </select>
                    </div>
                    <div class="col-lg-2 d-grid form-group mb-0">
                      <button class="btn btn-primary h-100" type="submit">Search </button>
                    </div>
                  </div>
                </form>
          </div>
          <div class="tab-pane fade" id="rent" role="tabpanel">
                <form action="#">
                  <div class="row">
                    <div class="col-lg-4 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker form-control" title="Location" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                        <option value="city_0">San Francisco</option>
                        <option value="city_1">Los Angeles</option>
                        <option value="city_2">Santa Monica</option>
                        <option value="city_3">San Diego</option>
                        <option value="city_4">Fresno</option>
                      </select>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker" title="Type" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                        <option value="type_0">Duplex</option>
                        <option value="type_1">Appartment</option>
                        <option value="type_2">House</option>
                        <option value="type_3">Land</option>
                        <option value="type_4">Other</option>
                      </select>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker" title="Max price" data-style="btn-form-control">
                        <option value="price_0">$5,000</option>
                        <option value="price_1">$10,000</option>
                        <option value="price_2">$25,000</option>
                        <option value="price_3">$50,000</option>
                      </select>
                    </div>
                    <div class="col-lg-2 d-grid form-group mb-0">
                      <button class="btn btn-primary h-100" type="submit">Search </button>
                    </div>
                  </div>
                </form>
          </div>
          <div class="tab-pane fade" id="sell" role="tabpanel">
                <form action="#">
                  <div class="row">
                    <div class="col-lg-4 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker form-control" title="Location" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                        <option value="city_0">San Francisco</option>
                        <option value="city_1">Los Angeles</option>
                        <option value="city_2">Santa Monica</option>
                        <option value="city_3">San Diego</option>
                        <option value="city_4">Fresno</option>
                      </select>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker" title="Type" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                        <option value="type_0">Duplex</option>
                        <option value="type_1">Appartment</option>
                        <option value="type_2">House</option>
                        <option value="type_3">Land</option>
                        <option value="type_4">Other</option>
                      </select>
                    </div>
                    <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                      <select class="selectpicker" title="Max price" data-style="btn-form-control">
                        <option value="price_0">$5,000</option>
                        <option value="price_1">$10,000</option>
                        <option value="price_2">$25,000</option>
                        <option value="price_3">$50,000</option>
                      </select>
                    </div>
                    <div class="col-lg-2 d-grid form-group mb-0">
                      <button class="btn btn-primary h-100" type="submit">Search </button>
                    </div>
                  </div>
                </form>
          </div>
        </div>
      </div>
    </div>
    <section class="py-6">
      <div class="container">
        <div class="row mb-lg-6">
          <div class="col-md-8">
            <p class="subtitle text-secondary">Find your home today</p>
            <h2 class="mb-md-0">Featured listings around you</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="category-rooms.html">
               See all featured listings<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
      </div>
      <div class="container-fluid">
        <!-- Slider main container-->
        <div class="swiper-container swiper-container-mx-negative items-slider-full px-lg-5 pt-3">
          <!-- Additional required wrapper-->
          <div class="swiper-wrapper pb-5">
            <!-- Slides-->
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern, Well-Appointed Room</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">House</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>350 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>3</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$150k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Cute Quirky Garden apt, NYC adjacent</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">Apartment</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>85 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>2</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>1</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$65k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern Apt - Vibrant Neighborhood!</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">House</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>350 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>3</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$150k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Sunny Private Studio-Apartment</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">Apartment</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>85 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>2</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>1</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$65k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Mid-Century Modern Garden Paradise</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">House</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>350 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>3</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$150k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Brooklyn Life, Easy to Manhattan</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">Apartment</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>85 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>2</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>1</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$65k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Modern, Well-Appointed Room"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern, Well-Appointed Room</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">House</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>350 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>3</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$150k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1426122402199-be02db90eb90.jpg" alt="Cute Quirky Garden apt, NYC adjacent"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Cute Quirky Garden apt, NYC adjacent</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">Apartment</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>85 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>2</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>1</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$65k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1512917774080-9991f1c4c750.jpg" alt="Modern Apt - Vibrant Neighborhood!"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Modern Apt - Vibrant Neighborhood!</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">House</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>350 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>3</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$150k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1494526585095-c41746248156.jpg" alt="Sunny Private Studio-Apartment"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Sunny Private Studio-Apartment</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">Apartment</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>85 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>2</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>1</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$65k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Mid-Century Modern Garden Paradise"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Mid-Century Modern Garden Paradise</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">House</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>350 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>3</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$150k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-slide h-auto px-2">
              <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                <div class="card h-100 border-0 shadow">
                  <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="resources/img/photo/photo-1488805990569-3c9e1d76d51c.jpg" alt="Brooklyn Life, Easy to Manhattan"/><a class="tile-link" href="detail-rooms.html"></a>
                    <div class="card-img-overlay-top text-end"><a class="card-fav-icon position-relative z-index-40" href="javascript: void();"> 
                        <svg class="svg-icon text-white">
                          <use xlink:href="#heart-1"> </use>
                        </svg></a></div>
                  </div>
                  <div class="card-body d-flex align-items-center">
                    <div class="w-100">
                      <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">Brooklyn Life, Easy to Manhattan</a></h6>
                      <p class="text-sm text-secondary card-subtitle mb-2"><i class="fa fa-map-marker text-secondary opacity-4 me-1"></i>San Francisco</p>
                      <p class="text-sm text-muted text-uppercase">Apartment</p>
                      <p class="card-text d-flex justify-content-between text-gray-800 text-sm"><span class="me-1"><i class="fa fa-ruler-combined text-primary opacity-4 text-xs me-1"></i>85 m<sup>2</sup>   </span><span class="me-1"><i class="fa fa-bed text-primary opacity-4 text-xs me-1"></i>2</span><span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>1</span><span><i class="fa fa-tag text-primary opacity-4 text-xs me-1"></i>$65k</span></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- If we need pagination-->
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>
    <!-- Our picks section-->
    <section class="py-6 bg-gray-100">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-8">
            <p class="subtitle text-primary">Most popular cities</p>
            <h2>What's on our radar</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="category-3-rooms.html">
               See all cities<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="row">
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-8">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(resources/img/photo/photo-1449034446853-66c86144b0ad.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0">San Francisco</h3>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(resources/img/photo/photo-1429554429301-1c7d5ae2d42e.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0">Los Angeles</h3>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(resources/img/photo/photo-1523430410476-0185cb1f6ff9.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0">Santa Monica</h3>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(resources/img/photo/photo-1505245208761-ba872912fac0.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0">San Diego</h3>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
            <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(resources/img/photo/photo-1519867850-74775a87e783.jpg) no-repeat; background-size: cover;"><a class="tile-link" href="category.html"> </a>
              <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                <h3 class="text-shadow text-uppercase mb-0">Fresno</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="py-6">
      <div class="container">
        <div class="pb-lg-4">
          <p class="subtitle text-secondary">Why us?</p>
          <h2 class="mb-5">Discover the best investment opportunities around you</h2>
        </div>
        <div class="row">
          <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
            <div class="px-0 pe-lg-4">
              <div class="icon-rounded mb-3 bg-primary-light">
                <svg class="svg-icon w-2rem h-2rem text-primary">
                  <use xlink:href="#destination-map-1"> </use>
                </svg>
              </div>
              <h3 class="h6 text-uppercase">Find the best investment area</h3>
              <p class="text-muted text-sm">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed in</p>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
            <div class="px-0 pe-lg-4">
              <div class="icon-rounded mb-3 bg-secondary-light">
                <svg class="svg-icon w-2rem h-2rem text-secondary">
                  <use xlink:href="#real-estate-1"> </use>
                </svg>
              </div>
              <h3 class="h6 text-uppercase">Purchase a property</h3>
              <p class="text-muted text-sm">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pit</p>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4 mb-3 mb-lg-0">
            <div class="px-0 pe-lg-4">
              <div class="icon-rounded mb-3 bg-primary-light">
                <svg class="svg-icon w-2rem h-2rem text-primary">
                  <use xlink:href="#pay-1"> </use>
                </svg>
              </div>
              <h3 class="h6 text-uppercase">Profit</h3>
              <p class="text-muted text-sm">His room, a proper human room although a little too small, lay peacefully between its four familiar </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Divider Section-->
    <section>
      <div class="container bg-gray-100 py-6 px-3 px-lg-5 rounded-3 shadow-sm">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0 text-center text-lg-start">
            <p class="subtitle text-secondary">Start using Directory today</p>
            <p class="text-lg">Directory is the best way to find & discover great local businesses</p>
            <p class="text-muted mb-0">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed in</p>
          </div>
          <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="text-center">
              <p class="mb-2"><a class="btn btn-lg btn-primary" href="#">Create Your Account</a></p>
              <p class="text-muted text-small">It's free! </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="py-6">
      <div class="container">
        <div class="row mb-lg-6">
          <div class="col-md-8">
            <p class="subtitle text-secondary">Who are we?</p>
            <h2 class="mb-md-0">Meet our team</h2>
          </div>
          <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="team.html">
               Meet us all<i class="fas fa-angle-double-right ms-2"></i></a></div>
        </div>
        <div class="row">
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="resources/img/avatar/agent-0.png" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Meredith Goodwin</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">CEO &amp; Founder    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="resources/img/avatar/agent-1.png" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Weeks Garrett</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Co-founder    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="resources/img/avatar/agent-2.png" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Fisher Bauer</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">CTO    </p>
              </div>
            </div>
          </div>
          <div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
            <div class="card border-0 hover-animate bg-transparent"><a class="position-relative" href="#"><img class="card-img-top team-img" src="resources/img/avatar/agent-3.png" alt=""/>
                <div class="team-circle bg-secondary-light"></div></a>
              <div class="card-body team-body text-center">
                <h6 class="card-title">Aguilar Webb</h6>
                <p class="card-subtitle text-muted text-xs text-uppercase">Community    </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Brands Section-->
    <section class="py-6 bg-gray-100">
      <div class="container">
        <h5 class="text-center text-uppercase letter-spacing-3 mb-5">As seen on</h5>
        <!-- Brands Slider-->
        <div class="swiper-container brands-slider">
          <div class="swiper-wrapper pb-5">
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-1.svg" alt="Brand 1"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-2.svg" alt="Brand 2"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-3.svg" alt="Brand 3"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-4.svg" alt="Brand 4"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-5.svg" alt="Brand 5"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-6.svg" alt="Brand 6"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-1.svg" alt="Brand 1"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-2.svg" alt="Brand 2"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-3.svg" alt="Brand 3"></a></div>
            <!-- item-->
            <div class="swiper-slide h-auto d-flex align-items-center justify-content-center"><a href="#"><img class="img-fluid w-6rem opacity-5" src="resources/img/brand/brand-4.svg" alt="Brand 4"></a></div>
          </div>
        </div>
      </div>
    </section>
    <!-- Instagram-->
    <section>
      <div class="container-fluid px-0">
        <div class="swiper-container instagram-slider">
          <div class="swiper-wrapper">
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-1.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-2.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-3.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-4.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-5.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-6.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-7.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-8.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-9.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-10.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-11.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-12.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-13.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-14.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-10.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-11.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-12.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-13.jpg" alt=" "></a></div>
            <div class="swiper-slide overflow-hidden"><a href="#"><img class="img-fluid hover-scale" src="resources/img/instagram/instagram-14.jpg" alt=" "></a></div>
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