<%@page import="java.util.ArrayList"%>
<%@page import="project.web.movie.MemberVO"%>
<%@page import="project.web.movie.BookVO"%>
<%@page import="project.web.movie.BookDAO"%>
<%@page import="project.web.movie.MscrnVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberVO user = (MemberVO) session.getAttribute("User");
	if (user == null) {%>
<script>
	alert("로그인이 필요합니다.");
	window.location.href = "loginForm.jsp";
</script>
<%
	} else if (user.getAdmin() == 0) {
%>
<jsp:include page="userHead.jsp"></jsp:include>
<%
	} else {
%>
<script>
	alert("관리자는 사용할 수 없는 기능입니다.");
	window.location.href = "adminMain.jsp";
</script>
<%
	}
	String[] s = request.getParameterValues("seat");
	if (s == null || s.length == 0) {
%>
<script>
	alert("잘못된 접근입니다.");
	window.location.href = "main.jsp";
</script>
<%
	} else {
		MscrnVO vo = (MscrnVO) session.getAttribute("MscrnVO");
		BookDAO dao = new BookDAO();
		ArrayList<BookVO> list = new ArrayList<>();
		if (dao.checkBook(vo.getId(), s)) {
		%>
		<script>
			alert("이미선택된 자리입니다.");
			window.location.href = "loginForm.jsp";
		</script>
		<%
		} else {
			for (int i = 0; i < s.length; i++) {
				BookVO bvo = new BookVO();
				bvo.setT_id(vo.getId());
				bvo.setU_id(user.getId());
				bvo.setPayment(0);
				bvo.setSeat(Integer.parseInt(s[i]));
				dao.insertBook(bvo);
				list.add(bvo);
			}
			session.setAttribute("list", list);
			response.sendRedirect("payment.jsp");
		}
	}
%>