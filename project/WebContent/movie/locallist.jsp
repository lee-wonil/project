<%@page import="project.web.movie.LocalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<a href="cinemalist.jsp">전체</a>
<%	LocalDAO dao = new LocalDAO();
	ArrayList<LocalVO> list = dao.selectAll();
	for(int i=0;i<list.size();i++){
		LocalVO vo = list.get(i);
	%>
		<a href="cinemalist.jsp?id=<%=vo.getL_id()%>"><%=vo.getL_name() %></a>
	<%}
	
%>
</html>