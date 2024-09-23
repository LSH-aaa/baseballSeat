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
</head>
<body>
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
    <input type="button" value="게시글 수정" onclick="location.href='/board/update'">
    <input type="button" value="게시글 삭제" onclick="location.href='/board/delete'">
    <input type="button" value="목록" onclick="location.href='/board/list'">
</body>
</html>
