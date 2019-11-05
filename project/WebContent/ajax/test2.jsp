<%@page import="project.web.movie.ScreenVO"%>
<%@page import="project.web.movie.ScreenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<body>
<h2>좌석도</h2>
<form action="test3.jsp" onsubmit="return getcheck()">
<table>
<% 
	String id = "1";
	int num = Integer.parseInt(request.getParameter("num"));
	ScreenDAO dao = new ScreenDAO();
	ScreenVO svo = dao.get(id);
	int [] seats = svo.getNoSeat();
	boolean [][] s = new boolean[svo.getCol()][svo.getRow()];
	
	int a[] = svo.getPassageX();
	int b[] = svo.getPassageY();
	if(a!=null){
		for(int i=0;i<a.length;i++){
			int temp=a[i];
			for(int j=0;j<s[0].length;j++){
				s[temp-1][j]=true;
			}
		}
	}
	if(b!=null){
		for(int i=0;i<b.length;i++){
			int temp=b[i];
			for(int j=0;j<s.length;j++){
				s[j][temp-1]=true;
			}
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
					%>
					<td><label><input type="checkbox" name="test" value="<%=(i+1)*100+(j+1)%>"></label></td>
					<% 
				}
			}
			%>
		</tr>
	<% }
%>
</table>
<input type="submit" value="test"/>
</form>

<script type="text/javascript">
$('input[name=test]').css({'margin':'1px','border':'1px solid red'});
function getcheck(){
	if($("input:checkbox[name=test]:checked").length==<%=num%>){
		return true;
	}
	else{
		alert("잘못된 좌석 선택입니다.");
		return false;
	} 

}
</script>

</body>
</html>