<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for sum 함수</title>
</head>
<body>
<%
int number = Integer.parseInt(request.getParameter("number"));
int sum = 0;
String addNum = "";
for(int i = 1; i <= number; i++){
    sum += i;
    if(i == 1) {
    	addNum += i;
    } else {
    	addNum += "+" + i;
    }
}
%>
<h2>임의의 값을 1부터 더하기</h2>
<%= addNum %>=<%= sum %>
</body>
</html>