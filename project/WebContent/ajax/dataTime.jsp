<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		window.setInterval("time()",1000);
		});
	function time(){
		$.ajax({
			type:"post",
			url:"time.jsp",
			data:{num:100,id:"java"},
			success:function(data){
				$("#result").html(data);
			}
		});
			
	}
</script>
<body>
	<button id="btn" onclick="time()">클릭</button>
	<div id="result"></div>
</body>
