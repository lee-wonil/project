<%@page import="project.web.movie.CinemaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.CinemaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String value = request.getParameter("value");
	ArrayList<CinemaVO> list = new CinemaDAO().list(value);
	for(int i = 0 ; i < list.size() ; i ++){
		CinemaVO cvo= list.get(i); 
		%>
		<option id="data2" value="<%=cvo.getC_id()%>"><%=cvo.getC_name() %></option>
	<%}
%>
	<!-- <input type="submit" value="추가"> -->
	<!-- 여기에 다른걸 추가하니까  ajax가 작동을안하는거같다. -->
