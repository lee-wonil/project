<%@page import="project.web.movie.ScoreDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="project.web.movie.MovieVO"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="project.web.movie.MpDAO"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.MpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberVO dto=(MemberVO)session.getAttribute("User");
	MpDAO dao = new MpDAO();
	String id = dto.getId();
	ScoreDAO sdao = new ScoreDAO();
	ArrayList<MpVO> list=dao.mp(id);
	HashMap<Integer,ArrayList<MpVO>> map = dao.payHash(id);
	ArrayList<Integer> list2 = dao.mp2(id);
	MovieDAO mdao = new MovieDAO();
	String path = "";
	Date d = new Date(System.currentTimeMillis());
	
	
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<h3>예매내역</h3>
<table border="1">
	<tr>
		<td>포스터</td>
		<td>영화제목</td>
		<td>영화관명</td>
		<td>상영관</td>
		<td>상영일</td>
		<td>상영시간</td>
		<td>관람</td>
	</tr>
	<% for(Integer a:list2) {
			boolean b = false;
			ArrayList<MpVO> listvo = map.get(a);					
			MpVO vo = listvo.get(0);
			MovieVO mvo = mdao.findById(String.valueOf(vo.getM_id()));
			boolean b2 = sdao.check(id, String.valueOf(mvo.getM_id()));
			cal.setTime(vo.getM_date());
			String [] tem = vo.getM_startTime().split(":");
			cal.add(Calendar.HOUR_OF_DAY, Integer.parseInt(tem[0]));
			cal.add(Calendar.MINUTE, Integer.parseInt(tem[1]));
			if(d.compareTo(cal.getTime())<=0){
				b =true;
			}%>
	<tr>
		<td><img src=<%=mvo.getM_pic()%> width="100px" height="auto">
		</td>
		<td><%=vo.getM_title()%></td>
		<td><%=vo.getC_name()%></td>
		<td><%=vo.getName()%></td>
		<td><%=vo.getM_date()%></td>
		<td><%=vo.getM_startTime()+" ~ "+vo.getM_endTime()%></td>
		<td><%=listvo.size()%>명</td>
		<td>
			<%if(b){%>
			<button onclick="location.href='confirmPass.jsp?payment=<%=vo.getPayNum()%>'">예매취소</button> 
			<%}else{
				if(!b2){%>
			<button onclick="location.href='movieScoreForm.jsp?m_id=<%=vo.getM_id()%>'">평가하기</button> 
			<%}else{%>
				<button onclick="location.href='movieDetail.jsp?id=<%=vo.getM_id()%>'">평가보기</button> 
				<% }
			}%>
		</td>
	</tr>
	<%}%>
</table>
