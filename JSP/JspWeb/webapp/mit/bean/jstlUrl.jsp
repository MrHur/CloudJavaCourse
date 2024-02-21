<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlUrl</title>
</head>
<body>
	<c:import url="http://localhost:8080/JspWeb02/mit/bean/fruitSelectForm.jsp" var="data"></c:import>
	${data}
	<hr>
	<c:url value="../media/mio.png" var="data"></c:url>
	<h3>${data}</h3>
	<img src="${data}" width="100" height="100">
	<hr>
	<c:redirect url="login.jsp"></c:redirect>
</body>
</html>