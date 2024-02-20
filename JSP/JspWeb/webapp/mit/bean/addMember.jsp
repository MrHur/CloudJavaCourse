<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="member" class="mit.bean.MemberBean"/>
<jsp:setProperty property="*" name="member" />
<!DOCTYPE html>
<html>
<head>
<style>
span {
	width:80px;
	display: inline-block;
	float: left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>입력 완료된 회원정보</h1>
<span> 이름 </span> <jsp:getProperty name="member" property="name" /> <br>
<span> 아이디 </span> <jsp:getProperty name="member" property="userid" /> <br>
<span> 별명 </span> <jsp:getProperty name="member" property="nickname" /> <br>
<span> 비밀번호 </span> <jsp:getProperty name="member" property="pwd" /> <br>
<span> 이메일 </span> <jsp:getProperty name="member" property="email" /> <br>
<span> 전화번호 </span> <jsp:getProperty name="member" property="phone" /> <br>
</body>
</html>