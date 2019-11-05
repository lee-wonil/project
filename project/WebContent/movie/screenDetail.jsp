<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@page import="project.web.movie.ScreenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	ScreenDAO dao = new ScreenDAO();
	ScreenVO vo = dao.get(id);
	MemberVO user = (MemberVO)session.getAttribute("User");
	if(user!=null&&user.getAdmin()!=0){%>
		<jsp:include page="adminHeader.jsp"></jsp:include>
	<% }else{%>
		<jsp:include page="userHead.jsp"></jsp:include>
	<% }
%>
<h2>상세보기</h2>
<table>	
	<tr>
		<td>극장이름</td>
		<td><%=vo.getTheaterName()%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=vo.getName()%></td>
	</tr>
	<tr>
		<td>총좌석수</td>
		<td><%=vo.getNum()%></td>
	</tr>
	<tr>
		<td>행</td>
		<td><%=vo.getRow()%></td>
	</tr>
	<tr>
		<td>열</td>
		<td><%=vo.getCol()%></td>
	</tr>
</table>
<jsp:include page="seat.jsp">
	<jsp:param value="<%=id%>" name="id" />
</jsp:include>
<% if(user!=null&&user.getAdmin()!=0){%>
<button onclick="location.href='ScreenForm1.jsp?sid=<%=vo.getId()%>'">수정하기</button>
<%}%>