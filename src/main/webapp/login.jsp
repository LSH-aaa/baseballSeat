<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 20.
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <!-- 네비게이션 -->
    <nav class="fh5co-nav" role="navigation">
        <div class="container">
            <div class="fh5co-top-logo">
                <div id="fh5co-logo"><a href="/baseballGive">Shift</a></div>
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

    <!--로그인 폼 -->
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
                        <h3>로그인</h3>
                        <form action="/board/login" method="post">
                            <div class="row form-group">
                                <div class="col-md-12">
                                    <label for="id">아이디</label>
                                    <input type="text" id="id" class="form-control">
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <label for="pass">비밀번호</label>
                                    <input type="text" name="pwd" id="pass" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <button value="submit" onclick="return loginCheck()" class="btn btn-primary">LOGIN</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../../js/members.js"></script>
</body>
</html>