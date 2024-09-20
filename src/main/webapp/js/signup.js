//비밀번호 재확인 검사


//회원가입 유효성 겁사
function signupCheck() {
    const nameTag = document.querySelector("form[name = name]");
    const idTag = document.querySelector("form[name = id]");

    if(nameTag.value.length <= 0) {
        alert("이름을 입력해주세요.");
        nameTag.focus();
        return false;
    }

    if(idTag.value.length <= 0) {
        alert("id를 입력해주세요.")
        idTag.focus();
        return false;
    }
    return true;
    
}

