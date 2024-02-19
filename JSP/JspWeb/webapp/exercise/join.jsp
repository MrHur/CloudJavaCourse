<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="join2.js"></script>
<style>
label {
	display: inline-block;
	width: 150px;
	text-align: left;
	content: "*";
}

input[type="text"], input[type="password"], select {
	width: 170px;
}

select {
	width: 100px;
}

#mail1 input,
#int1 input {
    width: initial;
}
.required {
	color: red;
	margin-left: 3px;
}
#submitbtn {
    text-align: center; /* 가로 중앙 정렬 */
}

#submitbtn input {
    display: inline-block; /* 인라인 블록 요소로 변경하여 같은 행에 위치 */
    vertical-align: middle; /* 수직 정렬을 위해 가운데 정렬 설정 */
    margin-right: 10px; /* 버튼 사이의 간격을 설정 */
}
</style>
</head>
<body>
    <form method="post" action="/JspWeb02/JoinServlet" name="frm" id="frm">
        <label for="name">이름<span class="required">*</span></label>
        <input type="text" id="name" name="name" required><br>
        
        <!-- 주민등록번호 -->
        <label for="residentNumber1">주민등록번호<span class="required">*</span></label>
        <input type="text" id="residentNumber1" name="residentNumber1" required>
        -
        <input type="password" id="residentNumber2" name="residentNumber2" required><br>
        
        
        <label for="userId">아이디<span class="required">*</span></label>
        <input type="text" id="userId" name="userId" required><br>
        
        <label for="password">비밀번호<span class="required">*</span></label>
        <input type="password" id="password" name="password" required><br>
        
        <label for="confirmPassword">비밀번호 확인<span class="required">*</span></label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>
        
        <!-- 이메일 -->
		<label for="email">이메일</label>
		<input type="text" id="email" name="email1">
		@
		<input type="text" id="email" name="email1">
		<select id="emailDomain" name="emailDomain">
		    <option value="naver.com" selected>naver.com</option>
		    <option value="gmail.com">gmail.com</option>
		    <option value="daum.net">daum.net</option>
		</select><br>
        
        <label for="zipCode">우편번호</label>
        <input type="text" id="zipCode" name="zipCode"><br>
        
        <label for="address">주소</label>
        <input type="text" id="address" name="address">
        <input type="text" id="address" name="address"><br>
        
        <label for="phone">핸드폰번호</label>
        <input type="text" id="phone" name="phone"><br>
        
        <label for="job">직업</label>
        <select id="job" name="job">
            <option value="공무원">공무원</option>
            <option value="학생">학생</option>
            <option value="컴퓨터/인터넷">컴퓨터/인터넷</option>
            <option value="언론">언론</option>
            <option value="군인">군인</option>
            <option value="서비스업">서비스업</option>
            <option value="교육">교육</option>
        </select><br>
        
        <label id="mail1">메일/SMS 정보 수신</label>
	        <input type="radio" id="receive" name="receive" value="수신" checked>수신

	        <input type="radio" id="reject" name="receive" value="수신거부">수신거부<br>

        
        <label for="interest" id="int1">관심분야</label>
	        <input type="checkbox" id="interest1" name="interest" value="생두">생두

	        <input type="checkbox" id="interest2" name="interest" value="원두">원두

	        <input type="checkbox" id="interest3" name="interest" value="로스팅">로스팅

	        <input type="checkbox" id="interest4" name="interest" value="핸드드립">핸드드립

	        <input type="checkbox" id="interest5" name="interest" value="에스프레소">에스프레소

	        <input type="checkbox" id="interest6" name="interest" value="창업">창업<br>
	        <br>
	        

<div id=submitbtn>
	        <input id="sub1" type="submit" value="회원가입" onclick="return checkJoin2()">
	        <input id="can1" type="reset" value="취소">
</div>
    </form>
</body>
</html>