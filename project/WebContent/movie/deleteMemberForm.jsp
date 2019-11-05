<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br />
	<h1 align="center">회원 탈퇴</h1>
	<form action="deletePro.jsp" method="post">
		<table>
			<tr>
				<td colspan="2">
					회원 탈퇴를 원하시면 비밀번호를 입력하세요.
					<input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="회원 탈퇴"/></td>
				<td><input type="button" value="취소" onclick="window.location.href='main.jsp'"/></td>  <!-- history써서 뒤로가기 써도됨. -->
			</tr>
		</table>
	</form>

</body>
</html>