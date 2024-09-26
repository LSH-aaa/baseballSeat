<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>좌석상세_LD</title>
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
		<!-- 좌석 디테일 -->
		<div id="fh5co-author">
			<div class="container">
				<div class="row top-line animate-box">
					<div class="col-md-6 col-md-offset-3 col-md-push-2 text-left fh5co-heading">
						<h2 class="addfont">LG 트윈스 / 두산 베어스</h2>
						<h4 class="addfont"><small>서울 잠실 야구장</small></h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<p class="animate-box"><img src="/image/lotte_seat_detail.png" class="img-responsive" alt="Free HTML5 Template by FreeHTML5.co"></p>
						<div class="row row-pt-md portfolio-navigation">
							<div class="col-xs-4 text-left">
								<a href="/seatDetail?team=SSG" class="btn btn-primary btn-outline"><i class="icon-chevron-left"></i> Prev </a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="/seat" class="btn btn-primary btn-outline"><i class="icon-grid2"></i> View All</a>
							</div>
							<div class="col-xs-4 text-right">
								<button class="btn btn-primary btn-outline" disabled>Next <i class="icon-chevron-right"></i></button>
							</div>
						</div>
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

