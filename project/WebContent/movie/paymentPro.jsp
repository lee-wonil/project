<%@page import="project.web.movie.BookDAO"%>
<%@page import="project.web.movie.BookVO"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<BookVO> list = (ArrayList<BookVO>)session.getAttribute("list");
	BookDAO dao = new BookDAO();
	int num = dao.getpaymentseq();
	for(int i=0;i<list.size();i++){
		BookVO vo = list.get(i);
		dao.payment(dao.getId(vo),num);
	}
%>
</body>
<script type="text/javascript">
alert("예매완료");
location.href="main.jsp";
</script>
</html>