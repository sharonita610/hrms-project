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
    tag += '<li class = "title-line col4">기안부서</li><li class = "title-line col5">기안일</li></ul>';

    tag += '<div class = "inner-list-container">';
    for (let i = 0; i < 10; i++) {

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
            conTitle + '</li><li class = "col3">' + fromName + '</li><li class = "col4">' + fromDept +
            '</li><li class = "col5">' + conDate +
            '</li></ul>';
    }
    tag += '</div>';
    confirmBox.innerHTML = tag;
}

getConfirmList();