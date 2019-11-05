<%@page import="project.web.movie.GradeDAO"%>
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
<jsp:useBean id="vo" class="project.web.movie.GradeVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<%	
	String name = request.getParameter("name");
	GradeDAO dao = new GradeDAO();
	if(dao.gradeCheck(name)==0){
		dao.gradeInsert(vo);
		response.sendRedirect("gradeList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("중복되었습니다.");
		go.back();
	</script>
<%} %>
