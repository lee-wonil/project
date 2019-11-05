<%@page import="project.web.movie.GenDAO"%>
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
	String name= request.getParameter("name");
%>
	<jsp:useBean id="vo" class="project.web.movie.GenVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<script>
		function changeGen(){
			opener.document.userinput.name.value="<%=name%>";
			window.close();
		}
	</script>
<%
	GenDAO dao = new GenDAO();
	int check = dao.genCheck(name);
	if(check==1) {
%>
	<h6>name :</h6>
	<form action="genCheck.jsp" name="wrongGen">
		<input type="text" name="name" value="<%=name%>"/>
		<input type="submit" name="close" value="조회"/>
		<input type="button" name="close" value="취소" onclick="window.close()"/>
		<br><%=name%>은 이미 존재합니다. 다시 입력해주세요! 
	</form>
	<%} else{%>
		<h6><%=name%>은 등록 가능합니다.</h6>
		<input type="button" name="close" value="닫기" onclick="javascript:changeGen()" />
		<%}%>
</html>
