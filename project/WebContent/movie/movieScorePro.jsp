<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.ScoreVO"%>
<%@page import="project.web.movie.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력값을 넣자</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	MemberVO user = (MemberVO)session.getAttribute("User");
	ScoreVO vo = new ScoreVO();
	ScoreDAO dao = new ScoreDAO();
	vo.setM_id(Integer.parseInt(request.getParameter("m_id")));
	vo.setU_id(user.getId());
	vo.setScore(Integer.parseInt(request.getParameter("score")));
	vo.setReview(request.getParameter("review"));
	dao.insert(vo);
	response.sendRedirect("mp2.jsp");
%>

<script>
alert("등록완료");
window.close()</script>
<body>

</body>
</html>