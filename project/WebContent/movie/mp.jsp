<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="project.web.movie.MpDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.MpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberVO dto=(MemberVO)session.getAttribute("User");
	MpDAO dao = new MpDAO();
	ArrayList<MpVO> list=dao.mp(dto.getId());
%>
		<h3>예매내역</h3>
		<table border="1">
			<tr>
				<td>포스터</td>
				<td>영화제목</td>
				<td>영화관명</td>
				<td>상영관</td>
				<td>상영일</td>
				<td>시작시간</td>
				<td>종료시간</td>
			</tr>
			<% for(MpVO vo:list) {%>
			<tr>
				<td><%=vo.getM_id()%></td>
				<td><%=vo.getM_title()%></td>
				<td><%=vo.getC_name()%></td>
				<td><%=vo.getName()%></td>
				<td><%=vo.getM_date()%></td>
				<td><%=vo.getM_startTime()%></td>
				<td><%=vo.getM_endTime()%></td>
			</tr>
			<%}%>
		</table>
