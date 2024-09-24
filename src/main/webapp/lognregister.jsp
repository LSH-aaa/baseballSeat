<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Shift &mdash; Free Website Template, Free HTML5 Template by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="fh5co-top-logo">
					<div id="fh5co-logo"><a href="main.jsp">Shift</a></div>
				</div>
				<div class="fh5co-top-menu menu-1 text-center">
					<ul>
						<!--좌석 -->
						<li><a href="seat.jsp">좌석</a></li>
						<!--게시판 드랍다운 -->
						<li class="has-dropdown">
							<a href="#">게시판</a>
							<ul class="dropdown">
								<li><a href="/board/list?type=Y">양도 게시판</a></li>
								<li><a href="/board/list?type=F">분실물 게시판</a></li>
								<li><a href="/board/boardLee/qnaList.jsp">Q&A 게시판</a></li>
							</ul>
						</li>
						<!--about=날씨-->
						<li><a href="location.jsp">날씨</a></li>
						<!--contact = 로그인/회원가입-->
						<li><a href="lognregister.jsp">로그인/회원가입</a></li>
						<li><a href="#">마이페이지</a></li>
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
	
		<div id="fh5co-contact">
			<div class="container">
				<div class="row top-line animate-box">
					<div class="col-md-6 col-md-offset-3 col-md-push-2 text-left fh5co-heading">
						<h2>로그인</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="col-md-7 animate-box">
							<h3>Get In Touch</h3>
							<form action="#">
								<div class="row form-group">
									<div class="col-md-12">
										<label for="fname">Your Name</label>
										<input type="text" id="fname" class="form-control">
									</div>
								</div>

								<div class="row form-group">
									<div class="col-md-12">
										<label for="email">Email</label>
										<input type="text" id="email" class="form-control">
									</div>
								</div>

								<div class="row form-group">
									<div class="col-md-12">
										<label for="message">Message</label>
										<textarea name="message" id="message" cols="30" rows="10" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<input type="submit" value="Send Message" class="btn btn-primary">
								</div>

							</form>
						</div>
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
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

