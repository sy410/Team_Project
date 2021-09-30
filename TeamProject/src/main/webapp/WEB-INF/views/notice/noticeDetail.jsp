<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Detail</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<h2 class="n">홈페이지 이름</h2>
<table class="table">
    <tr height="40"><td bgcolor="SkyBlue">Id</td>
		<td>${Apple.id}</td>
	</tr>
	<tr height="40"><td bgcolor="SkyBlue">작성일</td>
		<td>${Apple.bfdate}</td>
	</tr>
	<tr height="40"><td bgcolor="SkyBlue">조회수</td>
		<td>${Apple.bfcnt}</td>
	</tr>
	<tr height="40">
		<td>${Apple.bftitle}</td>
	</tr>	
	<tr height="40">
		<td><textarea rows="10" cols="40" readonly>${Apple.bfcontent}</textarea></td>
	</tr>

</table>
<br><hr>
<c:if test="${loginID!=null}"> 	
  <c:if test="${loginID=='admin'}">
	<a href="ndetail?bfno=${Apple.bfno}&jcode=U">글수정</a>&nbsp;
	<a href="ndelete?bfno=${Apple.bfno}">글삭제</a>&nbsp;
  </c:if>
	<a href="ninsertf">새글등록</a>&nbsp;
	<a href="logout">Logout</a>&nbsp;
	<br><hr>
</c:if> 
<a href="nlist">공지</a>&nbsp;
<a href="home">HOME</a>  
</body>
</html>