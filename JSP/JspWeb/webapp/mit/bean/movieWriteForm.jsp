<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#transport {
    text-align: center;
}
</style>
</head>
<body>
<h4>게시판 글쓰기</h4>
<form method="post" action="movieWrite.jsp">
	<table>
		<tr>
			<td style="text-align: center;">제목</td>
			<td><input type="text" name="name" size="20"></td>
		</tr>
		<tr>
			<td style="text-align: center;">가격</td>
			<td><input type="text" name="price" size="20">원</td>
		
		</tr>
		<tr>
			<td style="text-align: center;">감독</td>
			<td><input type="text" name="director" size="20"></td>
		</tr>
		<tr>
			<td style="text-align: center;">출연배우</td>
			<td><input type="text" name="actor" size="20"></td>
		</tr>
		<tr>
			<td style="text-align: center;">시놉시스</td>
			<td><textarea rows="5" cols="30" name="synopsis"></textarea></td>
		</tr>
		<tr>
			<td style="text-align: center;">장르</td>
			<td>
				<select name="genre">
					<option value="액션">액션</option>
					<option value="멜로">멜로</option>
					<option value="공포">공포</option>
					<option value="추리">추리</option>
				</select> 
			</td>
		</tr>
		<tr id ="transport">
		    <td colspan="2" style="text-align: center;">
		        <input type="submit" value="등록">
		        <input type="reset" value="다시작성">
	    	</td>
		</tr>
	</table>
</form>
</body>
</html>