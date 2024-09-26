<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24. 9. 19.
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
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
    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
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
        <%@include file="header.jsp"%>
        <!-- 회원가입 폼 -->
        <div id="fh5co-contact" class="formM">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="col-md-7 animate-box">
                            <h3>회원가입</h3>
                            <form action="/board/register" method="post">
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="name">이름</label>
                                        <input type="text" id="name" name="name" class="form-control">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="id">아이디 <small>*필수</small></label>
                                        <input type="text" name="id" id="id" class="form-control">
                                        <input type="button" value="중복확인" id="check_id" class="btn btn-primary" onclick="idCheck()">
                                        <span id="check_result"></span>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="pwd_1">비밀번호</label>
                                        <input type="password" id="pwd_1" name="pwd" class="form-control">
                                    </div>
                                    <div class="col-md-12">
                                        <label for="pwd_2">비밀번호 확인</label>
                                        <input type="password" id="pwd_2" name="pwd_check" class="form-control" >
                                        <span id="check_MSG"></span>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="email">이메일</label>
                                        <input type="text" id="email" name="email" class="form-control" >
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <label for="nickname">닉네임</label>
                                        <input type="text" id="nickname" name="nickname" class="form-control" >
                                    </div>
                                </div>
                                <br>
                                <button value="submit" id="join" class="form-control" onclick="return registerCheck()">회원가입</button>
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
