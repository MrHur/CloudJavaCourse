<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 표현 언어(EL, Expression Language : 이렇게 값을 가져오면 편하다.) -->
${"Hello"} <br>
<%="Hello" %> <br> <!-- 스크립트릿 -->
<% out.println("Hello"); %> <br> <!-- 표현식(Expression -->
<br>
정수형 : ${10} <br>
실수형 : ${5.6} <br>
문자열형 : ${"허준혁"} <br>
논리형 : ${true} <br>
null : ${null} <br>

\${5+2} : ${5+2} <br>
\${5/2} : ${5/2} <br>
\${5 mod 2} : ${5 mod 2} <br>
\${5 > 2} : ${5 > 2} <br>
\${2 gt 10} : ${2 gt 10} <br>
\${(5 > 2) ? 5 : 2} : ${(5 > 2) ? 5 : 2 } <br>
\${(5 > 2) || (2 < 10)} : ${(5 > 2) || (2 < 10)} <br>
<br>
<%
String input=null;
%>
\${empty input} : ${empty input}<br>

</body>
</html>