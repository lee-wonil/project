<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function check(){
		var user = eval("document.screenInput");
		if(!user.name.value){
			alert("이름을 입력하세요");
			return false;
		}
		if(!user.low.value){
			alert("행을 입력하세요");
			return false;
		}
		if(!user.col.value){
			alert("열을 입력하세요");
			return false;
		}
		return true;
		
	}
</script>
<form action="ScreenForm2.jsp" method="post" onsubmit="return check()" name="screenInput">
<%
	String c_id = (String)session.getAttribute("c_id");
	if(c_id == null){
		c_id = request.getParameter("id");
	}

	String id = request.getParameter("sid");
	if(id==null){
%>
<h2>상영관생성</h2>
상영관 이름<input type="text" name="name"/><br/>
행<input type="text" name="low" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br/>
열<input type="text" name="col" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br/>
<input type="hidden" name="c_id" value="<%=c_id%>">
<input type="submit" value="확인"/>

<%	}
	else{
		ScreenDAO dao = new ScreenDAO();
		ScreenVO vo = dao.get(id);
%>	
	<h2>상영관수정</h2>
	상영관 이름<input type="text" name="name" value="<%=vo.getName()%>"/><br/>
	행<input type="text" name="low" value="<%=vo.getRow()%>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br/>
	열<input type="text" name="col" value="<%=vo.getCol()%>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /><br/>
	<input type="hidden" name="id" value="<%=id%>"/>
	<input type="hidden" name="c_id" value="<%=c_id%>">	
	<input type="submit" value="확인"/>
	
<%
	}	
%>
</form>