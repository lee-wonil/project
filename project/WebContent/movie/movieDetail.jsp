<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.BookDAO"%>
<%@page import="project.web.movie.ScoreDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@page import="project.web.movie.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
	String id = request.getParameter("id");
	MovieDAO dao = new MovieDAO();
	MovieVO vo = dao.findById(id);
	ScoreDAO sdao = new ScoreDAO();
	BookDAO bdao = new BookDAO();
	MemberVO user = (MemberVO)session.getAttribute("User");

%>
<html>
<head>
<meta charset="UTF-8">
<title><%=vo.getM_title()%></title>
</head>
<jsp:include page="userHead.jsp"></jsp:include>
<body>
	<h3>영화 상세보기</h3>
	<table>
		<tr>
			<td>영화제목</td>
			<td>러닝타임</td>
			<td>장르</td>
			<td>별점</td>
			<td>관객수</td>
			<td>연령등급</td>
		</tr>		
		<tr>
			<td><%=vo.getM_title() %></td>
			<td><%=vo.getM_time() %></td>
			<td><%=vo.getM_genName() %></td>
			<td><%=sdao.average(id)%></td>
			<td><%=bdao.get(id) %></td>
			<td><%=vo.getM_gradeName() %></td>
		</tr>
		<tr>
		<%%>
			<td>
				<input type="button" value="상영시간표" onclick="mscrnList.jsp"/>				
				<%if(user!=null&&user.getAdmin()!=0){ %>
				<button>삭제하기</button>
				<button>수정하기</button>
				<%} %>
			</td>
		</tr>
	</table>
	<jsp:include page="scoreList.jsp"><jsp:param value="<%=id %>" name="id"/></jsp:include>
</body>
</html>