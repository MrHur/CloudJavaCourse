function checkJoin() {
    const name = document.getElementById("name").value;
    const residentNumber1 = document.getElementById("residentNumber1").value;
    const residentNumber2 = document.getElementById("residentNumber2").value;
    const userId = document.getElementById("userId").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

	if (!name) {
	    alert("이름을 입력해주세요.");
	    return false;
	}
	if (residentNumber1.length !== 6 && residentNumber2.length !== 7) {
	    alert("주민번호를 정확히 입력해주세요.");
	    return false;
	}
    if (!userId) {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if (userId.length < 4) {
        alert("아이디는 4글자 이상이어야 합니다.");
        return false;
    }
    if (!password) {
        alert("패스워드를 입력해주세요.");
        return false;
    }
    if (password !== confirmPassword) {
        alert("패스워드가 일치하지 않습니다.");
        return false;
    }

    return true; // 모든 조건을 만족하면 true 반환
}