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
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
    <header id="header">
        <h2 style="text-align: left; text-decoration-style: wavy">
            <a href="/baseballGive" class="no-hover"
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
    <footer id="footer">
        <p>배너 광고 문의,</p>
        <p>오류 제보는 언제든 메일 남겨주세요!</p>
        <p>(추첨을 통해 기프티콘 제공)</p>
        <p><b>baseballGive@naver.com</b></p>
    </footer>
</body>
</html>
