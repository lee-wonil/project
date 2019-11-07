<%@page import="project.web.movie.MemberVO"%>
<%@page import="java.util.Arrays"%>
<%@page import="project.web.movie.CinemaVO"%>
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


CinemaDAO dao=new CinemaDAO();
MemberVO user = (MemberVO)session.getAttribute("User");
String id = user.getId();
String s = dao.getFavorlist(id);
String c_id=request.getParameter("id");
String sv[] = s.split("/");
for(int i=0; i<sv.length; i++){ //0, 3,  ++
	if(sv[i].equals(c_id)){  //[1][2][3]
		sv[i]="0";		
	}
}
String tem = "";
for(int i=0; i<sv.length; i++){ //0, 3,  ++
	if(!sv[i].equals("0")){  //[1][2][3]
		if(i==sv.length-1){
			tem+=(sv[i]);
		}else{
			tem+=(sv[i]+"/");
		}	
	}	
}
if(tem==""){
	tem="0";
}
dao.favorinsert(tem, id);
response.sendRedirect("favorCinemaForm.jsp"); 
%>
<body>

</body>
</html>