<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
	<jsp:include page="userHead.jsp" flush="false" />
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
	<script>
	function confirmId(userinput) {
		var getCheck = 	RegExp(/^[A-Za-z0-9]{4,12}$/);
		
		if(userinput.id.value == "") {
			alert("아이디를 입력하세요.");
			return; 
		}else if(!getCheck.test($("#tbID").val())){
			alert("형식에 맞게 입력해주세요");
			return;
		}else if(getCheck.test($("#tbID").val())){
			url = "confirmId.jsp?id="+userinput.id.value;
			open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=300, height=200");
		}
	}
	
	
	function check() {
		var getCheck = 	RegExp(/^[A-Za-z0-9]{4,12}$/);
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getName = RegExp(/^[가-힣]+$/);
		var getPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		
		//아이디 공백 확인
		if($("#tbID").val() == "") {
			alert("아이디를 입력하세요.");
			$("#tbID").focus();
			return false;
		}
		
		//아이디의 유효성 검사
		if(!getCheck.test($("#tbID").val())){
			alert("형식에 맞게 입력해주세요");
			$("#tbID").val("");
			$("#tbID").focus();
			return false;
		}
		
		
		//비밀번호
		if(!getCheck.test($("#tbPW").val())) {
			alert("비밀번호를 형식에 맞춰서 작성해주세요.")
			$("#tbPW").val("");
			$("#tbPW").focus();
			return false;
		}

		//아이디 비밀번호 동일한지 여부
		if($("#tbID").val()==($("#tbPW").val())) {
			alert("아이디와 비밀번호가 동일합니다. 다시 입력해주세요.");
			$("#tbPW").val("");
			$("#tbPW").focus();
		}
		
		//비밀번호 동일여부
		if($("#tbPW").val() != $("#tbPWCF").val()) {
			alert("비밀번호가 다릅니다. 다시 입력해주세요.");
			$("#tbPW").val("");
			$("#cpass").val("");
			$("#tbPW").focus();
			return false;
		}
		
		//이름의 유효성 검사
		if (!getName.test($("#name").val())) {
	        alert("이름을 한글로 제대로 써주세요");
	        $("#name").val("");
	        $("#name").focus();
	        return false;
	    }
		
		if ($("#date").val()=="") {
			alert("생년월일을 골라주세요.");
			return false;
		}
		
		//폰번호 유효성 검사
		if(!getPhone.test($('#phone').val())){
			alert("잘못된 휴대폰 번호입니다.");
			$('#phone').focus();
		 	return false;    
		}
		
		
		//이메일 미입력시
		if($("#mail").val() == ""){
			alert("이메일을 입력해주세요");
			$("#mail").focus();
			return false;
		}
		
		//이메일 유효성 검사
		if(!getMail.test($("#mail").val())){
			alert("이메일형식에 맞게 입력해주세요");
			$("#mail").val("");
			$("#mail").focus();
			return false;
		}
		
	}
		
		$(document).ready(function(){
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("#tbPWCF").keyup(function(){
				var pwd1=$("#tbPW").val();
				var pwd2=$("#tbPWCF").val();
				if(pwd1 !="" || pwd2 !="") {
					if(pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled")
					}else{
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled","disabled")
					}
				}
			});
		});
		
	</script>
</head>
<body>
	<br/>
	<br/>
	<hr/>
	<form action="registPro.jsp" name = "userinput" method="post" onsubmit="return check()">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name ="id" id="tbID"/></td>
				<td> <input type="button" name="checkId" value="ID중복검사" onclick="confirmId(this.form)" /> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name ="passwd" id="tbPW"/></td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name ="passwdCF" id="tbPWCF"/></td>
			</tr>
			<tr>
				<td colspan="2"><div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div></td>
				<td></td>				
			</tr>
			<tr>		
				<td>이름</td>
				<td><input type="text" name ="name" id="name"/></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name ="birth" id="date"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="phone" id="phone" placeholder="예)010-1234-1234" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" id="mail" placeholder="예)mylife@naver.com"/></td>
			</tr>
			<tr>
            	<td><input type="submit" value = "가입"  id="submit"/></td>
            <tr>
		</table>
	</form>
	
</body>
</html>