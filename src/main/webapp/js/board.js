// 게시글 유효성 검사(제목, 내용 공란일 시)
function boardCheck() {
    const titleTag = document.querySelector("form [name=title]");
    const contentTag = document.querySelector("form [name=content]");

    if(titleTag.value.length <= 0) {
        alert("제목을 입력해주세요.")
        titleTag.focus();
        return false;
    }
    if(contentTag.value.length <= 0) {
        alert("내용을 입력해주세요.")
        contentTag.focus();
        return false;
    }
    return true;
}

// 삭제 여부
function checkDelete(url) {
    // 삭제여부 yes /board/delete로 이동
    if(confirm("정말 삭제하시겠습니까?")) {
        location.href=url;
    }
    //삭제 여부 no면 아무것도 하지 않음
}