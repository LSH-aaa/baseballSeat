<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>위치</title>
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
    <!-- 지도 CSS 추가 -->
    <style>
        #map {
            height: 500px;
            width: 100%;
        }
    </style>
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
        <!-- 위치 내용 -->
        <div id="fh5co-author">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="col-md-5 col-md-pull-1 animate-box">
                        <div class="fh5co-contact-info">
                            <h3 id="location-title">롯데 자이언츠</h3>
                            <ul id="baseballTeam">
                                <li><a href="#" onclick="changeLocation('롯데 자이언츠', { lat: 35.1940, lng: 129.0615 })">롯데 자이언츠</a></li>
                                <li><a href="#" onclick="changeLocation('한화 이글스', { lat: 36.3170832, lng: 127.4265596 })">한화 이글스</a></li>
                                <li><a href="#" onclick="changeLocation('삼성 라이온즈', { lat: 35.841941, lng: 128.681732 })">삼성 라이온즈</a></li>
                                <li><a href="#" onclick="changeLocation('기아 타이거즈', { lat:35.1681286, lng: 126.8865307 })">기아 타이거즈</a></li>
                                <li><a href="#" onclick="changeLocation('KT 위즈', { lat:37.2997595, lng:  127.0070936})">KT 위즈</a></li>
                                <li><a href="#" onclick="changeLocation('키움 히어로즈', { lat: 37.4973605, lng: 126.8639477 })">키움 히어로즈</a></li>
                                <li><a href="#" onclick="changeLocation('SSG 랜더스', { lat: 37.4370465 , lng: 126.6906868 })">SSG 랜더스</a></li>
                                <li><a href="#" onclick="changeLocation('NC 다이노스', { lat:35.22  , lng:128.58 })">NC 다이노스</a></li>
                                <li><a href="#" onclick="changeLocation('LG 트윈스/두산 베어스', { lat: 37.51 , lng:127.07 })">LG 트윈스 / 두산 베어스</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-7 animate-box">
                        <h3 style="font-family: 'Giants-Bold'">위치</h3>
                        <form action="#">
                            <div class="row form-group">
                                <!-- 지도가 들어가는 영역 -->
                                <div id="map"></div>
                            </div>
                        </form>
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

    <!-- 스크립트 추가 -->
    <script>
        let map;

        function initMap() {
            var location = { lat: 35.1940, lng: 129.0615 }; // 기본 위치
            map = new google.maps.Map(document.getElementById("map"), {
                zoom: 15,
                center: location
            });

            // 페이지 로드 시 기본값 설정
            changeLocation('롯데 자이언츠', location);
        }

        function changeLocation(title, coordinates) {
            // 제목 업데이트
            document.getElementById('location-title').innerText = title;

            // 지도 위치 업데이트
            map.setCenter(coordinates);
            map.setZoom(16); // 필요에 따라 줌 레벨 조정
        }

        // Google Maps Api 불러오기
        document.addEventListener("DOMContentLoaded", function() {
            const script = document.createElement('script');
            script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyDwbIWXfDCdEIBD2WK1b4Vg5YYdy0ufX_4&callback=initMap";
            script.async = true;
            document.body.appendChild(script);
        });
    </script>

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

