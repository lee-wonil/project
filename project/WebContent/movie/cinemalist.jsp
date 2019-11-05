<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.LocalVO"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@page import="project.web.movie.CinemaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO user = (MemberVO)session.getAttribute("User");
	String id = request.getParameter("id");
	CinemaDAO dao = new CinemaDAO();
	LocalDAO ldao = new LocalDAO();
	ArrayList<CinemaVO> list;
	LocalVO lvo=null;
	if(id==null){
		list= dao.list();
	}		
	else{
		list=dao.list(id);
		lvo = ldao.getLocal(id);

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% if(user!=null&&user.getAdmin()!=0){ %>
<jsp:include page="adminHeader.jsp"></jsp:include>
<%}
else{%>
<jsp:include page="userHead.jsp"></jsp:include>
<% }%>
<div class="container">
<jsp:include page="locallist.jsp"></jsp:include>
<title>전체 상영관 조회</title>
</head>
<body>
<h2><%=id==null ? "전체" : lvo.getL_name() %> 상영관 조회</h2>
<table>
	<tr>
		<td>id</td>
		<td>지점명</td>
		<td>광역권</td>
		<td>위치</td>
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			CinemaVO vo = list.get(i);%>
			<tr>
			<td><%=vo.getC_id() %></td>
			<td><%=vo.getC_name() %></td>
			<td><%=vo.getL_name() %></td>
			<td><%=vo.getC_address() %></td>
			<td><button onclick="window.location.href='screenlist.jsp?id=<%=vo.getC_id()%>'">상영관 조회</button></td>
			<%if(user==null||user.getAdmin()==0){} else{%>
			<td><button onclick="window.location.href='cinemaUpdateForm.jsp?id=<%=vo.getC_id()%>'">영화관 수정</button></td>
			
			</tr>			
		<%}
		}%>
	



</table>
<%if(user!=null&&user.getAdmin()!=0){ %>
	<button onclick="window.location.href='cinemaInsertForm.jsp'">영화관 생성</button>
<%} %>
</div>
</body>
</html>