<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="userHead.jsp"/>
<title>마이페이지</title>
</head>
<body>
	<%
	MemberVO dto=(MemberVO)session.getAttribute("User");
	if(dto!=null){%>
		<button onclick = "window.location.href ='updateMember.jsp' ">회원정보수정</button>
		<button onclick = "window.location.href ='deleteMemberForm.jsp' ">회원정보삭제</button>
		<button onclick= "window.location.href ='favorCinemaForm.jsp'" >자주가는 영화관</button>
		<jsp:include page="mp2.jsp"></jsp:include>
		
	<%}else{%>
		<script>
		alert("잘못된 경로입니다.");
		location.href="main.jsp";
		</script>
	<%}%>
</body>
</html>