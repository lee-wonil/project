<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String[] values = request.getParameterValues("passage");
	ScreenVO svo = (ScreenVO) session.getAttribute("svo");
	int col = svo.getCol();
	int row = svo.getRow();
	ArrayList<Integer> x = new ArrayList<>();
	ArrayList<Integer> y = new ArrayList<>();
	int passx[] = null;
	int passy[] = null;
	if (values != null) {
		for (int i = 0; i < values.length; i++) {
			int a = Integer.parseInt(values[i]);
			if (a % 100 == 0) {
				x.add(a / 100);
			} else {
				y.add(a);
			}
		}
	}
	if (x != null) {
		passx = new int[x.size()];
		for (int i = 0; i < x.size(); i++) {
			passx[i] = x.get(i);
		}
	}
	if (y != null) {
		passy = new int[y.size()];
		for (int j = 0; j < y.size(); j++) {
			passy[j] = y.get(j);
		}
	}
	svo.setPassageX(passx);
	svo.setPassageY(passy);
	Iterator<Integer> itx = x.iterator();
	Iterator<Integer> ity = y.iterator();
	int x1 = 0;
	int y1 = 0;
	int i = 1;
	int j = 1;
	if (itx.hasNext()) {
		x1 = itx.next();
	}
	if (ity.hasNext()) {
		y1 = ity.next();
	}
%>
<h2>사용할 수 없는 좌석 입력</h2>
<form action="screenForm4.jsp">
	<table>
		<%
			for (i=1; i <= col; i++) {
		%>
		<tr>
			<%
				if (x1 == i) {
					for (j = 1; j <= row; j++) {%>
						<td>X</td><%
			 		}
					if(itx.hasNext()){
						x1 = itx.next();
					}

				}
				else{
					for (j = 1; j <= row; j++) {
						if(y1==j){%>
							<td>X</td>
							<%
							if(ity.hasNext()){
								y1=ity.next();
							}
							else{
								ity=y.iterator();
								y1=ity.next();
							}
						}
						else{%>
							<td><input type="checkbox" name="seat" value="<%=i*100+j %>" ></td>
						<%}
					}
				}
			}
			%>
		
	</table>
	<input type="submit" value="전송">
</form>