<%@page import="project.web.movie.GenVO"%>
<%@page import="project.web.movie.GenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<%
	request.setCharacterEncoding("UTF-8");
	GenDAO dao = new GenDAO();
	GenVO vo = new GenVO();
	
%>
<script type="text/javascript">
	// 입력한 장르명 검사
	function genCheck(){

	}
	function confirmGen(userinput){
		if(userinput.name.value==""){
			alert("중복체크를 해주세요.");
			return;
		}
	url = "genCheck.jsp?name="+userinput.name.value;
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizable=no,width=400,height=200");
	}
	

</script>
<body>
	<form action="genInsertPro.jsp" name="userinput" method="post">
		<table>
			<tr>
				<td>장르명 : <input type="text" name="name"/>
				<input type="button" value="중복확인" onclick="javascript:confirmGen(this.form)" />	
				<input type="hidden" name="genDuplication" value="genUncheck"/>
				</td>			
			</tr>
		</table>
			<input type="submit" value="등록" />
	</form>
</body>
</html>