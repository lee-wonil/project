<%@page import="project.web.movie.MemberDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String pw = request.getParameter("pw");
	if(pw==null){%>
		<script>
		alert("잘못된 접근입니다.");
		window.location.href="main.jsp";
		</script>
	<%}
	MemberVO dto = (MemberVO)session.getAttribute("User");
	MemberDAO dao = new MemberDAO();
	String id = dto.getId();
	boolean b = dao.loginCheck(id,pw);
	if(!b){%>
		<script>
		alert("잘못된 비밀번호입니다.");
		history.go(-1);
		</script>
	<%}

%>

<head>
<meta charset="UTF-8">
<title>회원정보수정란</title>
<jsp:include page="userHead.jsp" flush="false" />
	<script>
		function check(){
			var userinput = eval("document.userinput");
			if(userinput.passwd.value==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if(userinput.phone.value==""){
				alert("이름를 입력하세요.");
				return false;
			}
			if(userinput.email.value==""){
				alert("이메일을 입력하세요.");
				return false;
			}
			return true;
		}
		
		
	</script>
</head>
<body>
	<br/>
	<br/>
	<h3>회원정보 수정</h3>
	<hr/>
	<form action="updateMemberPro.jsp" name = "userinput" method="post" onsubmit="return check()">
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name ="passwd"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=dto.getEmail()%>"/></td>
			</tr>
			<tr>
            	<td><input type="submit" value = "변경" /></td>
            <tr>
		</table>
	</form>

</body>
</html>