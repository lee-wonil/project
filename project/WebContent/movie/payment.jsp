<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.MscrnVO"%>
<%@page import="project.web.movie.MscrnDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>예매정보</h2>
<table>
<%
	ArrayList<BookVO> list = (ArrayList<BookVO>)session.getAttribute("list");
	
	BookVO vo = list.get(0);
	MscrnDAO mdao = new MscrnDAO();
	MscrnVO mvo = mdao.get(String.valueOf(vo.getT_id()));
	
	%>
	<tr>
		<td>영화명</td>
		<td><%=mvo.getM_title() %></td>
	</tr>
	<tr>
		<td>상영관</td>
		<td><%=new ScreenDAO().get(String.valueOf(mvo.getS_id())).getTheaterName() %></td>
	</tr>
	<tr>
		<td>상영시간</td>
		<td><%=mvo.getM_startTime()+"~"+mvo.getM_endTime() %> </td>
	</tr>
	<tr>
		<td>예매좌석</td>
		<td><%=vo.getSeat()+", " %>
	
	<% for(int i=1;i<list.size();i++){
		vo = list.get(i);
		if(i<list.size()-1){%>		
			<%=vo.getSeat()+", "%>
		<%}
		else{%>
			<%= vo.getSeat() %>
		<%}
	
	
	}%>
	</td>
	</tr>
	<tr>
		<td>총 가격</td>
		<td><%=mvo.getM_price()*(list.size())%></td>
	</tr>


</table>
<h5>결제수단을 선택하세요</h5>
<button onclick="location.href='paymentPro.jsp'">결제</button>

</body>
</html>