<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Review Insert **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<link rel="stylesheet" type="text/css" href="resources/myLib/star.css" >
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/star.js"></script>
</head>
<body>
<h2 class="n">홈페이지 이름</h2>
<table class="reviewTable" text><form action="rinsert" method="get">
	<tr height="40">
	    <td bgcolor="Silver" align="center">Id</td>
		<td><input type="text" name="id" value="${loginID}" readonly></td>
	</tr>
	<tr height="40">	
		<td bgcolor="Silver" align="center">City</td>
		<td><select name="city" id="city">
		  <option value="Geoje">거제</option>
		  <option value="Gyeongju">경주</option>
		  <option value="goyang">고양</option>
		  <option value="Gwacheon">과천</option>
			<option value="Gwangyang">광양</option>
			<option value="Gwangju">광주</option>
			<option value="Gunsan">군산</option>
			<option value="gimhae">김해</option>
			<option value="Namyangju">남양주</option>
			<option value="Daegu">대구</option>
			<option value="Daejeon">대전</option>
			<option value="Mokpo">목포</option>
			<option value="Busan">부산</option>
			<option value="Bucheon">부천</option>
			<option value="Samcheok">삼척</option>
			<option value="Seogwipo">서귀포</option>
			<option value="Seosan">서산</option>
			<option value="Seoul" selected="selected">서울</option>
			<option value="Seongnam">성남</option>
			<option value="Suwon">수원</option>
			<option value="Siheung">시흥</option>
			<option value="Asan">아산</option>
			<option value="Andong">안동</option>
			<option value="Ansan">안산</option>
			<option value="Yangsan">양산</option>
			<option value="Yeoju">여주</option>
			<option value="Yongin">용인</option>
			<option value="Ulson">울산</option>
			<option value="Wonju">원주</option>
			<option value="Incheon">인천</option>
			<option value="Uiwang">의왕</option>
			<option value="Uijeongbu">의정부</option>
			<option value="Jeonju">전주</option>
			<option value="Jeju">제주</option>
			<option value="Jecheon">제천</option>
			<option value="Jinju">진주</option>
			<option value="Changwon">창원</option>
			<option value="Cheonan">천안</option>
			<option value="Cheongju">청주</option>
			<option value="Chuncheon">춘천</option>
			<option value="Chungju">충주</option>
			<option value="pyeongtaek">평택</option>
			<option value="Taebaek">태백</option>
			<option value="Paju">파주</option>
			<option value="Pohang">포항</option>
			<option value="Hanam">하남</option>
			<option value="Hwaseong">화성</option>
		 </select></td>
	</tr>
	<tr height="40">
	     <td bgcolor="Silver" align="center">Title</td>
		 <td><input type="text" name="title"></td>
	</tr>	
	<tr height="40">
	     <td bgcolor="Silver" align="center" width="100">Content</td>
		 <td><textarea name="content" rows="30" cols="60"></textarea></td>
	</tr>
           
	<tr> 
	     <td bgcolor="Silver" align="center">첨부파일</td>
	     <td>
  	     <img src="" class="select_img"><br>
  	     <input type="file" name="uploadfilef" id="uploadfilef">
  	     <script>
  	        $('#uploadfilef').change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
			 			reader.onload = function(e) {
		 				$(".select_img").attr("src", e.target.result)
		 					.width(100).height(100); 
		 				} // onload_function
		 				reader.readAsDataURL(this.files[0]);
		 		} // if
			}); // change	
  		</script></td>
	</tr>
	<tr>
	<td></td>
	   <td width="500"> <%@  include file="star.html" %> </td>
	</tr>
	
	<tr height="40"><td></td>
		<td align="center"><input type="submit" value="전송">&nbsp;&nbsp;
			<input type="reset" value="취소">
		</td>
	</tr>
</form></table>

<c:if test="${message!=null}">
<hr>
=> ${message}
</c:if>
<br><hr>
<div align="center">
<a href="rlist">후기창</a>&nbsp;
<a href="home">HOME</a>
</div>
</body>
</html>