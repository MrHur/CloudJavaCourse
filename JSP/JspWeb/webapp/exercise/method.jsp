<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get the Post Out of Here!!</title>
</head>
<body>
	<form method="get" action="/JspWeb/Method">
		<input type="submit" value="get 방식으로 호출하기">
	</form>
	<br>
	<br>
	<form method="post" action="/JspWeb/Method">
		<input type="submit" value="post 방식으로 호출하기">
	</form>
</body>
</html>