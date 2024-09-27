//회원가입 유효성 겁사
function registerCheck() {
    const nameTag = document.querySelector("input[name = name]");
    const idTag = document.querySelector("input[name = id]");
    const passTag = document.querySelector("input[class = pw]");

    if(nameTag.value.length <= 0) {
        alert("이름을 입력해주세요.");
        nameTag.focus();
        return false;
    }

    if(idTag.value.length <= 0) {
        alert("아이디를 입력해주세요.");
        nameTag.focus();
        return false;
    }

    if(passTag.value.length <= 0) {
        alert("비밀번호를 입력해주세요.");
        nameTag.focus();
        return false;
    }
    return true;
}

//로그인 유효성 검사
function loginCheck(){
    const idTag = document.querySelector("input[ name = id ]");
    const pwdTag = document.querySelector("input[ name = pwd]");

    if(idTag.value.length <= 0 ){
        alert("아이디를 입력해주세요!");
        idTag.focus();
        return false;
    }

    if(pwdTag.value.length <= 0){
        alert("비밀번호를 입력해주세요!");
        pwdTag.focus();
        return false;
    }
    return true;
}

//비밀번호 재확인
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