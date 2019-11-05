<%@page import="project.web.movie.LocalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="adminHeader.jsp"/>
<h2>영화관 등록</h2>
<%
	LocalDAO dao= new LocalDAO();
	ArrayList<LocalVO> list=dao.selectAll();
%>
<head>
<meta charset="UTF-8">
<title>영화관 등록</title>
</head>
<body>
	<form action=cinemaInsertpro.jsp method="post">
		<table>
			<tr>
				<td>지점</td>
				<td><input type="text" name="c_name"></td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
				<select name="l_id">
					<%
						for(int i=0;i<list.size();i++){
							LocalVO vo=list.get(i);
					%>
						<option value="<%=vo.getL_id()%>"><%=vo.getL_name() %></option>
					<% 	}%>	
					    </select>
						</td>
				
			</tr>
			<tr>
			<td>세부주소</td>
			<td><input type="text" name="c_address"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록완료">
					
				</td>
			</tr>
		</table>	
		
	</form>
</body>
</html>