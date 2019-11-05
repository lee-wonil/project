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

String tt="test";
String id=request.getParameter("id"); //c_id값 문자열로받아옴
CinemaDAO dao=new CinemaDAO();
String s = dao.getFavorlist(tt);
String sv[] = s.split("/");
for(int i=0; i<sv.length; i++){ //0, 3,  ++
	if(sv[i].equals(id)){  //[1][2][3]
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
dao.favorinsert(tem, tt);
response.sendRedirect("favorCinemaForm.jsp"); 
%>
<body>

</body>
</html>