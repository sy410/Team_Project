<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Spring Mybatis Review Cri_PageList **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css" >
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/pagelist.js"></script>
<script src="resources/myLib/pagedetail.js"></script>
<script>
//** Button 으로 현재 입력 & 선택한 keyword 와 searchType 을 queryString 으로 
//   요청을 보내기 때문에 makeQuery() 메서드를 사용해야 함.
$(function() {	
	// SearchType 이 '---' 면 keyword 클리어
	$('#searchType').change(function() {
		if ($(this).val()=='n') $('#keyword').val('');
	}); //change
	
	$('#searchBtn').on("click", function() {
		self.location="rcplist"
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
<h2>** Notice Cri_PageList **</h2>
<br>
<c:if test="${message!=null}">
 => ${message}<br> 
</c:if>
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="n" <c:out value="${pageMaker.cri.searchType==null ? 'selected':''}"/> >---</option>
		<option value="t" <c:out value="${pageMaker.cri.searchType=='t' ? 'selected':''}"/> >Title</option>
		<option value="c" <c:out value="${pageMaker.cri.searchType=='c' ? 'selected':''}"/> >Content</option>
		<option value="tc" <c:out value="${pageMaker.cri.searchType=='tc' ? 'selected':''}"/> >Title & Content</option>
	</select>
	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>
</div>
<br>
<table class="noticeTable">
<tr height="40" bgcolor="PaleTurquoise">
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
<c:forEach var="list" items="${Pink}"><tr height="40">
	<td>${list.bfno}</td>
	<td>
		<!-- 로그인 했을때만 글내용을 볼 수 있도록 -->
		<c:if test="${loginID!=null}">
			<a href="#resultArea1" onclick="titleNDetail(${list.bfno})">${list.bftitle}</a>
		</c:if>
		<c:if test="${loginID==null}">
			${list.bftitle}
		</c:if>
	</td>
	<td>${list.id}</td><td>${list.bfdate}</td><td align="center">${list.bfcnt}</td>
</tr></c:forEach>
</table>
<br><hr>
<div align="center">
	<!-- Paging 2 : Criteria 적용 
		=> ver01 : pageMaker.makeQuery(?)
		=> ver02 : pageMaker.searchQuery(?)
	
		 1)  First << ,  Prev <  처리 -->
	<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
		<a href="ncplist${pageMaker.searchQuery(1)}">FF</a>&nbsp;
		<a href="ncplist${pageMaker.searchQuery(pageMaker.spageNo-1)}">Prev</a>
	</c:if>
	
	<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
		<c:if test="${i==pageMaker.cri.currPage}">
			<font size="5" color="Orange">${i}</font>&nbsp;
		</c:if>
		<c:if test="${i!=pageMaker.cri.currPage}">
			<a href="ncplist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
		</c:if>
	</c:forEach>
	&nbsp;
	<!-- 3) Next >  ,  Last >>  처리 -->
	<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
		<a href="ncplist${pageMaker.searchQuery(pageMaker.epageNo+1)}">Next</a>&nbsp;
		<a href="ncplist${pageMaker.searchQuery(pageMaker.lastPageNo)}">LL</a>&nbsp;&nbsp;
	</c:if>
</div>

<br><hr>
<c:if test="${loginID!=null}"> 	
	<a href="ninsertf">새글등록</a>&nbsp;&nbsp;
	<a href="logout">Logout</a>&nbsp;&nbsp;
</c:if>  
<c:if test="${loginID==null}"> 
	<a href="loginf">로그인</a>&nbsp;&nbsp;
	<a href="joinf">회원가입</a>&nbsp;&nbsp;
</c:if>
<a href="home">HOME</a>
</body>
</html>