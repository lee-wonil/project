<%@page import="project.web.movie.LocalVO"%>
<%@page import="project.web.movie.LocalDAO"%>
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
	LocalDAO dao = new LocalDAO();
	LocalVO vo = new LocalVO();
	
%>
<script type="text/javascript">
	// 입력한 장르명 검사
	function genCheck(){

	}
	function confirmLocal(userinput){
		if(userinput.name.value==""){
			alert("중복체크를 해주세요.");
			return;
		}
	url = "localCheck.jsp?name="+userinput.name.value;
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizable=no,width=400,height=200");
	}
	

</script>
<body>
	<form action="localInsertPro.jsp" name="userinput" method="post">
		<table>
			<tr>
				<td>지역명 : <input type="text" name="name"/>
				<input type="button" value="중복확인" onclick="javascript:confirmLocal(this.form)" />	
				<input type="hidden" name="genDuplication" value="genUncheck"/>
				</td>			
			</tr>
		</table>
			<input type="submit" value="등록" />
	</form>
</body>
</html>