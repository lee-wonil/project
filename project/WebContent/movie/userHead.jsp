<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberVO dto = (MemberVO)session.getAttribute("User");
	String name = "";
	if(dto!=null){
		name=dto.getName();
	}
%>
	


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="main.jsp">예매시스템</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="cinemalist.jsp">극장</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="movielist.jsp">영화</a>
      </li>
    </ul>
    <%if(dto!=null) {%>
    	<span class="navbar-text">
    		<%=name%>님 환영합니다
    	</span>
    	<button onclick="location.href='logout.jsp'">로그아웃</button>
    	<button onclick="location.href='mypage.jsp'">마이페이지</button>
    	
       	<%}else{%>
       	    <span class="navbar-text">       	
			로그인해주세요
			</span>
			<button onclick="location.href='loginForm.jsp'">로그인</button>
			<button onclick="location.href='registForm.jsp'">회원가입</button>
       	<%}%>
    
  </div>
</nav>