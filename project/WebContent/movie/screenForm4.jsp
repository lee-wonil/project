<%@page import="project.web.movie.ScreenVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<h2>좌석 최종 조회</h2>
<form action="screenPro.jsp">
<table>
<%
	String[] seat = request.getParameterValues("seat");
	ScreenVO svo = (ScreenVO) session.getAttribute("svo");
	int num = 0;
	int[] seats = null;
	if (seat != null) {
		seats = new int[seat.length];
		for (int i = 0; i < seat.length; i++) {
			seats[i] = Integer.parseInt(seat[i]);
		}
	}
	svo.setNoSeat(seats);
	boolean [][] s = new boolean[svo.getCol()][svo.getRow()];
	
	int a[] = svo.getPassageX();
	int b[] = svo.getPassageY();
	for(int i=0;i<a.length;i++){
		int temp=a[i];
		for(int j=0;j<s[0].length;j++){
			s[temp-1][j]=true;
		}
	}
	for(int i=0;i<b.length;i++){
		int temp=b[i];
		for(int j=0;j<s.length;j++){
			s[j][temp-1]=true;
		}
	}
	if(seats!=null){
		for(int i=0;i<seats.length;i++){
			int x = seats[i]/100-1;
			int y = seats[i]%100-1;
			s[x][y]=true;
		}
	}
	for(int i=0;i<s.length;i++){
		%>
		<tr>
		<% for(int j=0;j<s[i].length;j++){
				if(s[i][j]){%>			
				<td>X</td>			
			<%	}else{
					num++;%>
					<td>O</td>
					<% 
				}
			}
			%>
		</tr>
	<% }
	svo.setNum(num);
	session.setAttribute("svo", svo);

%>
</table>
<input type="submit" value="전송">
</form>
</html>