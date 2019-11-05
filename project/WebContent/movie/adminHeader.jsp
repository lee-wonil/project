<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberVO user = (MemberVO)session.getAttribute("User"); 

%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="adminMain.jsp">예매시스템관리자</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="movieMain.jsp">영화관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="cinemalist.jsp">영화관/상영관관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="mscrnListAll.jsp">상영시간표 관리</a>
      </li>      
    </ul>
    <span class="navbar-text">
    	<%=user.getName() %>님 환영합니다.
    </span>
    <button onclick="window.location.href='logout.jsp'">로그아웃</button>
  </div>
</nav>

