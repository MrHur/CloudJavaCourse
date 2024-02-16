<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라디오 버튼</title>
<script type="text/javascript" src="radio_checkMessage.js"></script>
</head>
<body>
	<form method="get" action="/JspWeb02/RadioServlet" name="frm">
    성별 : 
    <input type="radio" name="sex" value="남자">남자
    <input type="radio" name="sex" value="여자">여자<br>
     <br>
    메일 정보 수신 여부 : 
    <input type="radio" name="mail_check" value="yes">수신
    <input type="radio" name="mail_check" value="no">거부<br>
     <br>
		간단한 가입 인사를 적어주세요^o^ <textarea name="message"></textarea><br>
		<input type="submit" value="전송" onclick="return checkMessage()">
	</form>	
</body>
</html>