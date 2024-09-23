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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <input type="button" value="게시글 작성" onclick="location.href='/board/write'">
    <table>
        <tr>
            <th>번호</th>
            <th>카테고리</th>
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
                <td><a href="/board/view?num=${board.num}">${board.title}</a></td>
            <td>${board.nickname}</td>
            <td><fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${board.writedate}"/></td>
            <td>${board.readcount}</td>
            </tr>
        </c:forEach>
    </table>
    <br><br>
    <div class="paging">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link ${pageHandler.currPage == 1 ? "disabled" : ""}" href="/board/list?currPage=1">처음으로</a>
                </li>
                <c:if test="${pageHandler.showPrev}">
                    <li class="page-item">
                        <a class="page-link" href="/board/list?currPage=${pageHandler.beginPage - 1}">이전</a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${pageHandler.beginPage}" end="${pageHandler.endPage}">
                    <li class="page-item ${pageHandler.currPage == i ? "active" : ""}">
                        <a class="page-link" href="/board/list?currPage=${i}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageHandler.showNext}">
                    <li class="page-item">
                        <a class="page-link" href="/board/list?currPage=${pageHandler.endPage + 1}">다음</a>
                    </li>
                </c:if>
                <li class="page-item">
                    <a class="page-link" href="/board/list?currPage=${pageHandler.totalPage}">마지막으로</a>
                </li>
            </ul>
        </nav>
    </div>
</body>
</html>
