<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.CinemaVO"%> 
<%@page import="project.web.movie.LocalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.CinemaDAO"%>
<%@page import="project.web.movie.LocalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function change(){
		var value = $('#selecter').val();
		$.ajax({
			type : "post",
			url : "CinemaAjax.jsp",
			data : {value : value},
			success :function(data){
				$("#data2").remove();
				$("#cinema").append(data);
			}
			
		}) 
		
		
	}

</script>

<% 
	LocalDAO Ldao = new LocalDAO(); 
	CinemaDAO Cdao= new CinemaDAO();
	CinemaVO cvo=null;
	ArrayList<LocalVO> list = Ldao.selectAll();
	ArrayList<CinemaVO>list1= Cdao.list();
	MemberVO user = (MemberVO)session.getAttribute("User");
	String u_id=user.getId();
%>
	<form action=favorCinemaPro.jsp method="get">
		<select  onchange="change()" id="selecter"> 
			<option>지역선택</option>
<%
			for(int i=0;i<list.size();i++){	
				LocalVO Lvo = list.get(i);
%>
			<option  value="<%=Lvo.getL_id()%>"><%=Lvo.getL_name() %></option>
<%		
 	 }%>	
		</select>
		
		<select id="cinema" name="data2">
		<option>영화관선택</option>
		</select> 
		<input type="submit" value="추가">
	</form>
	 <jsp:include page="favorCinemaList.jsp">
		<jsp:param name="id1"  value ="<%=u_id %>" /> 
	</jsp:include> 
</html>

