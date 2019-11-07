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
	String id = request.getParameter("id");
	int pageSize = 9;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;

	MovieDAO dao = new MovieDAO();
	ArrayList<MovieVO> movieDbList = dao.getMovieList(startRow, endRow); //리스트가 있는 dao
	count = dao.getListCount();
	if (count > 0) {
		movieDbList = dao.getMovieList(startRow, endRow);
	}
	number = count - (currentPage - 1) * pageSize;
%>

<body>
	<div class=container>
		<h2>영화 목록</h2>		
			<%
				for (int i = 0; i < movieDbList.size(); i++) {
					MovieVO vo = movieDbList.get(i);
					double booknum = 0;
					int count2 = new BookDAO().getCount();
					if(count2!=0){
					booknum = (((double)vo.getM_public()/new BookDAO().getCount())*100);
					}
					if(i%3==0){%>
						<div class="card-group">
					<% }%>	
		  <div class="col-4">							
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="<%=vo.getM_pic() %>" height="300px" width="auto" alt="Card image cap" onclick="location.href='movieDetail.jsp?id=<%=vo.getM_id()%>'">
				<div class="card-body">
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
		
		<%
			if (count > 0) {
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

				int startPage = (int) (currentPage / 10) * 10 + 1;
				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > 10) {
		%>
		<a href="movielist.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="movielist.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				if (endPage < pageCount) {
		%>
		<a href="movielist.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
		<%
			}
			}
		%>
	</div>
</body>
