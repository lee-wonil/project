<%@page import="project.web.movie.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.MovieVO"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="userHead.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<%

	MovieDAO dao = new MovieDAO();
	ArrayList<MovieVO> movieDbList = dao.getMovieList(1, 3); //리스트가 있는 dao
	
	
%>

<body>
	<div class=container>
		<h2>영화 목록</h2>		
			<%
				for (int i = 0; i <movieDbList.size(); i++) {
					MovieVO vo = movieDbList.get(i);
					int count = new BookDAO().getCount();
					double booknum = 0;
					if(count!=0){
					booknum = (((double)vo.getM_public()/new BookDAO().getCount())*100);
					}
					if(i%3==0){%>
						<div class="card-group">
					<% }%>	
		  <div class="col-4">							
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="<%=vo.getM_pic() %>" height="300px" width="auto" alt="Card image cap" onclick="location.href='movieDetail.jsp?id=<%=vo.getM_id()%>'">
				<div class="card-body">
					<strong>예매율 : <%=i+1 %>위 </strong>
					<h5 class="card-title"><%=vo.getM_title() %></h5>
					<p>예매율 : <%=String.format("%.2f", booknum)+"%" %></p>	
					<button onclick="location.href='mscrnList.jsp?id=<%=vo.getM_id() %>'">시간표 조회</button>				
				</div>
			</div>
			</div>
			<%		if(i%3==2||i==movieDbList.size()-1){%>
					</div>
			<% }
				}
					

			
		%>
	</div>
</body>
