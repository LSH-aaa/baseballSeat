<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA Update</title>
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
    <div class="fh5co-loader"></div>
    <div id="page">
        <%@include file="/header.jsp"%>
        <!-- QnA 게시글 수정 -->
        <div id="wrap" align="center">
            <br><br>
            <h2>QnA 수정</h2>
            <form action="/QnAUpdate" method="post">
                <input type="hidden" name="num" value="${board.num}">
                <input type="hidden" name="id" value="${board.id}">
                <table>
                    <tr>
                        <th>작성자</th>
                        <td><input type="text" name="name" value="${board.nickname}" readonly></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" size="70" value="${board.title}"> * 필수</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea cols="70" rows="15" name="content">${board.content}</textarea>
                        </td>
                    </tr>
                </table>
                <br><br>
                <input type="submit" value="수정" onclick="location.href='/QnAView'">
                <input type="button" value="목록" onclick="location.href='/QnAList'">
            </form>
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