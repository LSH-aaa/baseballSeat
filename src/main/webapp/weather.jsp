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
                        <li><a href="weather.jsp">날씨</a></li>
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

        <div id="fh5co-author">
            <div class="container">
                <div class="row top-line animate-box">
                    <div class="col-md-6 col-md-offset-3 col-md-push-2 text-left fh5co-heading">
                        <h2>About Me</h2>
                        <h3>Free html5 templates Made by <a href="http://freehtml5.co/" target="_blank">freehtml5.co</a></h3>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="author">
                            <div class="author-inner animate-box" style="background-image: url(images/person3.jpg);">
                            </div>
                            <div class="desc animate-box">
                                <span>Web Designer &amp; Developer</span>
                                <h3>Mike Airways</h3>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                <p>Far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                <ul class="fh5co-social-icons">
                                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                                    <li><a href="#"><i class="icon-dribbble"></i></a></li>
                                    <li><a href="#"><i class="icon-github"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="title animate-box">My Services</h3>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                    <span class="icon">
                                        <i class="icon-brush"></i>
                                    </span>
                                    <h3>Web Design</h3>
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
                                    <p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                    <span class="icon">
                                        <i class="icon-cog"></i>
                                    </span>
                                    <h3>Web Development</h3>
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
                                    <p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6">
                                <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                    <span class="icon">
                                        <i class="icon-briefcase"></i>
                                    </span>
                                    <h3>Branding</h3>
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
                                    <p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="feature-center animate-box" data-animate-effect="fadeIn">
                                    <span class="icon">
                                        <i class="icon-camera"></i>
                                    </span>
                                    <h3>Photography</h3>
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
                                    <p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <h3 class="title animate-box">My Skills</h3>
                                <div class="row">
                                    <div class="col-md-6 animate-box skills">
                                        <h3>Designing</h3>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                                100%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 animate-box skills">
                                        <h3>HTML5/CSS3</h3>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width:95%">
                                                95%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 animate-box skills">
                                        <h3>jQuery</h3>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%">
                                                80%
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 animate-box skills">
                                        <h3>WordPress</h3>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width:90%">
                                                90%
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

