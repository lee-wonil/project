<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="project.web.movie.MovieVO"/>
<%-- <jsp:setProperty ~ xx : form에서 enctype을 multipart/formdata로 받아서 --%>

<body>
<%
	
	// 포스터 이미지 저장하기 위해서 getRealpath사용
	String path = request.getRealPath("movie/posterImage");
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	int max = 1024*1024*10;
	MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
	// setProperty로 못 받아서 하나하나씩 꺼내줌.
	dto.setM_title(mr.getParameter("m_title"));
	dto.setM_time(Integer.parseInt(mr.getParameter("m_time")));
	dto.setM_gen(Integer.parseInt(mr.getParameter("m_gen")));
	//dto.setM_sco(Integer.parseInt(mr.getParameter("m_sco"))); sql문에서 0으로함
	//dto.setM_public(Integer.parseInt(mr.getParameter("m_public")));
	dto.setM_grade(Integer.parseInt(mr.getParameter("m_grade")));
	
	
	java.io.File f = mr.getFile("poster");
	String sys = mr.getFilesystemName("poster");
	System.out.println(sys);
	System.out.println(path);
	dto.setM_pic(sys);
	

	MovieDAO dao = new MovieDAO();
	dao.insertMovie(dto);
	response.sendRedirect("movieMain.jsp"); // 상영중인 영화 목록 보여주는 페이지. 
	
	
	
%>
</body>
</html>