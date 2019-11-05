<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.CinemaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.CinemaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberVO user = (MemberVO)session.getAttribute("User");
	String s1=request.getParameter("data2");
	CinemaDAO dao= new CinemaDAO();
	String id= user.getId();
	String s = dao.getFavorlist(id);
	boolean b = false;	// 중복검사
	String sv[] = s.split("/");
	for(int i=0;i<sv.length;i++){
		if(sv[i].equals(s1)){			
			b= true;
		 }
	}
	if(!s.equals("0")){
		s+="/"+s1;
	}
	else{
		s=s1;
	}
	if(sv.length>5){
		// 5개넘어가는 경우 
%>
	<script>
		alert("5개 초과");
		history.go(-1);
	</script>	
<%
	}
	else{
		if(!b){
		dao.favorinsert(s, id);
%> 		<script>alert("추가완료")</script>		
<%
		response.sendRedirect("favorCinemaForm.jsp");
		}
		else{%>
			<script>
			alert("이미 추가되어있는 영화관입니다.");
			location.href="favorCinemaForm.jsp";		
		</script>	
		<%}
	}	
%>


<body>

</body>
</html>