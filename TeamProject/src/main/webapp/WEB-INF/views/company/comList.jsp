<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 사업자회원 리스트 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css" >
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
$(function() {	
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#keyword').val('');
	}); //change
	// 검색후 요청
	$('#searchBtn').on("click", function() {
		self.location="comlist"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+'&keyword='
			+$('#keyword').val()
	}); //on_click
}) //ready
</script>
</head>
<body>
<h2>** 사업자회원 리스트 **</h2>
<br>
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<hr>
<div id="searchBar">
  <form action="cchecklist" method="get">
  	<b>카테고리 : </b>
  	<input type="checkbox" name="check" value="A">맛집&nbsp;
  	<input type="checkbox" name="check" value="B">도서관&nbsp;
  	<input type="checkbox" name="check" value="C">카페&nbsp;
  	<input type="checkbox" name="check" value="D">팝업스토어&nbsp;
  	<input type="checkbox" name="check" value="E">전시&nbsp;
  	<input type="checkbox" name="check" value="F">축제&nbsp;
  	<input type="checkbox" name="check" value="G">기타&nbsp;
  	<input type="submit" value="검색">
  	<input type="reset" value="취소">
  </form>
</div><br>
<hr>
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="x" <c:out value="${pageMaker.cri.searchType==null ? 'selected':''}"/> >---</option>
		<option value="n" <c:out value="${pageMaker.cri.searchType=='n' ? 'selected':''}"/> >사업자번호</option>
		<option value="a" <c:out value="${pageMaker.cri.searchType=='a' ? 'selected':''}"/> >사업자명</option>
		<option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected':''}"/> >카테고리</option>
		<option value="r" <c:out value="${pageMaker.cri.searchType=='r' ? 'selected':''}"/> >추천인</option>
		<option value="b" <c:out value="${pageMaker.cri.searchType=='b' ? 'selected':''}"/> >Birthday</option>
		<option value="ia" <c:out value="${pageMaker.cri.searchType=='ia' ? 'selected':''}"/> >ID or Name</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>
</div><br>
<hr>
<table border="1">
<tr height="50" bgcolor="Azure">
	<th>사업자번호</th><th>사업자명</th><th>카테고리</th><th>상세설명</th>
	<th>주소</th><th>휴무일</th><th>행사기간</th><th>이용시간</th><th>전화번호</th><th>입장료</th>
	<th>홈페이지</th><th>주차여부</th><th>대표이미지</th>
</tr>
<c:forEach var="list" items="${Banana}">
<tr width=1500 align="center">
	<td>${list.cno}</td><td>${list.cname}</td>
	<td><c:choose>
			<c:when test="${list.ctype=='A'}">
				<option value="A" selected>맛집</option></c:when>
			<c:when test="${list.ctype=='B'}">
				<option value="B" selected>도서관</option></c:when>
			<c:when test="$list.ctype=='C'}">
				<option value="C" selected>카페</option></c:when>
			<c:when test="${list.ctype=='D'}">
				<option value="D" selected>팝업스토어</option></c:when>
			<c:when test="${list.ctype=='E'}">
				<option value="E" selected>전시</option></c:when>
			<c:when test="${list.ctype=='F'}">
				<option value="F" selected>축제</option></c:when>
			<c:when test="${list.ctype=='G'}">
				<option value="G" selected>선택카테고리 없음</option></c:when>
	</c:choose></td>
	<td>${list.cinfo}</td><td>${list.caddr}</td><td>${list.cdate}</td>
	<td>${list.cdate_s}부터 ${list.cdate_e}까지</td>
	<td>${list.period_s} - ${list.period_e}</td>
	<td>${list.ctel}</td>
	<td>${list.cprice}원</td>
	<td>${list.csite}</td>
	<td ><c:choose>
			<c:when test="${list.cpark=='Y'}">
				<option value="Y">가능</option></c:when>
			<c:when test="${list.cpark=='N'}">
				<option value="N">불가능</option></c:when>
	</c:choose></td>
	<td><img src="${list.comUploadfile}" width="100" height="100"></td>
</tr>
</c:forEach>
</table>
<hr>
<a href="home">HOME</a> 
</body>
</html>