<%@page import="project.web.movie.CinemaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 정보</title>
</head>
<script>

</script>
<%
	String id=request.getParameter("id");
	CinemaDAO dao= new CinemaDAO();
	CinemaVO vo=dao.getcvo(id);
	%>
	
<body>
지점:<%=vo.getC_name() %><br/>
주소:<%=vo.getC_address()%><br/>
분류권 :<%=vo.getL_name() %><br/>
<button onclick="location.href='cinemaUpdateform.jsp?id=<%=vo.getC_id()%>'">수정하기</button>
	
</body>
</html>