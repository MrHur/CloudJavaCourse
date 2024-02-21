<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlFmt_incoding</title>
</head>
<body>
	<%-- <%
		request.setCharacterEncoding("UTF-8");
	%>
	이름 : 
	<%=request.getParameter("name")%> --%>
	<fmt:requestEncoding value="UTF-8"></fmt:requestEncoding>
	이름 : <c:out value="${param.name}"></c:out>
</body>
</html>