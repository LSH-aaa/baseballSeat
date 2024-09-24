<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 19.
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
    <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="FreeHTML5.co" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        //아이디 중복 검사
        function idCheck(){
                let input_id = document.querySelector("#id").value;
                let checkMSG = document.querySelector("#check_result");

                if(input_id.length > 0){
                    $.ajax({
                        type : "post",
                        url : "/board/checkId",
                        data : { "id" : input_id },
                        dataType : "text",
                        success : function(data){
                            let result = data.trim();
                            console.log(result);
                                if(result === "0"){
                                    $("#check_result").text("사용가능한 아이디 입니다.");
                                } else if (result === "1") {
                                    checkMSG.innerHTML = "이미 존재하는 아이디입니다.";
                                } else {
                                    $("#check_result").text("사용할 수 없는 아이디 입니다.")
                                }
                            },
                        error : function(){
                            console.log("서버 요청 실패");
                        }
                    });
                } else if(input_id == ""){
                    document.querySelector("#check_result").textContent= "아이디를 입력해주세요." ;
                    document.querySelector("#id").focus();
                    return false;
                }
        }

        //비밀번호 중복 검사 -> js로 빼기
        window.onload = function(){
            // 비밀번호, 확인 비밀번호, 확인메시지 태그 받기
            let pwd = document.querySelector("#pwd_1");
            let ckPwd = document.querySelector("#pwd_2");
            let checkMSG = document.querySelector("#check_MSG");

            // 각 태그에 변화 시 체크 조건 실행
            ckPwd.onchange = comparePwd;

            // 비밀번호 확인 체크조건
            function comparePwd() {
                if(pwd.value != "" || ckPwd.value != ""){
                    if (pwd.value == ckPwd.value) {
                        checkMSG.style.color = "green" ;
                        checkMSG.innerHTML= "비밀번호가 일치합니다";
                        ckPwd.focus();
                    } else {
                        checkMSG.style.color = "red" ;
                        checkMSG.innerHTML= "비밀번호가 일치하지 않습니다!!";
                        ckPwd.focus();
                    }
                }
            }
        }
    </script>
</head>
<body>
    <div class="fh5co-loader"></div>

    <div id="page">
        <nav class="fh5co-nav" role="navigation">
            <div class="container">
                <div class="fh5co-top-logo">
                    <div id="fh5co-logo"><a href="/baseballGive">야구볼래?</a></div>
                </div>
                <div class="fh5co-top-menu menu-1 text-center">
                    <ul>
                        <!--좌석 -->
                        <li><a href="seat.jsp">좌석</a></li>
                        <!--게시판 드랍다운 -->
                        <li class="has-dropdown">
                            <a href="#">게시판</a>
                            <ul class="dropdown">
                                <li><a href="/board/list?type=Y">양도 게시판</a></li>
                                <li><a href="/board/list?type=F">분실물 게시판</a></li>
                                <li><a href="/board/boardLee/qnaList.jsp">Q&A 게시판</a></li>
                            </ul>
                        </li>
                        <!--about=날씨-->
                        <li><a href="location.jsp">날씨</a></li>
                        <!--contact = 로그인/회원가입-->
                        <li><a href="/board/login">로그인/회원가입</a></li>
                        <li><a href="#">마이페이지</a></li>
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
        <!-- 회원가입 폼 -->
        <div id="fh5co-contact">
            <div class="container">
                <div class="row top-line animate-box">
                    <div class="col-md-6 col-md-offset-3 col-md-push-2 text-left fh5co-heading">
                        <h2>회원가입</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="col-md-7 animate-box">
                            <h3>정보입력</h3>
                            <form action="/board/register" method="post">
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="name">이름</label>
                                        <input type="text" id="name" name="name" placeholder="이름" class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="id">아이디 <small>*필수</small></label>
                                        <input type="text" id="id" placeholder="아이디" class="form-control">
                                        <input type="button" value="중복확인" id="check_id" onclick="idCheck()">
                                        <span id="check_result"></span>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="pwd_1">비밀번호</label>
                                        <input type="password" id="pwd_1" name="pwd" placeholder="비밀번호" class="form-control">
                                        <input type="password" id="pwd_2" class="pw" name="pwd_check" placeholder="비밀번호 확인">
                                        <span id="check_MSG"></span>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="email">이메일</label>
                                        <input type="text" id="email" name="email" class="form-control" placeholder="이메일">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="nickname">닉네임</label>
                                        <input type="text" id="nickname" name="nickname" class="form-control" placeholder="닉네임">
                                    </div>
                                </div>
                                <br>
                                <button value="submit" onclick="return registerCheck()">회원가입</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 푸터 -->
        <div id="fh5co-started">
            <div class="container">
                <div class="row animate-box">
                    <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                        <h2>Get Started</h2>
                        <p>We create beautiful themes for your site behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                        <p><a href="#" class="btn btn-primary">Let's work together</a></p>
                    </div>
                </div>
            </div>
        </div>
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
<script type="text/javascript" src="../../js/members.js"></script>
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
