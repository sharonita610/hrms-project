const URL = "/hrms/confirm";
const empNo = 1;

// const empNo = login.empNo; =

const roleCode = '11111';
// const roleCode = null;

const confirmBox = document.getElementById('confirm-table');

function getConfirmList(){
    fetch(`${URL}/${empNo}/${roleCode}`)
        .then(res => res.json())
        .then(result => {
            renderConfirmList(result);
        })
}

function renderConfirmList(list){
    let tag = '';
    tag += '<ul class = "header-bar confirm-tr" id = "waiting-th"><li class = "title-line col1">NO</li>' +
        '<li class = "title-line col2">문서제목</li>';
    if (roleCode === '11111') {
        tag += '<li class = "title-line col3">기안자</li>';
    } else {
        tag += '<li class = "title-line col3">부서장</li>';
    }
    tag += '<li class = "title-line col4">기안부서</li><li class = "title-line col5">승인여부</li></ul>';

    tag += '<div class = "inner-list-container">';
    for (let i = 0; i < 8; i++) {

        const {
            conNo,
            conTitle,
            fromName,
            fromDept,
            conDate,
            conStatus,
            conCheckDate
        } = list[i];

        tag += '<ul class = "confirm-tr" id = "doc-info"><li class = "col1">' + conNo + '</li><li class = "col2">' +
            conTitle + '</li><li class = "col3">' + fromName + '</li><li class = "col4">' + fromDept + '</li>';
        if(conStatus === '승인대기'){
            tag += '<li id = "conStatus" class = "col5 skyblue">' + conStatus + '</li></ul>';
        } else if(conStatus === '승인거절'){
            tag += '<li id = "conStatus" class = "col5 red">' + conStatus + '</li></ul>';
        } else if(conStatus === '승인완료') {
            tag += '<li id = "conStatus" class = "col5 green">' + conStatus + '</li></ul>';
        }
    }
    tag += '</div>';
    confirmBox.innerHTML = tag;
}

getConfirmList();
