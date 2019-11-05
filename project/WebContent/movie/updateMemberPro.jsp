<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정결과</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); 
	MemberVO user = (MemberVO)session.getAttribute("User");
	if(user==null){%>
		<script type="text/javascript">
		alert("잘못된 접근입니다.");
		location.href="main.jsp";
		</script>	
	<%}
	MemberDAO dao = new MemberDAO();
	String passwd = request.getParameter("passwd");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	user.setPhone(phone);
	user.setEmail(email);
	user.setPasswd(passwd);
	if(user.getPasswd()==null){ response.sendRedirect("updateMemberForm.jsp");}
	else if(user.getPhone()==null){ response.sendRedirect("updateMemberForm.jsp");}
	else if(user.getEmail()==null){ response.sendRedirect("updateMemberForm.jsp");}
	dao.update(user);
	session.invalidate();
	%>
	<h2>회원정보가 수정되셨습니다! 다시 로그인해 주세요</h2>
	<input type="button" value="홈페이지로가기" OnClick="window.location.href='main.jsp'"/>
	<input type="button" value="로그인페이지로가기" OnClick="window.location.href='loginForm.jsp'"/>

</body>
</html>