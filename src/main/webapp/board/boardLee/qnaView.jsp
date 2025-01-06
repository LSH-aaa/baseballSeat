<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>QnA View</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">
    <!-- 게시판 css -->
    <link rel="stylesheet" href="../../css/board.css">
    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <script src="/js/element_Lee.js"></script>
    <script>
        function displayQnA() {
            let params = new URLSearchParams(window.location.search);
            let id = params.get('id');
            let qna = getQnAById(id);

            if (qna) {
                document.getElementById('title').innerText = qna.title;
                document.getElementById('name').innerText = qna.name;
                document.getElementById('content').innerText = qna.content;
                document.getElementById('writedate').innerText = qna.writedate;
                document.getElementById('readcount').innerText = qna.readcount;
            } else {
                document.getElementById('qnaContent').innerHTML = '<p>존재하지 않는 글입니다.</p>';
            }
        }
    </script>
</head>
<body onload="displayQnA()">
    <div class="fh5co-loader"></div>
    <div id="page">
        <%@include file="/header.jsp"%>
        <!-- QnA게시판 상세보기 -->
        <div id="fh5co-work">
            <div class="container_board">
                <div class="col-md-12">
                    <h3 class="title animate-box">QnA 게시판</h3>
                </div>
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
                            <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.writedate}" />
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
                        <td style="height: 300px" colspan="3">${board.content}</td>
                    </tr>
                </table>
                <br>
                <c:if test="${sessionScope.id == board.id}">
                    <input type="button" value="게시글 수정" onclick="location.href='/QnAUpdate?num=${board.num}'">
                    <input type="button" value="게시글 삭제" onclick="location.href='/QnADelete?num=${board.num}'">
                </c:if>
                <input type="button" value="목록으로 돌아가기" onclick="location.href='/QnAList'">
            </div>
        </div>
        <%@include file="/footer.jsp"%>
    </div>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Main -->
<script src="js/main.js"></script>
</body>
</html>