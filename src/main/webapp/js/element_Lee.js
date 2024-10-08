// element_Lee.js

// 새로운 QnA 추가하기
function addQnA(title, content, name) {
    let qnaList = loadQnAList();
    let newId = qnaList.length > 0 ? qnaList[qnaList.length - 1].id + 1 : 1;
    let writedate = new Date().toLocaleString();
    let qna = {
        id: newId,
        title: title,
        content: content,
        name: maskName(name),
        writedate: writedate,
        readcount: 0
    };
    qnaList.push(qna);
    saveQnAList(QnAList);
}

// 특정 ID의 QnA 가져오기
function getQnAById(id) {
    let qnaList = loadQnAList();
    return qnaList.find(qna => qna.id === parseInt(id));
}

// QnA 목록을 HTML 테이블에 추가하기
// function displayQnAList() {
//     let qnaList = loadQnAList();
//     // let tableBody = document.getElementById('qnaTableBody');
//     // tableBody.innerHTML = '';
//     //
//     // qnaList.forEach(qna => {
//     //     let row = `<tr>
//     //         <td>${qna.id}</td>
//     //         <td><a href="qnaView.jsp?id=${qna.id}" onclick="increaseView(${qna.id})">${qna.title}</a></td>
//     //         <td>${qna.name}</td>
//     //         <td>${qna.writedate}</td>
//     //         <td>${qna.readcount}</td>
//     //     </tr>`;
//     //     tableBody.innerHTML += row;
//     // });
// }

// 이름을 첫 글자와 마지막 글자를 제외하고 *로 마스킹하는 함수
function maskName(name) {
    if (name.length <= 2) return name; // 이름이 두 글자 이하일 경우 마스킹하지 않음
    return name[0] + '*'.repeat(name.length - 2) + name[name.length - 1];
}