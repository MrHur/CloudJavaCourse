<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="join.js"></script>
<style>
    label {
        display: inline-block;
        width: 150px;
        text-align: left;
    }
    input[type="text"],
    input[type="password"],
    select {
        width: 170px;
    }
    select {
    	width: 100px;
    }
    #int1 input, #mail1 input {
    width: 60px;
    }
     {
    float: center;
    }
</style>
</head>
<body>
    <form method="post" action="/JspWeb02/JoinServlet" name="joinForm" id="joinForm">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" required><br>
        
        <!-- 주민등록번호 -->
        <label for="residentNumber1">주민등록번호</label>
        <input type="text" id="residentNumber1" name="residentNumber1" required>
        -
        <input type="password" id="residentNumber2" name="residentNumber2" required><br>
        
        
        <label for="userId">아이디</label>
        <input type="text" id="userId" name="userId" required><br>
        
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" required><br>
        
        <label for="confirmPassword">비밀번호 확인</label>
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
	        <input type="radio" id="receive" name="receive" value="수신" checked>
	        <label for="receive">수신</label>
	        <input type="radio" id="reject" name="receive" value="수신거부">
	        <label for="reject">수신거부</label><br>
        
        <label for="interest" id="int1">관심분야</label>
	        <input type="checkbox" id="interest1" name="interest" value="생두">
	        <label for="interest1">생두</label>
	        <input type="checkbox" id="interest2" name="interest" value="원두">
	        <label for="interest2">원두</label>
	        <input type="checkbox" id="interest3" name="interest" value="로스팅">
	        <label for="interest3">로스팅</label>
	        <input type="checkbox" id="interest4" name="interest" value="핸드드립">
	        <label for="interest4">핸드드립</label>
	        <input type="checkbox" id="interest5" name="interest" value="에스프레소">
	        <label for="interest5">에스프레소</label>
	        <input type="checkbox" id="interest6" name="interest" value="창업">
	        <label for="interest6">창업</label><br>
        
        <input id="sub1" type="submit" value="회원가입" onclick="return checkJoin2()">
        <input id="can1" type="reset" value="취소">
    </form>
</body>
</html>