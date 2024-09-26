<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA 게시판</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css">
    <!-- 게시판 css -->
    <link rel="stylesheet" href="../../css/board.css">
    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
</head>
<body>
    <div id="page">
        <%@include file="/header.jsp"%>
        <!-- QnA 게시판 리스트 -->
        <div id="fh5co-work">
            <div class="container_board">
                <div class="col-md-12">
                    <h3 class="title animate-box">QnA 게시판</h3>
                </div>
                <div class="header">
                    <div>
                        <c:if test="${sessionScope.id != null}">
                            <input type="button" value="게시글 작성" onclick="location.href='/QnAWrite'">
                        </c:if>
                    </div>
                    <!-- 검색 폼 -->
                    <div class="search">
                        <form action="/QnAList" method="post">
                            <input type="hidden" name="currPage" value="${pageHandler.currPage}">
                            <select name="searchType">
                                <option ${searchVO.searchType == "" ? "selected" : ""}>검색 유형 선택</option>
                                <option value="title" ${searchVO.searchType == "title" ? "selected" : ""}>제목</option>
                                <option value="content" ${searchVO.searchType == "content" ? "selected" : ""}>내용</option>
                                <option value="all" ${searchVO.searchType == "all" ? "selected" : ""}>제목 + 내용</option>
                                <option value="name" ${searchVO.searchType == "name" ? "selected" : ""}>작성자</option>
                            </select>
                            <input type="text" name="searchText" id="inputSearch"
                                   placeholder="검색어" value="${searchVO.searchText}">
                            <button type="submit">검색</button>
                        </form>
                    </div>
                </div>
                <!--QnA 게시판 테이블-->
                <table>
                    <thead>
                    <tr>
                        <th class="col">번호</th>
                        <th class="col">제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th class="col">조회수</th>
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
                            <td style="text-align: center">${board.num}</td>
                            <td class="col">
                                <a class="no-hover" href="/QnAView?num=${board.num}"
                                   style="color: darkturquoise;"><b>${board.title}</b></a>
                            </td>
                            <td class="col">${board.nickname}</td>
                            <td style="text-align: center"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.writedate}" /></td>
                            <td class="col">${board.readcount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br/>
                <!-- 페이지네이션 -->
                <div class="paging">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="page-link ${pageHandler.currPage == 1 ? "disabled" : ""}" href="/QnAList?currPage=1&type=qna">처음으로</a>
                            </li>
                            <c:if test="${pageHandler.showPrev}">
                                <li class="page-item">
                                    <a class="page-link" href="/QnAList?currPage=${pageHandler.beginPage - 1}&type=qna">이전</a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${pageHandler.beginPage}" end="${pageHandler.endPage}">
                                <li class="page-item ${pageHandler.currPage == i ? "active" : ""}">
                                    <a class="page-link" href="/QnAList?currPage=${i}&type=qna">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageHandler.showNext}">
                                <li class="page-item">
                                    <a class="page-link" href="/QnAList?currPage=${pageHandler.endPage + 1}&type=qna">다음</a>
                                </li>
                            </c:if>
                            <li class="page-item">
                                <a class="page-link" href="/QnAList?currPage=${pageHandler.totalPage}&type=qna">마지막으로</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp"%>
    </div>

<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Main -->
<script src="/js/main.js"></script>
</body>
</html>