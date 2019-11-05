<%@page import="project.web.movie.MscrnVO"%>
<%@page import="project.web.movie.MscrnDAO"%>
<%@page import="project.web.movie.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String id = request.getParameter("id");
	BookDAO dao = new BookDAO();
	MemberVO user = (MemberVO)session.getAttribute("User");
	MscrnVO mvo = new MscrnDAO().get(id);
	%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(user==null||user.getAdmin()==0){%>
		<script>
			alert("잘못된 접근입니다.");
			window.location.href="main.jsp";
		</script>
	<% }
	else{%>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<h2>예매정보보기</h2>
	<table>
	<tr>
	<td>영화제목</td>
	<td>예매자id</td>
	<td>결제번호</td>
	<td>좌석</td>
	<td>예매시간</td>
	</tr>
	<%
		ArrayList<BookVO> list = dao.list(id);
		for(int i=0;i<list.size();i++){
			BookVO vo = list.get(i);%>
			<tr>
				<td><%=mvo.getM_title()%></td>
				<td><%=vo.getU_id() %></td>
				<td><%=vo.getPayment() %> </td>
				<td><%=vo.getSeat() %></td>
				<td><%=vo.getBooktime()%></td>
			
			</tr>
		<%}
	}
%>
</table>
<h4>총예매자 수 <%=dao.get(id) %></h4>
<h4>좌석 점유율 <%=((double)Math.round(((double)dao.get(id)/mvo.getM_poseat())*10000)/100)+"%"  %></h4>

</body>
</html>