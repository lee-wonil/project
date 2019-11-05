<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.BookDAO"%>
<%@page import="project.web.movie.ScreenVO"%>
<%@page import="project.web.movie.ScreenDAO"%>
<%@page import="project.web.movie.MscrnVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%
	MemberVO user = (MemberVO)session.getAttribute("User");
	if(user==null){%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		window.location.href="loginForm.jsp";
	</script>
	<%}else if(user.getAdmin()==0){%>
		<jsp:include page="userHead.jsp"></jsp:include>

	<%}else{%>
		<script type="text/javascript">
		alert("관리자는 사용할 수 없는 기능입니다.");
		window.location.href="adminMain.jsp";
		</script>
	<%}
	int num = Integer.parseInt(request.getParameter("num"));
	MscrnVO vo = (MscrnVO)session.getAttribute("MscrnVO");
	String id = String.valueOf(vo.getS_id());
	ScreenDAO dao = new ScreenDAO();
	ScreenVO svo = dao.get(id);
	int [] seats = svo.getNoSeat();
	BookDAO bdao = new BookDAO();
	ArrayList<BookVO> list = bdao.list(String.valueOf(vo.getId()));
	int [][] s = new int[svo.getCol()][svo.getRow()];
	int a[] = svo.getPassageX();
	int b[] = svo.getPassageY();
	if(a!=null){
		for(int i=0;i<a.length;i++){
			int temp=a[i];
			for(int j=0;j<s[0].length;j++){
				s[temp-1][j]=1;
			}
		}
	}
	if(b!=null){
		for(int i=0;i<b.length;i++){
			int temp=b[i];
			for(int j=0;j<s.length;j++){
				s[j][temp-1]=1;
			}
		}
	}
	if(seats!=null){
		for(int i=0;i<seats.length;i++){
			int x = seats[i]/100-1;
			int y = seats[i]%100-1;
			s[x][y]=1;
		}
	}
	if(list.size()!=0){
		for(int i=0;i<list.size();i++){
			BookVO bvo = list.get(i);
			int seat = bvo.getSeat();
			int x = (seat/100)-1;
			int y = (seat%100)-1;
			s[x][y]=2;
		}
	}
%>

<h2>좌석도</h2>
<h5>예매가능 좌석 <%=svo.getNum()-bdao.get(String.valueOf(vo.getId()))%>/<%=svo.getNum() %></h5>
<form action="book3.jsp" onsubmit="return getcheck()">
<table>
<% 

	for(int i=0;i<s.length;i++){
		%>
		<tr>
		<% for(int j=0;j<s[i].length;j++){
				if(s[i][j]==1){%>			
				<td>X</td>			
			<%	}
				else if(s[i][j]==2){%>
					<td>★</td>
				<%}
				else{
					%>
					<td><label><input type="checkbox" name="seat" value="<%=(i+1)*100+(j+1)%>"></label></td>
					<% 
				}
			}
			%>
		</tr>
	<% }
%>
</table>
<input type="submit" value="예매"/>
</form>
</body>
<script type="text/javascript">
$('input[name=seat]').css({'margin':'1px','border':'1px solid red'});
function getcheck(){
	if($("input:checkbox[name=seat]:checked").length==<%=num%>){
		return true;
	}
	else{
		alert("잘못된 좌석 선택입니다.");
		return false;
	} 

}
</script>
</html>