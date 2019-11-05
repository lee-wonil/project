<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼페이지</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script>
	
	$(document).ready(function(){
		 $('#hiddenId').hide();
		 $('#hiddenPW').hide();
	});
	
	function checkAll(){
		var id = $('#idd').val();
		var pw = $('#pwd').val();
		if(id == null || id== ""){
			 $('#hiddenId').show();
			 $('#hiddenPW').hide();
			 return false;
		}else if (pw == null || pw =="" ){
			 $('#hiddenPW').show();
			 $('#hiddenId').hide();
			 return false;
		}else if( id != "" && pw !=""){
			return true;
		}
	}
	
</script>
</head>
<jsp:include page="userHead.jsp"/>
<body>
	<form action="loginPro.jsp" method="post"  onsubmit="return checkAll()" >
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id="idd" class="form-control" /></td>
			
		</tr>
		<tr>
		<td></td>
		<td><span class="alert alert-danger" id="hiddenId">id를 입력해주세요</span><td>
		</tr>
		<tr></tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" id="pwd" class="form-control" /></td>
			
		</tr>
		<tr>
			<td></td>		
			<td><p class="alert alert-danger" id="hiddenPW">비밀번호를 입력해주세요</p></td>
		</tr>
	</table>
			<input type="submit" value="로그인" />
	</form>
</body>
</html>