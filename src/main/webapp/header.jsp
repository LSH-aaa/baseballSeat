<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 26.
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>헤더</title>
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
    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
</head>
<body>
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
                        <!--about=위치-->
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
</body>
</html>
