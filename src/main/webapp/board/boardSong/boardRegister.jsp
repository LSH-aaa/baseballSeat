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
    <title>회원가입/로그인</title>
    <link rel="stylesheet" href="/css/register.css">
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
    <div>
        <form action="/board/register" method="post">
            <h3>회원가입</h3>
            <h4>이름 <small>*필수</small></h4>
            <fieldset>
                <input type="text" name="name" placeholder="이름">
            </fieldset>

            <h4>아이디 <small>*필수</small></h4>
            <fieldset>
                <input type="text" name="id" id="id" placeholder="아이디">
                <input type="button" value="중복확인" id="check_id" onclick="idCheck()">
                <span id="check_result"></span>
            </fieldset>

            <h4>비밀번호 <small>*필수</small></h4>
            <fieldset>
                <input type="password" id="pwd_1" class="pw" name="pwd" placeholder="비밀번호">
                <input type="password" id="pwd_2" class="pw" name="pwd_check" placeholder="비밀번호 확인">
                <span id="check_MSG"></span>
            </fieldset>

            <h4>이메일</h4>
            <fieldset>
                <input type="text" name="email" placeholder="이메일">
            </fieldset>

            <h4>닉네임</h4>
            <fieldset>
                <input type="text" name="nickname" placeholder="닉네임">
            </fieldset>
            <br>
            <button type="submit" onclick="registerCheck()">가입하기</button>
        </form>
    </div>

</body>
</html>
