<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 사업자 정보 수정 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<h2>** 사업자 정보 수정 **</h2>
<table><form action="cupdate" method="post" enctype="multipart/form-data">
	<tr height="40"><td bgcolor="PaleGreen">사업자번호</td>
		<td><input type="text" name="cno" size="20" value="${Apple.cno}" readonly></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">비밀번호</td>
		<td><input type="password" name="cpw" size="20" value="${Apple.cpw}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">사업자명</td>
		<td><input type="text" name="cname" size="20" value="${Apple.cname}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">카테고리</td>
		<td><select name="ctype">
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
		</select></td>
	</tr>
	<tr height="40"><td bgcolor="SkyBlue" >상세내용</td>
		<td><textarea name="cinfo" rows="10" cols="40">${Apple.cinfo}</textarea></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">주소</td>
		<td><input type="text" name="caddr" size="20" value="${Apple.caddr}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">휴무일</td>
		<td><input type="text" name="cdate" size="20" value="${Apple.cdate}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">이벤트기간</td>
		<td><input type="date" name="cdate_s" size="20" value="${Apple.cdate_s}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">이벤트기간</td>
		<td><input type="date" name="cdate_e" size="20" value="${Apple.cdate_e}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">영업시간</td>
		<td><input type="time" name="period_s" size="20" value="${Apple.period_s}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">영업시간</td>
		<td><input type="time" name="period_e" size="20" value="${Apple.period_e}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">전화번호</td>
		<td><input type="text" name="ctel" size="20" value="${Apple.ctel}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">입장료</td>
		<td><input type="text" name="cprice" size="20" value="${Apple.cprice}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">홈페이지</td>
		<td><input type="text" name="csite" size="20" value="${Apple.csite}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">주차</td>
		<td><input type="text" name="cpark" size="20" value="${Apple.cpark}"></td>
	</tr>
	<tr height="40"><td bgcolor="PaleGreen">사진</td>
		<td>
		<img src="${Apple.comUploadfile}" class="select_img" width="100" height="100"><br>
		<input type="hidden" name="comuploadfile" value="${Apple.comUploadfile}"><br>
		<input type="file" name="comuploadfilef" id="comuploadfilef">
		<script>
		$('#comUploadfilef').change(function(){
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
		</td>
	</tr>
	<tr height="40"><td></td>
		<td><input type="submit" value="수정">&nbsp;&nbsp;
			<input type="reset" value="취소"></td>
	</tr>
</form></table>
<c:if test="${message != null}">
	<br>${message}<br><br>	
</c:if>
<hr>
<a href="home">HOME</a>
</body>
</html>