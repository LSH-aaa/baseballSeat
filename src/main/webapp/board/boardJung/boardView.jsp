<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-20
  Time: 오후 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/board.css">
    <link rel="stylesheet" href="../css/main.css">
    <script type="text/javascript" src="../js/board.js"></script>
</head>
<body>
    <header id="header">
        <h2 style="text-align: left; text-decoration-style: wavy">
            <a href="/baseballGive/main" class="no-hover"
               style="font-family: Bahnschrift; color: darkblue;">야좌양</a>
            <span style="font-size: 50px; color: coral">(야구 좌석 양도)</span>
        </h2>
        <nav style="text-align: right">
            <a href="#" style="letter-spacing: 3px; font-size: large;">좌석</a>
            <span class="nav-item">
                    <a href="#" class="dropdown-link" style="letter-spacing: 3px; font-size: large;">게시판 ⬇</a>
                    <ul class="dropdown-menu">
                        <li><a href="/board/list?type=Y">양도 게시판</a></li>
                        <li><a href="/board/list?type=B">분실물 게시판</a></li>
                        <li><a href="/board/boardLee/qnaList.jsp">QnA 게시판</a></li>
                    </ul>
                </span>
            <a href="#" style="letter-spacing: 3px; font-size: large;">날씨</a>
            <a href="#" style="letter-spacing: 3px; font-size: large;">로그인/회원가입</a>
            <a href="#" style="letter-spacing: 3px; font-size: large;">마이페이지</a>
        </nav>
    </header>
    <table>
        <tr>
            <th>작성자</th>
            <td>${board.nickname}</td>
            <th>아이디</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>
                <fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${board.writedate}"></fmt:formatDate>
            </td>
            <th>조회수</th>
            <td>${board.readcount}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${board.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3"><pre>${board.content}</pre></td>
        </tr>
    </table>
    <br><br>
    <input type="button" value="게시글 수정" onclick="location.href='/board/update?num=${board.num}'">
    <input type="button" value="게시글 삭제" onclick="return checkDelete('/board/delete?num=${board.num}')">
    <input type="button" value="목록" onclick="location.href='/board/list'">
    <footer id="footer">
        <p>배너 광고 문의,</p>
        <p>오류 제보는 언제든 메일 남겨주세요!</p>
        <p>(추첨을 통해 기프티콘 제공)</p>
        <p><b>baseballGive@naver.com</b></p>
    </footer>
</body>
</html>
