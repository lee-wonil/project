<%@page import="project.web.movie.ScoreDAO"%>
<%@page import="project.web.movie.MovieVO"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="movieScorePro.jsp" method="post">

		<%
String id = request.getParameter("m_id");
MemberVO user = (MemberVO)session.getAttribute("User");
MovieDAO dao = new MovieDAO();
MovieVO vo = dao.findById(id);
ScoreDAO sdao = new ScoreDAO();
if(sdao.check(user.getId(), id)){%>	
	<script type="text/javascript">
	alert("이미 등록되었습니다.");
	location.href="mp2.jsp";
	</script>
<% }else{%>

	<input type="hidden" name="m_id" value="<%=id %>"/>
		<table>
			<tr>
				<td>평점입력</td>
				<td><select name="score">
						<option value=1>1</option>
						<option value=2>2</option>
						<option value=3>3</option>
						<option value=4>4</option>
						<option value=5>5</option>
				</select></td>
			</tr>			
			<tr>				
				<td>한줄평:</td>
				<td><input type="text" name="review"></td>
				
			</tr>
		</table>
		<input type="submit" value="확인">
	</form>
	<%} %>
</body>
</html>