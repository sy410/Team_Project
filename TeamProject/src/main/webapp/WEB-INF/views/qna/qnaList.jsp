<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA List</title>
</head>
<body>
<c:if test="${message!=null}">
 => ${message}<br> 
</c:if>
<hr>
<table class="table">
<tr height="40" bgcolor="PaleTurquoise">
	<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
</tr>
<c:forEach var="list" items="${Banana}"><tr height="40">
	<td>${list.bqno}</td>
	<td>
		<c:if test="${list.indent>0}">
			<c:forEach begin="1" end="${list.indent}">
				<span>&nbsp;&nbsp;</span>
			</c:forEach>
			<span style="color:Purple">└</span>
		</c:if>
	
		<!-- 로그인 했을때만 글내용을 볼 수 있도록 -->
		<c:if test="${password!=null}">
			<a href="rdetail?brno=${list.bqno}&id=${list.id}">${list.bqtitle}</a>
		</c:if>
		<c:if test="${password==null}">
			${list.bqtitle}
		</c:if>
	</td>
	<td>${list.id}</td><td>${list.bqdate}</td>
</tr></c:forEach>
</table>
<br><hr>
<c:if test="${loginID!=null}"> 	
	<a href="binsertf">새글등록</a>&nbsp;&nbsp;
	<a href="logout">Logout</a>&nbsp;&nbsp;
</c:if>  
<c:if test="${loginID==null}"> 
	<a href="loginf">로그인</a>&nbsp;&nbsp;
	<a href="joinf">회원가입</a>&nbsp;&nbsp;
</c:if>
<a href="home">HOME</a>
</body>
</html>