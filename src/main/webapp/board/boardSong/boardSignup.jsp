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
    <script>
        $('.pw').keyup(function(){
            let pass1 = $("#password_1").val();
            let pass2 = $("#password_2").val();

            if(pass1 != "" || pass2 != ""){
                if(pass1 == pass2){
                    $("#pwd_check").html('비밀번호가 일치합니다.');
                    $("#pwd_check").attr('color','green');
                } else {
                    $("#pwd_check").html('비밀번호가 일치하지 않습니다!!');
                    $("#pwd_check").attr('color', 'red');
                }
            }
        })
    </script>
</head>
<body>
    <div>
        <form action="/board/signup" method="post">
            <h3>회원가입</h3>
            <p><input type="text" name="name" placeholder="이름"> *필수</p>
            <p><input type="text" name="id" placeholder="아이디"> *필수</p>
            <p><input type="password" id="pwd" class="pw" name="pwd" placeholder="비밀번호"> *필수</p>
            <p>
                <input type="password" name="pwd_check" class="pw" placeholder="비밀번호 확인"> *필수
                <span id="pwd_check"></span>
            </p>

            <p><input type="text" name="email" placeholder="이메일"></p>
            <p><input type="text" name="nickname" placeholder="닉네임"></p>
            <br>
            <input type="submit" value="제출하기" onclick="return signupCheck()">
        </form>
    </div>
</body>
</html>
