<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ReviewList **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css" >
</head>
<body>
<h2>** ReviewList **</h2>
<br>
<c:if test="${message!=null}">
 => ${message}<br> 
</c:if>
<hr>
<table class="table">
<tr height="40" bgcolor="PaleTurquoise">
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
<c:forEach var="list" items="${Banana}"><tr height="40">
	<td>${list.brno}</td>
	<td>
		<!-- 로그인 했을때만 글내용을 볼 수 있도록 -->
		<c:if test="${loginID!=null}">
			<a href="rdetail?brno=${list.brno}&id=${list.id}">${list.brtitle}</a>
		</c:if>
		<c:if test="${loginID==null}">
			${list.brtitle}
		</c:if>
	</td>
	<td>${list.id}</td><td>${list.brdate}</td><td align="center">${list.brcnt}</td>
</tr></c:forEach>
</table>
<br><hr>
<c:if test="${loginID!=null}"> 	
	<a href="rinsertf">새글등록</a>&nbsp;&nbsp;
	<a href="logout">Logout</a>&nbsp;&nbsp;
</c:if>  
<c:if test="${loginID==null}"> 
	<a href="loginf">로그인</a>&nbsp;&nbsp;
	<a href="joinf">회원가입</a>&nbsp;&nbsp;
</c:if>
<a href="home">HOME</a>
</body>
</html>