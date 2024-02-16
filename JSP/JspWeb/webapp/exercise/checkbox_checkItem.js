function checkItem() {
    var checkboxes = document.getElementsByName("item");
    var checkedCount = 0;
    
    // 체크된 항목의 개수 확인
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            checkedCount++;
        }
    }
    
    // 체크된 항목이 없는 경우
    if (checkedCount === 0) {
        alert("선택한 항목이 없습니다.");
        return false;
    }
    
    // 모든 조건이 충족되었을 때 true 반환
    return true;
}