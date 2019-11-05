<%@page import="project.web.movie.MemberDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete pro</title>
</head>
<%
	MemberVO dto = (MemberVO)session.getAttribute("User");
	String id = dto.getId();
	String pw = request.getParameter("pw");
	MemberDAO dao = new MemberDAO();
	boolean result = dao.loginCheck(id, pw);
	
	int x = 0;
	if(result) {
		x=dao.deleteMem(id);
		if(x>0) {
			session.invalidate();%>
			<table>
				<tr>
					<td>회원 정보가 삭제되었습니다.</td>
				</tr>
				<tr>
					<td><input type="button" value="메인" onclick="window.location.href='main.jsp'"/></td>
				</tr>
			</table>
		<%}else{%>
			<script>
				alert("삭제가 안되었습니다. 다시 시도해주세요.")
				history.go(-1);
			</script>
		<%}
	} else{ %>
		<script>
			alert("비밀번호가 맞지 않습니다. 다시 입력해주세요.");
			history.go(-1);
		</script>
<%}%>
<body>

</body>
</html>