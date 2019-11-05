<%@page import="project.web.movie.GradeVO"%>
<%@page import="project.web.movie.GradeDAO"%>
<%@page import="project.web.movie.GenDAO"%>
<%@page import="project.web.movie.GenVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화등록</title>
</head>
<jsp:include page="adminHeader.jsp"></jsp:include>

<%
	request.setCharacterEncoding("UTF-8");
	GenDAO dao = new GenDAO();
	ArrayList <GenVO> genlist = dao.selectAll();
	GradeDAO gDao = new GradeDAO();
	ArrayList<GradeVO> gradelist = gDao.selectAllGrade();
	
%>
<script type="text/javascript">
	function popup(){
		var url = "posterForm.jsp";
		var name = "poterInsert";
		var option ="width=350, height=400";
		window.open(url, name, option);
}
</script>
<body>
<h2>영화 등록</h2>
<form action="movieInsertPro.jsp" method="post" enctype="multipart/form-data">
		<table>
			
			<tr>
				<td>ㆍ영화제목</td>
				<td><input type="text" name="m_title"/></td>
			</tr>
			<tr>
				<td>ㆍ러닝타임</td>
				<td><input type="text" name="m_time"/></td>
			</tr>
			<tr>
				<td>ㆍ장르</td> 
				<td>
					<select name="m_gen">
					<% // 영화 등록하면서 장르 선택할 때 셀렉트 박스로 담기게 하는 for문
						for(int i =0; i<genlist.size();i++){	
						GenVO dto = genlist.get(i);		// db에 저장된 장르명들 장르 리스트에 담아서 장르 dto변수에 저장%>		
						<option value=<%= dto.getId() %>><%= dto.getName() %></option><%-- 체크박스로 보여줌 --%>
						<%}%> 
					</select>
				</td>
			</tr>			
			<tr>
				<td>ㆍ연령등급</td>
				<td>
					<select name="m_grade">
						<% // 연령등급도 마찬가지로 db에 저장된 name 셀렉트 박스로 보여줘서 선택하게 함.
							for(int i = 0; i<gradelist.size();i++){
							GradeVO gDto = gradelist.get(i);%>
							<option value="<%= gDto.getId()%>"><%= gDto.getName() %></option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
						
			</tr>
			<tr>
				<td>포스터등록</td>
				<td><input type="file" name="poster"></td>
			</tr>
		</table>
		<input type="submit" value="작성완료">
	</form>
</body>
</html>