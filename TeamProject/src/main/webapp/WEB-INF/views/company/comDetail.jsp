<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 사업자 정보 보기 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<h2>** 사업자 정보 보기 **</h2>
<table>
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
		<td><img src="${Apple.comUploadfile}" width="200" height="200"></td>
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
<a href="home">HOME</a>
</body>
</html>