//회원가입 유효성 겁사
function signupCheck() {
    const nameTag = document.querySelector("form[name=name]");
    const idTag = document.querySelector("form[id = id]");
    const pwdTag = document.querySelector("form[pwd = pwd]");

    if(nameTag.value.length <= 0) {
        alert("이름을 입력해주세요.");
        nameTag.focus();
        return false;
    }

    if(idTag.value.length <= 0) {
        idTag.focus();
        return false;
    }

    if(pwdTag.value.length <= 0) {
        pwdTag.focus();
        return false;
    }
}