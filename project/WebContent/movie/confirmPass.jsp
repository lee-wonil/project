<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%	String payment = request.getParameter("payment"); 
%>
</head>
<jsp:include page="userHead.jsp"></jsp:include>
<body>
	<form action="confirmPassPro.jsp" method="post">
	
		<h4>비밀번호 입력</h4>
		<input type="password" name="pwCancle">
		<input type="hidden" name="payment" value="<%=payment%>">
		<input type="submit" value="확인">
	</form>
</body>
</html>