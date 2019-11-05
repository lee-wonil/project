<%@page import="project.web.movie.BookDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.MscrnVO"%>
<%@page import="project.web.movie.MscrnDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>
<%
	MemberVO user = (MemberVO)session.getAttribute("User");
	BookDAO bdao = new BookDAO();
	if(user==null||user.getAdmin()==0){%>
		<script type="text/javascript">
		alert("잘못된 접근입니다.");
		window.location.href="main.jsp";
		</script>
	<% }
	else{%>
		<jsp:include page="adminHeader.jsp"></jsp:include>
	<%}
	String id = request.getParameter("id");
	MscrnDAO dao = new MscrnDAO();
	ArrayList<MscrnVO> list=null;
	if(id!=null){
		list = dao.listAll(id);
	}
	else{
		list = dao.listAll();
	}
	ScreenDAO sdao  = new ScreenDAO();
	%>
<div class="container">
<h2>상영시간표</h2>
<table>
	<tr>
		<td>영화제목</td>
		<td>영화관</td>
		<td>상영관</td>
		<td>상영일</td>
		<td>시작시간</td>
		<td>종료시간</td>
		<td>좌석점유율</td>
		<td>매출</td>
		
	</tr>
	<% for(int i=0;i<list.size();i++){
		MscrnVO vo = list.get(i);
		ScreenVO svo = sdao.get(String.valueOf(vo.getS_id()));
		%>
		<tr>
			
			<td><%=new MovieDAO().findById(String.valueOf(vo.getM_id())).getM_title()  %></td>
			<td><%=svo.getTheaterName() %></td>
			<td><%=svo.getName()%></td>
			<td><%=vo.getM_date() %></td>
			<td><%=vo.getM_startTime() %></td>
			<td><%=vo.getM_endTime()%></td>
			<td><%=bdao.get(String.valueOf(vo.getId()))+"/"+vo.getM_poseat()%></td>
			<td><%=vo.getM_price() * bdao.get(String.valueOf(vo.getId())) %></td>
			
			<%if(user==null||user.getAdmin()==0) {%>
			<td><button onclick="window.location.href='book1.jsp?id=<%=vo.getId() %>'">예매하기</button></td>	
			<%}else{ %>
			<td><button onclick="window.location.href='booklist.jsp?id=<%=vo.getId() %>'">예매정보보기</button></td>
		<%} %>
		</tr>
	<%}%>
	
</table>
<% 
	if(user==null||user.getAdmin()==0||id==null){%>	
	<%}else{%>
	<button onclick="location.href='mscrnInsert.jsp?id=<%=id%>'">등록하기</button>
<%}%>
</div>
</body>
</html>