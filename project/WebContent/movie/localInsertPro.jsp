<%@page import="project.web.movie.LocalVO"%>
<%@page import="project.web.movie.LocalDAO"%>
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
<body>
<%
	LocalDAO dao = new LocalDAO();
	String name= request.getParameter("name");
	dao.insert(name);	
	response.sendRedirect("locallist2.jsp");
%>
</body>
</html>