<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA 게시판</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <!--내비게이션 -->
    <nav class="fh5co-nav" role="navigation">
        <div class="container">
            <div class="fh5co-top-logo">
                <div id="fh5co-logo"><a href="/baseballGive">야구볼래?</a></div>
            </div>
            <div class="fh5co-top-menu menu-1 text-center">
                <ul>
                    <!--좌석 -->
                    <li class="has-dropdown">
                        <a href="seat.jsp">좌석</a>
                        <ul class="dropdown">
                            <li><a href="seat_detail_Lotte.jsp">롯데 자이언츠</a></li>
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
                            <li><a href="/QnAList">Q&A 게시판</a></li>
                        </ul>
                    </li>
                    <!--about=위치-->
                    <li><a href="/location.jsp">위치</a></li>
                    <!--contact = 로그인/회원가입-->
                    <li><a href="/board/login">로그인/회원가입</a></li>
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
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="title animate-box">QnA 게시판</h3>
                        </div>
                        <span><a href="/QnAWrite" class="no-hover">글 작성하기</a></span>
                        <br>
                        <hr/>
                        <table border="1">
                            <thead>
                            <tr>
                                <th>제목</th>
                                <th>내용</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                            </thead>
                            <tbody id="qnaTableBody">
                            <c:if test="${qna.size() <= 0}">
                                <tr>
                                    <td colspan="5" style="text-align: center;">표시될 내용이 없습니다.</td>
                                </tr>
                            </c:if>
                            <c:forEach var="board" items="${qna}">
                                <tr>
                                    <td>
                                        <a class="no-hover" href="/QnAView?num=${board.num}"
                                           style="color: darkturquoise;"><b>${board.title}</b></a>
                                    </td>
                                    <td>${board.content}</td>
                                    <td>${board.name}</td>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.writedate}" /></td>
                                    <td>${board.readcount}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
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
