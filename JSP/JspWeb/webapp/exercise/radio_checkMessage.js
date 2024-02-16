function checkMessage() {
    var message = document.frm.message.value.trim();
    
    if (message === "") {
        alert("가입 인사를 해주세요.");
        document.frm.message.focus();
        return false;
    } else {
        return true;
    }
}