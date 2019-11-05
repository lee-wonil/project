<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.MscrnDAO"%>
<%@page import="project.web.movie.MscrnVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	MemberVO user = (MemberVO)session.getAttribute("User");
	if(user==null){%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		window.location.href="loginForm.jsp";
		</script>
	<%}else if(user.getAdmin()==0){%>
	<jsp:include page="userHead.jsp"></jsp:include>

	<%}else{%>
	<script type="text/javascript">
		alert("관리자는 사용할 수 없는 기능입니다.");
		window.location.href="adminMain.jsp";
		</script>
	<%}
	String id = request.getParameter("id");
	MscrnDAO dao = new MscrnDAO();
	MscrnVO vo = dao.get(id);
	session.setAttribute("MscrnVO", vo);
	for(int i=1;i<=4;i++){%>
	<button onclick="window.location.href='book2.jsp?num=<%=i%>'"><%=i%>명
	</button>
	<% }

%>
</body>
</html>