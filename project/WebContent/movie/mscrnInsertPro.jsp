<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="project.web.movie.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.MovieDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="project.web.movie.MscrnVO"%>
<%@page import="project.web.movie.MscrnDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mscrn insert pro</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	MscrnVO vo = new MscrnVO();
	MscrnDAO dao = new MscrnDAO();
	MovieDAO mdao = new MovieDAO();
	ScreenDAO sdao = new ScreenDAO();
	String m_id = request.getParameter("m_id");
	vo.setM_id(Integer.parseInt(m_id));
	String date = request.getParameter("m_date");
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	vo.setM_date(df.parse(date)); 	
	MovieVO mdto = mdao.findById(m_id);
	String startTime = request.getParameter("m_startTime");
	vo.setM_startTime(startTime);
	String s [] = request.getParameter("m_startTime").split(":");
	int hour = Integer.parseInt(s[0]);
	int min = Integer.parseInt(s[1]);
	Calendar cal = Calendar.getInstance();
	cal.setTime(vo.getM_date());
	cal.set(Calendar.HOUR_OF_DAY,hour);
	cal.set(Calendar.MINUTE,min);
	cal.add(Calendar.MINUTE,+mdto.getM_time());	
	df = new SimpleDateFormat("HH:mm");
	String lastTime = df.format(cal.getTime());
	vo.setM_endTime(lastTime);
	String s_id = request.getParameter("s_id");
	vo.setS_id(Integer.parseInt(s_id));
	vo.setM_poseat(sdao.get(s_id).getNum());
	vo.setM_price(Integer.parseInt(request.getParameter("m_price")));
	if(cal.getTime().getTime()<System.currentTimeMillis()){%>
		<script>
		alert("시간대 설정이 잘못되었습니다.");
		history.go(-1);
		</script>	
	<%}else{
	if(dao.checkTime(vo.getS_id(), vo.getM_date(), vo.getM_startTime(), vo.getM_endTime())){%>
		<script>
		alert("이미 생성되어 있는 시간대 입니다.");
		history.go(-1);
		</script>
	<% }
	else{
		dao.insertMscrn(vo);
		response.sendRedirect("mscrnList.jsp?id="+m_id);
		}
	}

%>	

<body>
</body>
</html>