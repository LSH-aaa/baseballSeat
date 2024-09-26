<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>QnA 상세화면</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>야구볼래?</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <script src="/js/element_Lee.js"></script>
    <script>
        function displayQnA() {
            let params = new URLSearchParams(window.location.search);
            let id = params.get('id');
            let qna = getQnAById(id);

            if (qna) {
                document.getElementById('title').innerText = qna.title;
                document.getElementById('name').innerText = qna.name;
                document.getElementById('content').innerText = qna.content;
                document.getElementById('writedate').innerText = qna.writedate;
                document.getElementById('readcount').innerText = qna.readcount;
            } else {
                document.getElementById('qnaContent').innerHTML = '<p>존재하지 않는 글입니다.</p>';
            }
        }
    </script>
</head>
<body onload="displayQnA()">
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
                        <li><a href="location.jsp">위치</a></li>
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
        <br>
        <h1 style="text-align: center">QnA 상세보기</h1>
        <div id="qnaContent" style="text-align: center">
            <h4 id="title">${board.title}</h4>
            <br>
            <p>작성자: <span id="name">${board.nickname}</span></p>
            <p>작성일: <span id="writedate"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.writedate}" /></span></p>
            <p>조회수: <span id="readcount">${board.readcount}</span></p>
            <br>
            <p>내용</p>
            <p id="content"><textarea rows="10" cols="40" readonly>${board.content}</textarea></p>
        </div>
        <hr/>
        <div style="text-align: center">
            <a href="/QnAList" class="no-hover">목록으로 돌아가기</a> |
            <a href="/QnAUpdate?num=${board.num}" class="no-hover">수정하기</a> |
            <a href="/QnADelete?num=${board.num}" class="no-hover">삭제하기</a>
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
