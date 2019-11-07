<%@page import="project.web.movie.LocalVO"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%	
	LocalVO vo = new LocalVO();
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	vo.setL_id(Integer.parseInt(id));
	vo.setL_name(name);
	LocalDAO dao = new LocalDAO();
	
	
	if(name==null||name==""){%>
	<script type="text/javascript">
		alert("빈문자열 입력");
		go.back();
	</script>
	<% }	
	
	else if(dao.check(name)==0){
		dao.update(vo);
		response.sendRedirect("locallist2.jsp");
	}
	else{
%>
	<script type="text/javascript">
		alert("중복되었습니다.");
		history.go(-1);
	</script>
<%} %>
