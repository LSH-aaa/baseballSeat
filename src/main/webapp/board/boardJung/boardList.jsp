<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 13.
  Time: 오후 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <td>
                <a>게시글 등록</a>
            </td>
        </tr>
        <tr>
            <th>번호</th>
            <th>TYPE</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:if test="${boardList.size() <= 0}">
            <tr>
                <td colspan="5" style="text-align: center">표시할 내용이 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach var="board" items="${boardList}">
            <tr>
            <td>${board.num}</td>
            <td>${board.type}</td>
            <td>${board.title}</td>
            <td>${board.nickname}</td>
            <td><fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${board.writedate}"/></td>
            <td>${board.readcount}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
