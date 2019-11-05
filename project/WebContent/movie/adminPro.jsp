<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<% 
	String ad = request.getParameter("sel");
	String [] id = request.getParameterValues("admin");
	MemberDAO dao = new MemberDAO();

	for(int i=0;i<id.length;i++){
		dao.setAdmin(id[i],ad);
	}
	List<MemberVO> list = dao.memberlist();
	response.sendRedirect("adminMain.jsp");
	
%>
