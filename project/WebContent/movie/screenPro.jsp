<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ScreenVO svo = (ScreenVO)session.getAttribute("svo");
	ScreenDAO dao = new ScreenDAO();
	if(svo.getId()==0){
		dao.insert(svo);
	}
	else{
		dao.update(svo);	
	}
	response.sendRedirect("screenlist.jsp");
%>
