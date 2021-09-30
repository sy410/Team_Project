<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Update Form</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>
<table class="noticeTable">
  <form action="nupdate" method="get">
	<tr height="40"><td bgcolor="SkyBlue">글번호</td>
		<td><input type="text" name="seq" value="${Apple.bfno}" readonly></td></tr>
	<tr height="40"><td bgcolor="SkyBlue">Id</td>
		<td>${Apple.id}</td></tr>
	<tr height="40"><td bgcolor="SkyBlue">제목</td>
		<td><input type="text" name="title" value="${Apple.bftitle}"></td></tr>	
	<tr height="40"><td bgcolor="SkyBlue" >내용</td>
		<td><textarea name="content" rows="10" cols="40">${Apple.bfcontent}</textarea></td>
	</tr>
	<tr height="40"><td bgcolor="SkyBlue">작성일</td>
		<td>${Apple.bfdate}</td></tr>
	<tr height="40"><td bgcolor="SkyBlue">조회수</td>
		<td>${Apple.bfcnt}</td></tr>
	<tr height="40"><td></td>
		<td>&nbsp;<input type="submit" value="전송">&nbsp;&nbsp;
			&nbsp;<input type="reset" value="취소">
		</td>
	</tr>	
</form></table>

<c:if test="${message!=null}">
<hr>
=> ${message}
</c:if>
<br><hr>
<c:if test="${loginID!=null}"> 	
  <c:if test="${loginID=='admin'}">
	<a href="ndelete?bfno=${Apple.bfno}">글삭제</a>&nbsp;
	<a href="ninsertf">새글등록</a>&nbsp;
  </c:if>
	<a href="logout">Logout</a>&nbsp;
	<br><hr>
</c:if>  
<a href="nlist">공지</a>&nbsp;
<a href="home">HOME</a>
</body>
</html>