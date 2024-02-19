<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research</title>
</head>
<body>

<h1>설문 조사</h1>
<form action="research.jsp" method="post">
    <label>이름:</label>
    <input type="text" name="id" value="허준혁"><br>
    
    <label>성별:</label>
    <input type="radio" name="gender" value="male"><label for="male">남자</label>
    <input type="radio" name="gender" value="female"><label for="female">여자</label><br>
    
    <label>좋아하는 계절:</label>
    <input type="checkbox" name="season" value="1">봄
    <input type="checkbox" name="season" value="2">여름
    <input type="checkbox" name="season" value="3">가을
    <input type="checkbox" name="season" value="4">겨울<br>
    
    <input id="sub1" type="submit" value="전송">
    <input id="can1" type="reset" value="취소">
</form>
</body>
</html>