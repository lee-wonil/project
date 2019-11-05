<%@page import="project.web.movie.BookDAO"%>
<%@page import="project.web.movie.MemberDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 	MemberVO vo = (MemberVO)session.getAttribute("User"); 
	String pw = request.getParameter("pwCancle");
	int payment = Integer.parseInt(request.getParameter("payment"));     
	MemberDAO dao = new MemberDAO();
	BookDAO bkdao = new BookDAO();
	String id = vo.getId();
%> 
</head>
<body>
	<% if(dao.loginCheck(id, pw)){ 
			bkdao.deleteBook(id, payment);%>
			<script>
				alert("예매내역이 삭제되었습니다.")
				window.location.href="mypage.jsp";
			</script>
	<%}else{%>
			<script>
				alert("비밀번호가 다릅니다. 다시 확인해주세요.")
				history.go(-1);
			</script>
	<%}%>
</body>
</html>