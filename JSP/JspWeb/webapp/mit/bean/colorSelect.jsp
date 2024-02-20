<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <c:set var="selColor" value="${param.color}" />

    <c:choose>
        <c:when test="${selColor == '1'}">
            <p style= "color: red">빨강</p>
        </c:when>
        <c:when test="${selColor == '2'}">
            <p style= "color: green">초록</p>
        </c:when>
        <c:when test="${selColor == '3'}">
            <p style= "color: blue">파랑</p>
        </c:when>
    </c:choose>
    
	<c:set var="selColor" value="${param.color}" />
	
	<c:if test="${selColor == '1'}">
	    <p style="color: red;">빨강</p>
	</c:if>
	<c:if test="${selColor == '2'}">
	    <p style="color: green;">초록</p>
	</c:if>
	<c:if test="${selColor == '3'}">
	    <p style="color: blue;">파랑</p>
	</c:if>
</body>
</html>