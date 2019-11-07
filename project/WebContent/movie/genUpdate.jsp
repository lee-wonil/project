<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.GenDAO"%>
<%@page import="project.web.movie.GenVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>grade insert</title>
<jsp:include page="adminHeader.jsp"></jsp:include>
</head>
<%
	MemberVO user = (MemberVO)session.getAttribute("User");
	if(user==null||user.getAdmin()==0){%>
		<script type="text/javascript">
		alert("잘못된 접근입니다.");
		window.location.href="main.jsp";
		</script>
	<%}
	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("id");
	if(id==null){%>
		<script type="text/javascript">
		alert("잘못된 접근입니다.");
		window.location.href="main.jsp";
		</script>
	<%}
	GenDAO dao = new GenDAO();
	GenVO vo = dao.getVO(id);
%>
<body>
	<form action="genUpdatePro.jsp" method="post">
		<table>
			<tr>				
				<td>등급명:<input type="text" name="name" value="<%=vo.getName()%>"/></td>
				<td><input type="hidden" name="id" value="<%=id %>" /></td>
			
			</tr>
		</table>
			<input type="submit" value="등록"/>
	</form>
</body>
</html>