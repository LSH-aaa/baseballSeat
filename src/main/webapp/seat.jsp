<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>좌석</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Animate.css -->
		<link rel="stylesheet" href="/css/animate.css">
		<!-- Icomoon Icon Fonts-->
		<link rel="stylesheet" href="/css/icomoon.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="/css/bootstrap.css">
		<!-- Theme style  -->
		<link rel="stylesheet" href="/css/style.css">
		<!-- Modernizr JS -->
		<script src="/js/modernizr-2.6.2.min.js"></script>
		<!-- FOR IE9 below -->
		<!--[if lt IE 9]>
		<script src="/js/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class="fh5co-loader"></div>
		<div id="page">
			<nav class="fh5co-nav" role="navigation">
				<div class="container">
					<div class="fh5co-top-logo">
						<div id="fh5co-logo"><a href="/baseballGive">야구볼래?</a></div>
					</div>
					<div class="fh5co-top-menu menu-1 text-center">
						<ul>
							<!--좌석 -->
							<li class="has-dropdown">
								<a href="/seat">좌석</a>
								<ul class="dropdown">
									<li><a href="/lotte">롯데 자이언츠</a></li>
									<li><a href="#">삼성 라이온즈</a></li>
									<li><a href="#">기아 타이거즈</a></li>
									<li><a href="#">한화 이글스</a></li>
									<li><a href="#">NC 다이노스</a></li>
									<li><a href="#">KT 위즈</a></li>
									<li><a href="#">SSG 랜더스</a></li>
									<li><a href="#">LG 트윈스/두산 베어스</a></li>
									<li><a href="#">키움 히어로즈</a></li>
								</ul>
							</li>
							<!--게시판 드랍다운 -->
							<li class="has-dropdown">
								<a href="#">게시판</a>
								<ul class="dropdown">
									<li><a href="/board/list?type=Y">양도 게시판</a></li>
									<li><a href="/board/list?type=B">분실물 게시판</a></li>
									<li><a href="/board/boardLee/qnaList.jsp">Q&A 게시판</a></li>
								</ul>
							</li>
							<!--about=날씨-->
							<li><a href="/weather.jsp">날씨</a></li>
							<!--contact = 로그인/회원가입-->
							<c:choose>
								<c:when test="${sessionScope.id != null}">
									<li><a href="/board/logout">로그아웃</a></li>
								</c:when>
								<c:otherwise>
									<li class="has-dropdown">
										<a href="#">로그인/회원가입</a>
										<ul class="dropdown">
											<li><a href="/board/login">로그인</a></li>
											<li><a href="/board/register">회원가입</a></li>
										</ul>
									</li>
								</c:otherwise>
							</c:choose>
							<li><a href="#" onclick="alert('⚠️공사중⚠️')">마이페이지</a></li>
						</ul>
					</div>
					<div class="fh5co-top-social menu-1 text-right">
						<ul class="fh5co-social">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
							<li><a href="#"><i class="icon-github"></i></a></li>
						</ul>
					</div>
				</div>
			</nav>

			<div id="fh5co-work">
				<div class="container">
					<div class="row top-line animate-box">
						<div class="col-md-6 col-md-offset-3 col-md-push-2 text-left fh5co-heading">
							<h2 class="addfont">구장별 좌석 확인<small>(시야사진 73,650장)</small></h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 text-center animate-box">
							<a class="work" id="image-box" href="/lotte">
								<div class="work-grid" style="background-image:url('image/Lotte.png');">
									<div class="inner">
										<div class="desc">
											<h3>롯데 자이언츠</h3>
											<span class="cat">사직야구장</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/Samsung.png');">
									<div class="inner">
										<div class="desc">
											<h3>삼성 라이온즈</h3>
											<span class="cat">대구삼성 라이온즈파크</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/Kia.png');">
									<div class="inner">
										<div class="desc">
											<h3>KIA 타이거즈</h3>
											<span class="cat">광주기아 챔피언스필드</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/Hanhwa.png');">
									<div class="inner">
										<div class="desc">
											<h3>한화 이글스</h3>
											<span class="cat">대전한화생명 이글스파크</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/NC.png');">
									<div class="inner">
										<div class="desc">
											<h3>NC 다이노스</h3>
											<span class="cat">창원 NC파크</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/Kium.png');">
									<div class="inner">
										<div class="desc">
											<h3>키움 히어로즈</h3>
											<span class="cat">고척 스카이돔</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/SSG.png');">
									<div class="inner">
										<div class="desc">
											<h3>SSG 랜더스</h3>
											<span class="cat">인천SSG 랜더스필드</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/KT.png');">
									<div class="inner">
										<div class="desc">
											<h3>KT 위즈</h3>
											<span class="cat">수원 케이티위즈파크</span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 text-center animate-box">
							<a class="work" href="#">
								<div class="work-grid" style="background-image:url('image/Dusan.png');">
									<div class="inner">
										<div class="desc">
											<h3>두산 베어스 / LG 트윈스</h3>
											<span class="cat">서울종합운동장 야구장</span>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>


			<div id="fh5co-started">
				<div class="container">
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2>Get Started</h2>
							<p>We create beautiful themes for your site behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
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
		<script src="/js/jquery.min.js"></script>
		<!-- jQuery Easing -->
		<script src="/js/jquery.easing.1.3.js"></script>
		<!-- Bootstrap -->
		<script src="/js/bootstrap.min.js"></script>
		<!-- Waypoints -->
		<script src="/js/jquery.waypoints.min.js"></script>
		<!-- Main -->
		<script src="/js/main.js"></script>
	</body>
</html>

