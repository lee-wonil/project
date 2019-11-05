<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=1;i<=4;i++){%>
		<button onclick="window.location.href='test2.jsp?num=<%=i%>'"><%=i%>명</button>
	<%}

%>