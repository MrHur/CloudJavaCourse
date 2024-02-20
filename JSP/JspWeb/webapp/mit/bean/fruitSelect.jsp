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
    <c:choose>
        <c:when test="${param.fruit == '1'}">
            <p style= "color: red">사과</p>
        </c:when>
        <c:when test="${param.fruit == '2'}">
            <p style= "color: green">메론</p>
        </c:when>
        <c:otherwise>
            <p style= "color: yellow">바나나</p>
        </c:otherwise>
    </c:choose>
    
</body>
</html>