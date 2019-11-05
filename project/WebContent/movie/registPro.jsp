<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="project.web.movie.MemberDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pro페이지</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="project.web.movie.MemberVO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	if(dto.getId()==null){response.sendRedirect("Form.jsp");}
	else if(dto.getPasswd()==null){ response.sendRedirect("Form.jsp");}
	else if(dto.getName()==null){ response.sendRedirect("Form.jsp");}
	else if(dto.getBirth()==null){ response.sendRedirect("Form.jsp");}
	else if(dto.getPhone()==null){ response.sendRedirect("Form.jsp");}
	else if(dto.getEmail()==null){ response.sendRedirect("Form.jsp");}
	Calendar cal = Calendar.getInstance();
	String date = request.getParameter("birth");
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	cal.setTime(df.parse(date));
	if(System.currentTimeMillis()<cal.getTimeInMillis()){%>
		<script>
		alert("잘못된 생년월일 입력입니다.");
		history.go(-1);
		</script>
	<%}
	else{
	MemberDAO dao = new MemberDAO();
	dao.insertUser(dto); %> 

<script type="text/javascript">
	alert("회원가입 완료되셨습니다! 환영합니다!");
	window.location.href="loginForm.jsp";
</script>
<%} %>

</body>
</html>