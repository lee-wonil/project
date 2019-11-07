<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberVO user = (MemberVO) session.getAttribute("User");
	if (user == null || user.getAdmin() == 0) {
		%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			location.href = "main.jsp";
		</script>
		<%
		
	}else if(id==null) {
		%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			location.href = "main.jsp";
		</script>
		<%
	}else{
		new LocalDAO().delete(id);
		%>
		<script type="text/javascript">
			alert("삭제완료되었습니다.");
			location.href = "locallist2.jsp";
		</script>
		<%
	}


%>