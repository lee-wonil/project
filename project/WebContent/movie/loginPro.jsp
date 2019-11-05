<%@page import="project.web.movie.MemberDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");	
	MemberDAO dao = new MemberDAO();
	boolean result = dao.loginCheck(id, pw);
	
	if(result) {
		MemberVO dto = new MemberVO();
		dto=dao.UserData(id);
		session.setAttribute("User", dto);
		session.setMaxInactiveInterval(60*30*30);
		if(dto.getAdmin()==0){
			response.sendRedirect("main.jsp");
		}
		else{
			response.sendRedirect("adminMain.jsp");
		}
	}else{ %>
		<script>
			alert("id 또는 pw가 일치하지 않습니다. 다시 시도해주세요.");
			history.go(-1);
		</script>
<%}%>

</body>
</html>