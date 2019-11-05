<%@page import="project.web.movie.MemberDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<% 
	MemberVO user = (MemberVO)session.getAttribute("User");
	if(user==null||user.getAdmin()==0){%>
<script type="text/javascript">
		alert("잘못된 접근입니다.");
		window.location.href="main.jsp";
		</script>
<% }
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.memberlist();
%>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<h2>adminMain</h2>
	<hr />
	<%if(user.getAdmin()==4){ %>
	<h4>회원목록</h4>

	<form action="adminPro.jsp" method="Post">
		<table border="1">
			<tr>
			<td>
				<select name="sel">
					<option value="0">사용자(0)</option>
					<option value="1">(1)</option>
					<option value="2">(2)</option>
					<option value="3">(3)</option>
					<option value="4">(4)</option>
				</select>
			</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>ADMIN번호</td>
			</tr>
			<%for(MemberVO dto:list) {%>
			<tr>
				<td><input type="checkbox" name="admin"
					value="<%=dto.getId()%>"><%=dto.getId()%><br></td>
				<td><%=dto.getName()%></td>
				<td align="center"><%=dto.getAdmin()%></td>
			</tr>
			<%}%>
		</table>
	 <input type="submit" value="수정">
	</form>
	<%} %>


</body>
</html>