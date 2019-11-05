<%@page import="project.web.movie.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 수정처리하는곳</title>
</head>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="project.web.movie.CinemaVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	CinemaDAO dao=new CinemaDAO();
	dao.update(vo);
	%>
	<script type="text/javascript">
		alert("수정되었습니다.");
		window.location.href="cinemalist.jsp";

	</script>	
	
<body>

</body>
</html>