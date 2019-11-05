<%@page import="project.web.movie.GenVO"%>
<%@page import="project.web.movie.GenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genInsertPro</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="project.web.movie.GenVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<body>
<%
	GenDAO dao = new GenDAO();
	dao.genInset(vo);
	vo.setName("name");
	response.sendRedirect("genList.jsp");
%>
</body>
</html>