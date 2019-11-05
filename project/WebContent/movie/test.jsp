<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="project.web.movie.MscrnDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MscrnDAO dao = new MscrnDAO();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String dates = "2019-10-31";
	Date date = sf.parse(dates);
	sf = new SimpleDateFormat("HH:mm");
	String startTime = "16:00";
	String endTime = "20:00";
	boolean b = dao.checkTime(1, date, startTime, endTime);
	
%>
<%=b %>	
</body>
</html>