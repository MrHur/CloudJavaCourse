<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 페이지로 이동</title>
</head>
<body>
네이버 페이지로 이동
<%
	response.sendRedirect("https://www.naver.com");
%>
</body>
</html>