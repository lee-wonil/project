<%@page import="project.web.movie.CinemaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.CinemaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	<table border="1">
		<tr>
	 <%		
	 	//String id="test1";
	 	String id=request.getParameter("id1");	
		CinemaDAO dao= new CinemaDAO();
		String s = dao.getFavorlist(id);
		String sv[] = s.split("/");
	 	for(int i=0; i<sv.length;i++){
	 		if(!sv[i].equals("0")){
	 		CinemaVO cvo=dao.favorload(sv[i]);
	 	
		%>
		<td><a href="screenlist.jsp?id=<%=cvo.getC_id()%>"><%=cvo.getC_name() %></a>
		<input type="button" value="삭제" onclick="location='favordelete.jsp?id=<%=cvo.getC_id()%>'">
		</td></tr>		
		<%}}
	 			%>
	</table>
<body>
</body>
</html>