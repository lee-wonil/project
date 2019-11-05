<%@page import="project.web.movie.ScreenVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.MscrnDAO"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영예정작 등록</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String mid = request.getParameter("id");
	MovieDAO mdao = new MovieDAO();
	MscrnDAO dao = new MscrnDAO();
	ScreenDAO sdao = new ScreenDAO();
	ArrayList<ScreenVO> list =  sdao.list();
%>
<body>
	<form action="mscrnInsertPro.jsp" method="post">
	<input type="hidden" name="m_id" value="<%= mid %>"/>
		<table>
			<tr>
				<td>영화이름 :</td>
				<td><%=mdao.findById(mid).getM_title() %></td>
			</tr>
			<tr>			
				<td>날짜 : </td>
				<td><input type="date" name="m_date"/></td>
			</tr>
			<tr>
				<td>시작 시간</td>
				<td><input type="time" name="m_startTime"/></td>
			</tr>
			<tr>
				<td>상영관 </td>
				<td><select name="s_id">
				<%	for(int i =0;i<list.size();i++){
					ScreenVO vo = list.get(i);%>
					<option value="<%=vo.getId()%>"><%=vo.getTheaterName()+"지점"+vo.getName() %></option>
				<% }
					
				%>
				
				</select> </td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="m_price"/></td>
			</tr>
		</table>
		<input type="submit" value="등록" />
	</form>
</body>
</html>