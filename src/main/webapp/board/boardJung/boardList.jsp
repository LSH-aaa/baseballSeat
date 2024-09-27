<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>BoardList</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Animate.css -->
	<link rel="stylesheet" href="../../css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../../css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../../css/bootstrap.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="../../css/style.css">
	<!-- Board -->
	<link rel="stylesheet" href="../../css/board.css">
	<!-- Modernizr JS -->
	<script src="../../js/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<div class="fh5co-loader"></div>
	<div id="page">
		<%@include file="/header.jsp"%>
		<!-- 게시판 리스트 -->
		<div id="fh5co-work">
			<div class="container_board">
				<div class="col-md-12">
					<c:choose>
					<c:when test="${type == 'Y'}">
					<h3 class="title animate-box">양도 게시판</h3>
					</c:when>
					<c:when test="${type == 'B'}">
					<h3 class="title animate-box">분실물 게시판</h3>
					</c:when>
					<c:otherwise>
					<h3 class="title animate-box">전체 게시판</h3> 	<!--혹시나 하고 넣는 전체 게시판..-->
					</c:otherwise>
					</c:choose>
				</div>
				<div class="header">
					<div>
						<c:if test="${sessionScope.id != null}">
							<input type="button" value="게시글 작성" onclick="location.href='/board/write'">
						</c:if>
					</div>
					<div class="search">
						<form action="/board/list" method="post">
							<input type="hidden" name="currPage" value="${pageHandler.currPage}">
							<select name="searchType">
								<option ${searchVO.searchType == "" ? "selected" : ""}>-----</option>
								<option value="title" ${searchVO.searchType == "title" ? "selected" : ""}>제목</option>
								<option value="content" ${searchVO.searchType == "content" ? "selected" : ""}>내용</option>
								<option value="all" ${searchVO.searchType == "all" ? "selected" : ""}>제목+내용</option>
								<option value="nickname" ${searchVO.searchType == "nickname" ? "selected" : ""}>작성자</option>
							</select>
							<input type="text" name="searchText" id="inputSearch" placeholder="검색어" value="${searchVO.searchText}">
							<button type="submit">검색</button>
						</form>
					</div>
				</div>
				<table>
					<tr>
						<th class="col">번호</th>
						<th class="col">카테고리</th>
						<th>제목</th>
						<th class="col">작성자</th>
						<th>작성일</th>
						<th class="col">조회수</th>
					</tr>
					<c:if test="${boardList.size() <= 0}">
						<tr>
							<td colspan="5" style="text-align: center">표시할 내용이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td class="colLee">${board.num}</td>
							<td class="colLee">${board.type}</td>
							<td><a href="/board/view?num=${board.num}&type=${type}"> ${board.title}</a></td>
							<td class="colLee">${board.nickname}</td>
							<td><fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${board.writedate}"/></td>
							<td class="colLee">${board.readcount}</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<div class="paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item">
								<a class="page-link ${pageHandler.currPage == 1 ? "disabled" : ""}" href="/board/list?currPage=1&type=${type}">처음으로</a>
							</li>
							<c:if test="${pageHandler.showPrev}">
								<li class="page-item">
									<a class="page-link" href="/board/list?currPage=${pageHandler.beginPage - 1}&type=${type}">이전</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pageHandler.beginPage}" end="${pageHandler.endPage}">
								<li class="page-item ${pageHandler.currPage == i ? "active" : ""}">
									<a class="page-link" href="/board/list?currPage=${i}&type=${type}">${i}</a>
								</li>
							</c:forEach>
							<c:if test="${pageHandler.showNext}">
								<li class="page-item">
									<a class="page-link" href="/board/list?currPage=${pageHandler.endPage + 1}&type=${type}">다음</a>
								</li>
							</c:if>
							<li class="page-item">
								<a class="page-link" href="/board/list?currPage=${pageHandler.totalPage}&type=${type}">마지막으로</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		<br><br>
	<%@include file="/footer.jsp"%>
	</div>

	<!-- jQuery -->
	<script src="../../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../../js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<script src="../../js/main.js"></script>
</div>
</body>
</html>