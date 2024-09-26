<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-09-19
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>QnA 게시판 글쓰기</title>
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
        <!-- QnA 게시판 글쓰기 -->
        <div id="fh5co-work">
            <div class="container_board">
                <div class="col-md-12">
                    <h3 class="title animate-box">QnA 작성하기</h3>
                </div>
                <form action="/QnAWrite" method="post">
                    <table>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" id="title" name="title" required></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea id="content" cols="70" rows="15" name="content"></textarea>
                            </td>
                        </tr>
                    </table>
                    <br><br>
                    <input type="submit" value="작성하기">
                    <input type="button" value="목록" onclick="location.href='/QnAList'">
                </form>
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