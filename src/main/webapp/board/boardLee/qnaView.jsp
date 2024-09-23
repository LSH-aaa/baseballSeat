<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-09-19
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA 상세화면</title>
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
    <link rel="stylesheet" href="/css/main.css">
</head>
<body onload="displayQnA()">
<header id="header">
    <h2 style="text-align: left; text-decoration-style: wavy">
        <a href="/main" class="no-hover"
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
    <h1>QnA 상세보기</h1>
    <div id="qnaContent">
        <h4 id="title">${board.title}</h4>
        <br>
        <p>작성자: <span id="name">${board.name}</span></p>
        <p>작성일: <span id="writedate"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.writedate}" /></span></p>
        <p>조회수: <span id="readcount">${board.readcount}</span></p>
        <br>
        <p>내용</p>
        <p id="content">${board.content}</p>
    </div>
    <hr/>
    <a href="/QnAList" class="no-hover">목록으로 돌아가기</a>
    <a href="/QnAUpdate?num=${board.num}" class="no-hover">수정하기</a>
    <a href="/QnADelete?num=${board.num}" class="no-hover">삭제하기</a>
</section>
<footer id="footer">
    <p>배너 광고 문의,</p>
    <p>오류 제보는 언제든 메일 남겨주세요!</p>
    <p>(추첨을 통해 기프티콘 제공)</p>
    <p><b>baseballGive@naver.com</b></p>
</footer>
</body>
</html>
