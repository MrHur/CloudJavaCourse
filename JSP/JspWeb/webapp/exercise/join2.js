function checkJoin2() {

    if (document.frm.name.value === "") {
        alert("이름을 입력해주세요.");
        document.frm.id.focus();
        return false;
    }
    if (document.frm.residentNumber1.value.length !== 6 || document.frm.residentNumber2.value.length !== 7) {
        alert("주민번호를 정확히 입력해주세요.");
        document.frm.residentNumber1.focus();
        return false;
    }
    if (document.frm.userId.value === "") {
        alert("아이디를 입력해주세요.");
        document.frm.userId.focus();
        return false;
    }
    if (document.frm.userId.value.length < 4) {
        alert("아이디는 4글자 이상이어야 합니다.");
        document.frm.userId.focus();
        return false;
    }
    if (document.frm.password.value === "") {
        alert("패스워드를 입력해주세요.");
        document.frm.password.focus();
        return false;
    }
    if (document.frm.password.value !== document.frm.confirmPassword.value) {
        alert("패스워드가 일치하지 않습니다.");
        document.frm.confirmPassword.focus();
        return false;
    }

    return true; // 모든 조건을 만족하면 true 반환
}