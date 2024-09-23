<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-09-19
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA 수정</title>
    <link rel="stylesheet" href="/css/main.css">
    <script src="/js/element_Lee.js"></script>
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
                    <a href="" class="dropdown-link" style="letter-spacing: 3px; font-size: large;">게시판 ⬇</a>
                    <ul class="dropdown-menu" type="none">
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
        <div id="wrap" align="center">
            <h2>QnA 수정</h2>
            <form action="/QnAUpdate" method="post">
                <input type="hidden" name="num" value="${board.num}">
                <table>
                    <tr>
                        <th>작성자</th>
                        <td><input type="text" name="name" value="${board.name}"> * 필수</td>
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
                <input type="submit" value="수정">
                <input type="reset" value="다시 작성">
                <input type="button" value="목록" onclick="location.href='/QnAList'">
            </form>
        </div>
    </section>
    <footer id="footer">
        <p>배너 광고 문의,</p>
        <p>오류 제보는 언제든 메일 남겨주세요!</p>
        <p>(추첨을 통해 기프티콘 제공)</p>
        <p><b>baseballGive@naver.com</b></p>
    </footer>
</body>
</html>
