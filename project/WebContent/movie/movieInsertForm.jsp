<%@page import="project.web.movie.MemberVO"%>
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
<title>Insert title here</title>
</head>
<%
	MemberVO admin = (MemberVO)session.getAttribute("User");
	if(admin==null){%>
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			window.location.href="loginForm.jsp";
		</script>
	<%}else if(admin.getAdmin()!=0){%>
		<jsp:include page="adminHeader.jsp"></jsp:include>		
	<%}else{%>
		<script type="text/javascript">
			alert("사용할 수 없는 권한 입니다.");
			window.location.href="adminMain.jsp";
		</script>
<%}
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
	function check(){
		var check = document.input;
		if(input.m_title.value==""||input.m_time.value==""){
			alert("필수 입력란이 비었습니다.");
			return false;			
		}
		return true;
	}
</script>
<body>
<form action="movieInsertPro.jsp" name="input" method="post" enctype="multipart/form-data" onsubmit="return check()">
		<table>
			<tr>
				<td>ㆍ영화제목<input type="text" name="m_title"/></td>
			</tr>
			<tr>
				<td>ㆍ러닝타임<input type="text" name="m_time"/></td>
			</tr>
			<tr>
				<td>ㆍ장르</td> 
			</tr>
			<tr>
				<td>
					<select name="m_gen">
					<%
									for(int i =0; i<genlist.size();i++){	
									GenVO dto = genlist.get(i);		// db에 저장된 장르명들 장르 리스트에 담아서 장르 dto변수에 저장
					%>		
						<option value=<%=dto.getId()%>><%=dto.getName()%></option><%-- 체크박스로 보여줌 --%>
						<%
							}
						%> 
					</select>
				</td>
			</tr>			
			<tr>
				<td>ㆍ별점</td>
			</tr>
			<tr>
				<td>ㆍ관객수</td>
			</tr>
			<tr>
				<td>ㆍ연령등급</td>
			</tr>
			<tr>
				<td>
					<select name="m_grade">
						<%
							// 연령등급도 마찬가지로 db에 저장된 name 셀렉트 박스로 보여줘서 선택하게 함.
											for(int i = 0; i<gradelist.size();i++){
											GradeVO gDto = gradelist.get(i);
						%>
							<option value="<%= gDto.getId()%>"><%= gDto.getName() %></option>
						<% } %>
					</select>
				</td>		
			</tr>
			<tr>
				<td>
				포스터등록
				<input type="file" name="poster">
				</td>
			</tr>
		</table>
		<input type="submit" value="작성완료">
	</form>
</body>
</html>