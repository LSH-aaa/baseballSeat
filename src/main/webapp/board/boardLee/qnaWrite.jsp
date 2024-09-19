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
    <title>QnA 글쓰기</title>
    <script src="element.js"></script>
    <script>
        function submitQnAForm() {
            let title = document.getElementById('title').value;
            let content = document.getElementById('content').value;
            let author = document.getElementById('author').value;
            addQnA(title, content, author);
            alert('글이 작성되었습니다!');
            window.location.href = 'qnaList.jsp'; // 작성 후 목록으로 이동
        }
    </script>
    <link rel="stylesheet" href="/css/main.css">
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
                    <li><a href="#">양도 게시판</a></li>
                    <li><a href="#">분실물 게시판</a></li>
                    <li><a href="#">QnA 게시판</a></li>
                </ul>
            </span>
        <a href="#" style="letter-spacing: 3px; font-size: large;">날씨</a>
        <a href="#" style="letter-spacing: 3px; font-size: large;">로그인/회원가입</a>
        <a href="#" style="letter-spacing: 3px; font-size: large;">마이페이지</a>
    </nav>
</header>
<section id="contents">
    <h1>QnA 글 작성</h1>
    <form onsubmit="submitQnAForm(); return false;">
        <label for="title">제목: </label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="content">내용: </label><br>
        <textarea id="content" name="content" rows="10" cols="50" required></textarea><br><br>

        <label for="author">작성자(이름): </label>
        <input type="text" id="author" name="author" required><br><br>

        <input type="submit" value="작성하기">
    </form>
</section>
<footer id="footer">
    <p>배너 광고 문의,</p>
    <p>오류 제보는 언제든 메일 남겨주세요!</p>
    <p>(추첨을 통해 기프티콘 제공)</p>
    <p><b>baseballGive@naver.com</b></p>
</footer>

</body>
</html>
