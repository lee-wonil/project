<%@page import="project.web.movie.LocalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<jsp:include page="adminHeader.jsp"></jsp:include>
<table>
<tr>
		<td>id</td>
		<td>지역이름</td>		
</tr>
<%	LocalDAO dao = new LocalDAO();
	ArrayList<LocalVO> list = dao.selectAll();
	for(int i=0;i<list.size();i++){
		LocalVO vo = list.get(i);
	%>
	<tr>
		<td><%=vo.getL_id()%></td>
		<td><%=vo.getL_name() %></td>
		<td><button onclick="location.href='localUpdate.jsp?id=<%=vo.getL_id()%>'">수정하기</button></td>
		<td><button onclick="location.href='localDelete.jsp?id=<%=vo.getL_id()%>'">삭제하기</button></td>
		</tr>
	<%}
	
%>
</table>
<button onclick="location.href='localInsert.jsp'">지역삽입</button>
</html>