<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-09-20
  Time: 오전 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>좌석 배치도</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <header id="header">
        <h2 style="text-align: left; text-decoration-style: wavy">
            <a href="/baseballGive" class="no-hover"
               style="font-family: Bahnschrift; color: darkblue;">야좌양</a>
            <span style="font-size: 50px; color: coral">(야구 좌석 양도)</span>
        </h2>
        <nav style="text-align: right">
            <a href="#" style="letter-spacing: 3px; font-size: large;">좌석</a>
            <span class="nav-item">
                    <a href="#" class="dropdown-link" style="letter-spacing: 3px; font-size: large;">게시판 ⬇</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">양도 게시판</a></li>
                        <li><a href="#">분실물 게시판</a></li>
                        <li><a href="/QnAList">QnA 게시판</a></li>
                    </ul>
                </span>
            <a href="#" style="letter-spacing: 3px; font-size: large;">날씨</a>
            <a href="#" style="letter-spacing: 3px; font-size: large;">로그인/회원가입</a>
            <a href="#" style="letter-spacing: 3px; font-size: large;">마이페이지</a>
        </nav>
    </header>
    <section id="contents">
        <img src="/image/좌석배치도.png" alt="기아 구장 좌석 배치도">
    </section>
    <footer id="footer">
        <p>배너 광고 문의,</p>
        <p>오류 제보는 언제든 메일 남겨주세요!</p>
        <p>(추첨을 통해 기프티콘 제공)</p>
        <p><b>baseballGive@naver.com</b></p>
    </footer>
</body>
</html>
