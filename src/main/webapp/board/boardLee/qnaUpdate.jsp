<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA 게시판</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css">
    <!-- 게시판 css -->
    <link rel="stylesheet" href="../../css/board.css">
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
                <div id="fh5co-logo"><a href="/baseballGive">⚾야구볼래?</a></div>
            </div>
            <div class="fh5co-top-menu menu-1 text-center">
                <ul>
                    <!--좌석 -->
                    <li class="has-dropdown">
                        <a href="/seat">좌석</a>
                        <ul class="dropdown">
                            <li><a href="/seatDetail?team=Lotte">롯데 자이언츠</a></li>
                            <li><a href="/seatDetail?team=Samsung">삼성 라이온즈</a></li>
                            <li><a href="/seatDetail?team=KIA">기아 타이거즈</a></li>
                            <li><a href="/seatDetail?team=Hanhwa">한화 이글스</a></li>
                            <li><a href="/seatDetail?team=NC">NC 다이노스</a></li>
                            <li><a href="/seatDetail?team=KT">KT 위즈</a></li>
                            <li><a href="/seatDetail?team=SSG">SSG 랜더스</a></li>
                            <li><a href="/seatDetail?team=LD">LG 트윈스/두산 베어스</a></li>
                            <li><a href="/seatDetail?team=Kium">키움 히어로즈</a></li>
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
                    <!--about = 위치-->
                    <li><a href="/location">위치</a></li>
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
    <!-- QnA 게시글 수정 -->
    <div id="wrap" align="center">
        <br><br>
        <h2>QnA 수정</h2>
        <form action="/QnAUpdate" method="post">
            <input type="hidden" name="num" value="${board.num}">
            <input type="hidden" name="id" value="${board.id}">
            <table>
                <tr>
                    <th>작성자</th>
                    <td><input type="text" name="name" value="${board.nickname}" readonly></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" size="70" value="${board.title}"> * 필수</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea cols="70" rows="15" name="content">${board.content}</textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="submit" value="수정" onclick="location.href='/QnAView'">
            <input type="reset" value="다시 작성">
            <input type="button" value="목록" onclick="location.href='/QnAList'">
        </form>
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