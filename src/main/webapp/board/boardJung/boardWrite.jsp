<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-09-23
  Time: 오전 9:02
  To change this template use File | Settings | File Templates.
--%>
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
  <form action="/board/write" method="post">
    <table>
      <tr>
      <select name="type">
        <option value="Y">양도하기</option>
        <option value="B">분실물</option>
        <option value="qna">Q&A</option>
      </select>
      </tr>
      <tr>
        <th>아이디</th>
        <td><input type="text" name="id"></td>
      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="title"></td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          <textarea cols="70" rows="15" name="content"></textarea>
        </td>
      </tr>
    </table>
    <br><br>
    <input type="submit" value="등록" onclick="return boardCheck()">
    <input type="reset" value="다시 작성">
    <input type="button" value="목록" onclick="location.href='/board/list'">
  </form>
  <footer id="footer">
    <p>배너 광고 문의,</p>
    <p>오류 제보는 언제든 메일 남겨주세요!</p>
    <p>(추첨을 통해 기프티콘 제공)</p>
    <p><b>baseballGive@naver.com</b></p>
  </footer>
</body>
</html>
