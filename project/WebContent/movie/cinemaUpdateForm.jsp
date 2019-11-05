<%@page import="project.web.movie.CinemaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@page import="project.web.movie.LocalVO"%>
<%@page import="project.web.movie.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	CinemaDAO dao = new CinemaDAO();
	CinemaVO cvo = dao.getcvo(id);
	LocalDAO ldao= new LocalDAO();
	ArrayList<LocalVO> list=ldao.selectAll();
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 수정</title>
</head>
<body>
	<form action="cinemaUpdatePro.jsp" method="post">
		<input type="hidden" name="c_id" value="<%=cvo.getC_id()%>">
		
		<table>
			<tr>
				<td>지점</td>
				<td><input type="text" name="c_name" value="<%=cvo.getC_name()%>"></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><select name="l_id">
					<%
						for(int i=0;i<list.size();i++){
							LocalVO vo=list.get(i);
							if(vo.getL_id()==cvo.getL_id()){%>
								<option value="<%=vo.getL_id()%>" selected="selected"><%=vo.getL_name() %></option>
							<% }else{%>
							<option value="<%=vo.getL_id()%>"><%=vo.getL_name() %></option>
					<% 		}
						}%>	
					</select></td>
			</tr>
			<tr>
			<td>세부주소</td>
			<td><input type="text" name="c_address" value="<%=cvo.getC_address()%>"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록완료"></td>
			</tr>
		</table>	
	</form>
</body>
</html>