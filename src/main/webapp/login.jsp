<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 20.
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css">
    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>

</head>
<body>
    <div class="fh5co-loader"></div>
    <div id="page">
        <%@include file="header.jsp"%>
        <!--로그인 폼 -->
        <div id="fh5co-contact" class="formM">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="col-md-7 animate-box">
                            <h3>로그인</h3>
                            <form action="/board/login" method="post">
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="id">아이디</label>
                                        <input type="text" id="id" name="id" class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="pass">비밀번호</label>
                                        <input type="password" name="pwd" id="pass" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button value="submit" onclick="return loginCheck()" class="btn btn-primary">LOGIN</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </div>
<script type="text/javascript" src="/js/members.js"></script>
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