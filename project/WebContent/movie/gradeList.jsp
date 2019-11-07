<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.GradeVO"%>
<%@page import="java.util.List"%>
<%@page import="project.web.movie.GradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급리스트</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<%
	GradeDAO dao = new GradeDAO();
	String id = request.getParameter("id");
	List<GradeVO> list = dao.selectAllGrade();
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<%
	MemberVO user = (MemberVO) session.getAttribute("User");
	if (user == null || user.getAdmin() == 0) {
%>
<script type="text/javascript">
	alert("잘못된 접근입니다.");
	location.href = "main.jsp";
</script>
<%
	}else{
%>

<body>
	<div class="row">
		<jsp:include page="movieside.jsp"></jsp:include>
		<div class="col-md-9 ml-sm-auto col-lg-10 px-4">
			<h2>연령등급리스트</h2>
			<table>
				<tr>
					<td>id</td>
					<td>등급명</td>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
						GradeVO vo = list.get(i);
				%>
				<tr>
					<td><%=vo.getId()%></td>
					<td><%=vo.getName()%></td>
					<td><button onclick="location.href='gradeUpdate.jsp?id=<%=vo.getId()%>'">수정하기</button></td>
					<td><button onclick="location.href='gradeDelete.jsp?id=<%=vo.getId()%>'">삭제하기</button></td>
				</tr>
				<%
					}
				}
				%>
			</table>
			<button onclick="location.href='gradeInsert.jsp'">등록하기</button>
		</div>
	</div>
</body>
</html>