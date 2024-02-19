<%@page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testLogin</title>
</head>
<body>
<%
String id = "okstreet";
String pwd = "1234";
String name = "그리디";
request.setCharacterEncoding("UTF-8");
if(id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pwd"))) {
	response.sendRedirect("logMain.jsp?name=" + URLEncoder.encode(name, "UTF-8"));
} else {
	response.sendRedirect("loginForm.jsp");
}
%>
</body>
</html>