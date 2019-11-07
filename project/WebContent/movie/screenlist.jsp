<%@page import="project.web.movie.CinemaDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.ScreenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	ScreenDAO dao = new ScreenDAO();
	ArrayList<ScreenVO> list=null;
	MemberVO user = (MemberVO)session.getAttribute("User");
	CinemaDAO cdao = new CinemaDAO();
	if(id==null){
		list = dao.list();
	}
	else{
		list =dao.list(id);
	}
	session.setAttribute("c_id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%if(user!=null&&user.getAdmin()!=0){ %>
<jsp:include page="adminHeader.jsp"></jsp:include>
<%}else{%>
<jsp:include page="userHead.jsp"></jsp:include>
<%} %>
<body>
<h2>상영관 목록</h2>
<table>
	<tr>
		<td>영화관이름</td>
		<td>상영관 이름</td>
		<td>상영관 좌석</td>
		<td>상영관 행</td>
		<td>상영관 열</td>
		<td>좌석상세보기</td>
	</tr>

	<%
	for(int i=0;i<list.size();i++){
		ScreenVO vo = list.get(i);
		%>
		<tr>
			<td><%=cdao.getcvo(vo.getTheaterId()+"").getC_name()%></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getNum() %></td>
			<td><%=vo.getRow() %></td>
			<td><%=vo.getCol() %></td>
			<td><button onclick="location.href='screenDetail.jsp?id=<%=vo.getId()%>'">상세보기</button></td>		
		</tr>
	<% }
	
	%>


</table>
<% if(id!=null&&user!=null&&user.getAdmin()!=0) {%>
<button onclick="window.location.href='ScreenForm1.jsp'">생성하기</button>
<%} %>
</body>
</html>