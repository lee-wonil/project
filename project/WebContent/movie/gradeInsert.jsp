<%@page import="project.web.movie.GradeVO"%>
<%@page import="project.web.movie.GradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>grade insert</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	GradeDAO dao = new GradeDAO();
	GradeVO vo = new GradeVO();
%>
<body>
	<form action="gradeInsertPro.jsp" method="post">
		<table>
			<tr>
				
				<td>등급명:<input type="text" name="name"/></td>
			</tr>
		</table>
			<input type="submit" value="등록"/>
	</form>
</body>
</html>