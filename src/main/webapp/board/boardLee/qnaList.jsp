<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-09-19
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA 게시판</title>
    <script src="/js/element_Lee.js"></script>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
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
    <h1>QnA 게시판</h1>
    <br>
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
</section>
<footer id="footer">
    <p>배너 광고 문의,</p>
    <p>오류 제보는 언제든 메일 남겨주세요!</p>
    <p>(추첨을 통해 기프티콘 제공)</p>
    <p><b>baseballGive@naver.com</b></p>
</footer>
</body>
</html>
