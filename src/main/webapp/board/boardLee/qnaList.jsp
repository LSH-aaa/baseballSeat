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
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div id="page">
        <!--내비게이션 -->
        <nav class="fh5co-nav" role="navigation">
            <div class="container">
                <div class="fh5co-top-logo">
                    <div id="fh5co-logo"><a href="/baseballGive">⚾야구볼래?</a></div>
                </div>
                <div class="fh5co-top-menu menu-1 text-center">
                    <ul>
                        <!--좌석 -->
                        <li class="has-dropdown">
                            <a href="/seat">좌석</a>
                            <ul class="dropdown">
                                <li><a href="/seatDetail?team=Lotte">롯데 자이언츠</a></li>
                                <li><a href="/seatDetail?team=Samsung">삼성 라이온즈</a></li>
                                <li><a href="/seatDetail?team=KIA">기아 타이거즈</a></li>
                                <li><a href="/seatDetail?team=Hanhwa">한화 이글스</a></li>
                                <li><a href="/seatDetail?team=NC">NC 다이노스</a></li>
                                <li><a href="/seatDetail?team=KT">KT 위즈</a></li>
                                <li><a href="/seatDetail?team=SSG">SSG 랜더스</a></li>
                                <li><a href="/seatDetail?team=LD">LG 트윈스/두산 베어스</a></li>
                                <li><a href="/seatDetail?team=Kium">키움 히어로즈</a></li>
                            </ul>
                        </li>
                        <!--게시판 드랍다운 -->
                        <li class="has-dropdown">
                            <a href="#">게시판</a>
                            <ul class="dropdown">
                                <li><a href="/board/list?type=Y">양도 게시판</a></li>
                                <li><a href="/board/list?type=B">분실물 게시판</a></li>
                                <li><a href="/QnAList">Q&A 게시판</a></li>
                            </ul>
                        </li>
                        <!--about=위치-->
                        <li><a href="/location">위치</a></li>
                        <!--contact = 로그인/회원가입-->
                        <c:choose>
                            <c:when test="${sessionScope.id != null}">
                                <li><a href="/board/logout">로그아웃</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="has-dropdown">
                                    <a href="#">로그인/회원가입</a>
                                    <ul class="dropdown">
                                        <li><a href="/board/login">로그인</a></li>
                                        <li><a href="/board/register">회원가입</a></li>
                                    </ul>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <li><a href="#" onclick="alert('⚠️공사중⚠️')">마이페이지</a></li>
                    </ul>
                </div>
                <div class="fh5co-top-social menu-1 text-right">
                    <ul class="fh5co-social">
                        <li><a href="#"><i class="icon-twitter"></i></a></li>
                        <li><a href="#"><i class="icon-dribbble"></i></a></li>
                        <li><a href="#"><i class="icon-github"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- QnA 게시판 리스트 -->
        <div id="fh5co-work">
            <div class="container_board">
                <div class="col-md-12">
                    <h3 class="title animate-box">QnA 게시판</h3>
                </div>
                <div class="header">
                    <div>
                        <input type="button" value="게시글 작성" onclick="location.href='/QnAWrite'">
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
                            <th class="col">제목</th>
                            <th class="col">내용</th>
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
                                <td class="col">
                                    <a class="no-hover" href="/QnAView?num=${board.num}"
                                       style="color: darkturquoise;"><b>${board.title}</b></a>
                                </td>
                                <td class="col">${board.content}</td>
                                <td class="col">${board.name}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.writedate}" /></td>
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
                                <a class="page-link ${pageHandler.currPage == 1 ? "disabled" : ""}" href="/board/list?currPage=1&type=${type}">처음으로</a>
                            </li>
                            <c:if test="${pageHandler.showPrev}">
                                <li class="page-item">
                                    <a class="page-link" href="/board/list?currPage=${pageHandler.beginPage - 1}&type=${type}">이전</a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="${pageHandler.beginPage}" end="${pageHandler.endPage}">
                                <li class="page-item ${pageHandler.currPage == i ? "active" : ""}">
                                    <a class="page-link" href="/board/list?currPage=${i}&type=${type}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageHandler.showNext}">
                                <li class="page-item">
                                    <a class="page-link" href="/board/list?currPage=${pageHandler.endPage + 1}&type=${type}">다음</a>
                                </li>
                            </c:if>
                            <li class="page-item">
                                <a class="page-link" href="/board/list?currPage=${pageHandler.totalPage}&type=${type}">마지막으로</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- 기업광고 부분 -->
        <div id="fh5co-author" class="fh5co-bg-section">
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>야구볼래와 함께 하는 기업들</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="author">
                            <div class="author-inner animate-box" style="background-image: url('../../image/불닭볶음면.png');">
                            </div>
                            <div class="desc animate-box">
                                <span>Developers</span>
                                <h3>TEAM 모여봐요 과제의 숲</h3>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                <p><a href="/location" class="btn btn-primary btn-outline">Learn More</a></p>
                                <ul class="fh5co-social-icons">
                                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                                    <li><a href="#"><i class="icon-dribbble"></i></a></li>
                                    <li><a href="#"><i class="icon-github"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="fh5co-started">
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Join our crew!</h2>
                        <p>We are waiting for our new crew members! DON'T HESITATE just GO!</p>
                        <p><a href="#" class="btn btn-primary">Let's work together</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 푸터 -->
        <footer id="fh5co-footer" role="contentinfo">
            <div class="container">
                <div class="row copyright">
                    <div class="col-md-12 text-center">
                        <p>
                            <small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small>
                            <small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a> &amp; <a href="http://blog.gessato.com/" target="_blank">Gessato</a></small>
                        </p>
                        <ul class="fh5co-social-icons">
                            <li><a href="#"><i class="icon-twitter"></i></a></li>
                            <li><a href="#"><i class="icon-facebook"></i></a></li>
                            <li><a href="#"><i class="icon-linkedin"></i></a></li>
                            <li><a href="#"><i class="icon-dribbble"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <div class="gototop js-top">
        <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
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
