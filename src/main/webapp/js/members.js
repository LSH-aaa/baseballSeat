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