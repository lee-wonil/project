<%@page import="project.web.movie.ScoreDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.GradeVO"%>
<%@page import="project.web.movie.GenVO"%>
<%@page import="project.web.movie.GradeDAO"%>
<%@page import="project.web.movie.GenDAO"%>
<%@page import="project.web.movie.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화메인</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<%
	MovieDAO dao = new MovieDAO();
	ArrayList<MovieVO> movielist = dao.selectAll();
	MemberVO user = (MemberVO) session.getAttribute("User");
	ScoreDAO sdao = new ScoreDAO();
	if (user != null && (user.getAdmin()==4 || user.getAdmin()==1)) {
%>
<jsp:include page="adminHeader.jsp" />

<%
	} else {%>
		<script type="text/javascript">
		alert("잘못된 접근입니다.");
		location.href="main.jsp"
		</script>
	<%}
%>

<body>

	<div class="row">
		<jsp:include page="movieside.jsp"></jsp:include>
		<div class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h2>영화 목록</h2>
			<table>
				<tr>
					<td>영화id</td>
					<td>영화제목</td>
					<td>러닝타임</td>
					<td>장르</td>
					<td>포스터</td>
					<td>평점</td>
					<td>관객수</td>
					<td>연령등급</td>
				</tr>
				<%
					for (int i = 0; i < movielist.size(); i++) {
						MovieVO dto = (MovieVO) movielist.get(i);
				%>

				<tr>
					<td><%=dto.getM_id()%></td>
					<td><%=dto.getM_title()%></td>
					<td><%=dto.getM_time()%></td>
					<td><%=dto.getM_genName()%></td>
					<td><img src=<%=dto.getM_pic()%> width="200px" height="auto">
					</td>
					<td><%=sdao.average(dto.getM_id()+"")%></td>
					<td><%=dto.getM_public()%></td>
					<td><%=dto.getM_gradeName()%></td>
					<%
						if (user == null || user.getAdmin() == 0) {
					%>
					<td><button
							onclick="location='mscrnList.jsp?id=<%=dto.getM_id()%>'">시간표조회</button></td>

					<%
						} else {
					%>
					<td><button	onclick="location='mscrnInsert.jsp?id=<%=dto.getM_id()%>'">시간표생성</button></td>
					<td><button	onclick="location='mscrnListAll.jsp?id=<%=dto.getM_id()%>'">시간표조회</button></td>
					<td><button	onclick="location='movieDetail.jsp?id=<%=dto.getM_id()%>'">상세조회</button></td>

					<%
						}
					%>
					<%
						}
					%>
				</tr>
			</table>

			<%
				if (user == null || user.getAdmin() == 0) {
				} else {
			%>
			<button onclick="location.href='movieInsertForm.jsp'">등록하기</button>

			<% } %>
		</div>
	</div>
</body>
</html>