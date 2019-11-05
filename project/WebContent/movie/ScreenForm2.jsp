<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>통로설정</h2>
<form action="screenForm3.jsp">
<table>
	<%
	request.setCharacterEncoding("UTF-8");
	String rol= request.getParameter("low");
	String col = request.getParameter("col");
	String name = request.getParameter("name");
	String id = request.getParameter("id");	
	String c_id = request.getParameter("c_id");
	ScreenVO svo = new ScreenVO(); 
	if(id!=null){	
		svo = new ScreenDAO().get(id);
	}
	int rol1 = Integer.parseInt(rol);
	int col1 = Integer.parseInt(col);
	svo.setCol(col1);
	svo.setRow(rol1);
	svo.setName(name);
	svo.setTheaterId(Integer.parseInt(c_id));
	session.setAttribute("svo", svo);
	int i=0;
	int j=0;
	for(i=0;i<=col1;i++){%>
	<tr>
		<%for(j=0;j<=rol1;j++){
			if(j==0&&i==0){%>
			<td></td>
			<% }else if(j==0||i==0){%>
			<td><input type="checkbox" name="passage"value="<%=i*100+j%>"></td>
			<%}
			else{%>
			<td>O</td>
			<%}
		}%>
	</tr>
	<%}%>
</table>
<input type="submit" value="전송">
</form>