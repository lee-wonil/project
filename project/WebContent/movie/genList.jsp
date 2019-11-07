<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.GenVO"%>
<%@page import="project.web.movie.GenDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<%
	GenDAO dao = new GenDAO();
	String id = request.getParameter("id");
	List<GenVO> list = dao.selectAll();
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
	
	<h2>장르 리스트</h2>
	
	<table>
		
		<tr>
			<td>id</td>
			<td>장르명</td>
			<td>수정하기</td>
		</tr>
		<%
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					GenVO vo = list.get(i);
		%>
		<tr>
			<td><%=vo.getId()%></td>
			<td><%=vo.getName()%></td>
			<td><button onclick="location.href='genUpdate.jsp?id=<%=vo.getId()%>'">수정하기</button></td>
			<td><button onclick="location.href='genDelete.jsp?id=<%=vo.getId()%>'">삭제하기</button></td>
		</tr>
		<%
			}
			}
		}
		%>
	</table>
	<button onclick="location.href='genInsert.jsp'">등록하기</button>
	</div>
	</div>
</body>
</html>