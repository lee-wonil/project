<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	MemberVO user = (MemberVO)session.getAttribute("User");
	if(user==null||user.getAdmin()==0){%>
		<script type="text/javascript">
			alert("권한이 없습니다.");
			window.location.href="main.jsp";
		</script>
	<% }else{%>
<title>통계 메일</title>
</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>
<h2>통계메인</h2>
<table>
	<tr>
	
	</tr>


</table>
<%} %>
</body>
</html>