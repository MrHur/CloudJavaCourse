<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
label {
	width:80px;
	display: inline-block;
	float: left;
}
 input[type=submit], input[type=reset] {
    border: 1px black solid;
    margin-right: 20px;
}
</style>
<meta charset="UTF-8">
<title>회원의 정보 입력 폼</title>
</head>

<body>
<h1>회원의 정보 입력 폼</h1>
<div>
	<form action="addMember.jsp">
		<label for="name"> 이름 </label> <input type="text" name="name"> <br>
		<label for="userid"> 아이디 </label> <input type="text" name="userid"><br>
		<label for="nickname"> 별명 </label> <input type="text" name="nickname"><br>
		<label for="pwd"> 비밀번호 </label> <input type="password" name="pwd"><br>
		<label for="email"> 이메일 </label> <input type="email" name="email"><br>
		<label for="phone"> 전화번호 </label><input type="text" name="phone"><br><br>
		<input type="submit" value="전송"> <input type="reset" value="취소"><br>
		<jsp:setProperty property="*" name="member"/>
	</form>
</div>
</body>
</html>