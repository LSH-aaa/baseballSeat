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
    <script type="text/javascript" src="../js/element.js"></script>
</head>
<body>
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
</body>
</html>
