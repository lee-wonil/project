<%@page import="project.web.movie.ScoreVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	ScoreDAO dao = new ScoreDAO();
	ArrayList<ScoreVO> list = dao.list(id);	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<td>평가자</td>
	<td>평점</td>
	<td>평가내용</td>
</tr>
<%
	for(int i =0; i <list.size();i++){
		ScoreVO vo = list.get(i);%>
		<tr>
		<td><%=vo.getU_id() %></td>
		<td><%=vo.getScore() %></td>
		<td><%=vo.getReview() %></td>
		</tr>
	<%}%>
</table>
</body>
</html>