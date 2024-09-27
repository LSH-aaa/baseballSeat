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
	</head>
	<body>
		<div class="fh5co-loader"></div>
		<div id="page">
			<%@include file="/header.jsp"%>
			<!-- 구장 -->
			<div id="fh5co-work">
				<div class="container">
					<div class="row top-line animate-box">
						<div class="col-md-6 col-md-offset-3 col-md-push-2 text-left fh5co-heading" id="seatHead">
							<h2 class="addfont">⚾구장별 좌석 확인⚾<small>(시야사진 73,650장)</small></h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 text-center animate-box">
							<a class="work" id="image-box" href="/seatDetail?team=Lotte">
								<div class="work-grid" style="background-image:url('/image/Lotte.png');">
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
							<a class="work" href="/seatDetail?team=Samsung">
								<div class="work-grid" style="background-image:url('/image/Samsung.png');">
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
							<a class="work" href="/seatDetail?team=KIA">
								<div class="work-grid" style="background-image:url('/image/Kia.png');">
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
							<a class="work" href="/seatDetail?team=Hanhwa">
								<div class="work-grid" style="background-image:url('/image/Hanhwa.png');">
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
							<a class="work" href="/seatDetail?team=NC">
								<div class="work-grid" style="background-image:url('/image/NC.png');">
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
							<a class="work" href="/seatDetail?team=Kium">
								<div class="work-grid" style="background-image:url('/image/Kium.png');">
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
							<a class="work" href="/seatDetail?team=SSG">
								<div class="work-grid" style="background-image:url('/image/SSG.png');">
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
							<a class="work" href="/seatDetail?team=KT">
								<div class="work-grid" style="background-image:url('/image/KT.png');">
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
							<a class="work" href="/seatDetail?team=LD">
								<div class="work-grid" style="background-image:url('/image/Dusan.png');">
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
			<%@include file="/footer.jsp"%>
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

