<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>BoardView</title>
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
	<!-- 유효성 검사 -->
	<script type="text/javascript" src="../../js/board.js"></script>
</head>
<body>
<div class="fh5co-loader"></div>
<div id="page">
	<%@include file="/header.jsp"%>
	<!-- 게시판 상세보기 -->
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
			<table>
				<tr>
					<th>작성자</th>
					<td>${board.nickname}</td>
					<th>아이디</th>
					<td>${board.id}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${board.writedate}"></fmt:formatDate>
					</td>
					<th>조회수</th>
					<td>${board.readcount}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${board.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="height: 300px" colspan="3">${board.content}</td>
				</tr>
			</table>
			<br>
			<c:if test="${sessionScope.id == board.id}">
				<input type="button" value="게시글 수정" onclick="location.href='/board/update?num=${board.num}&type=${type}'">
				<input type="button" value="게시글 삭제" onclick="return checkDelete('/board/delete?num=${board.num}&type=${type}')">
			</c:if>
			<input type="button" value="목록" onclick="location.href='/board/list?type=${type}'">
		</div>
		<br><br>
		<!-- 기업광고 부분 : 높이 조금 줄이기-->
		<div id="fh5co-author" class="fh5co-bg-section">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>야구볼래와 함께 하는 기업들</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="author">
							<div class="author-inner animate-box" style="background-image: url('../../image/불닭볶음면.png');">
							</div>
							<div class="desc animate-box">
								<span>Developers</span>
								<h3>TEAM 모여봐요 과제의 숲</h3>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
								<p><a href="/location" class="btn btn-primary btn-outline">Learn More</a></p>
								<ul class="fh5co-social-icons">
									<li><a href="#"><i class="icon-facebook"></i></a></li>
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-dribbble"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-started">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Join our crew!</h2>
						<p>We are waiting for our new crew members! DON'T HESITATE just GO!</p>
						<p><a href="#" class="btn btn-primary">Let's work together</a></p>
					</div>
				</div>
			</div>
		</div>

		<footer id="fh5co-footer" role="contentinfo">
			<div class="container">
				<div class="row copyright">
					<div class="col-md-12 text-center">
						<p>
							<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small>
							<small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a> &amp; <a href="http://blog.gessato.com/" target="_blank">Gessato</a></small>
						</p>

						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>

					</div>
				</div>

			</div>
		</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
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