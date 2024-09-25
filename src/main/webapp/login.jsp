<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
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
    <!-- 네비게이션 -->
        <nav class="fh5co-nav" role="navigation">
            <div class="container">
                <div class="fh5co-top-logo">
                    <div id="fh5co-logo"><a href="/baseballGive">야구볼래?</a></div>
                </div>
                <div class="fh5co-top-menu menu-1 text-center">
                    <ul>
                        <!--좌석 -->
                        <li><a href="/seat.jsp">좌석</a></li>
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
                                        <input type="text" id="id" name="id" class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="pass">비밀번호</label>
                                        <input type="password" name="pwd" id="pass" class="form-control">
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
        <!-- 푸터 -->
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
<script type="text/javascript" src="/js/members.js"></script>
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