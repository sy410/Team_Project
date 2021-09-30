<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
</head>
<body>
<table class="table">
<tr height="40" bgcolor="PaleTurquoise">
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
<c:forEach var="list" items="${Banana}"><tr height="40">
	<td>${list.bfno}</td>
<td>
	
		<!-- 로그인 했을때만 글내용을 볼 수 있도록 -->
		<c:if test="${loginID!=null}">
			<a href="ndetail?bfno=${list.bfno}&id=${list.id}">${list.bftitle}</a>
		</c:if>
		<c:if test="${loginID==null}">
			${list.bftitle}
		</c:if>
	</td>
	<td>${list.id}</td><td>${list.bfdate}</td><td align="center">${list.bfcnt}</td>
</tr></c:forEach>	
</table>
<br><hr>
<c:if test="${loginID!=null}"> 	
  <c:if test="${loginID=='admin'}">
	<a href="ndelete?bfno=${Apple.bfno}">글삭제</a>&nbsp;
	<a href="ninsertf">새글등록</a>&nbsp;
  </c:if>
	<a href="logout">Logout</a>&nbsp;
	<br><hr>
</c:if>  
<c:if test="${loginID==null}"> 
	<a href="loginf">로그인</a>&nbsp;&nbsp;
	<a href="joinf">회원가입</a>&nbsp;&nbsp;
</c:if>
<a href="home">HOME</a>
</body>
</html>