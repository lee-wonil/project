<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<jsp:include page="userHead.jsp"/>
<%
	MemberVO dto = (MemberVO)session.getAttribute("User");
	if(dto==null){
		response.sendRedirect("main.jsp");
	}

%>
</head>
<body>
	<form action="updateMemberForm.jsp" name="pass" method="post">
		비밀번호 입력:<input type="password" name="pw"/>
				<input type="submit" value="확인"/>
	</form>

	

</body>
</html>