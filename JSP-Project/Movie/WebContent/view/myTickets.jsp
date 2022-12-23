<%@page import="java.util.ArrayList"%>
<%@page import="vo.TicketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>
<%-- <%
	if(user == null) {
		out.print("<script>alert('로그인 후 이용 가능합니다.'); location.href = '/view/login.jsp';</script>");
		return;
	}else {
		if(request.getAttribute("myTicket") == null) {
			response.sendRedirect("/myTicket.do?user=" + user.getId());
		}/* else {
			data = (ArrayList) request.getAttribute("myTicket");
		} */
	}
%> --%>
<c:if test="${myTicket==null }">
	<c:redirect url="/myTicket.do?user=${user.getId()}"></c:redirect>
</c:if>

<div class="ui container">
    <div class="visual">
        <img src="/images/logo.jpg" alt="visualImg">
    </div>

    <div class="main" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
    <%-- <% if(user.getId().equals("admin")) {%>
        <h2>전체 예매 목록(관리자 모드)</h2>
     <% }else { %>
        <h2><%=user.getId() %>님의 예매 목록</h2>
     <% } %> --%>
	<c:choose>
		<c:when test="${myUser eq 'admin' }">
			<h2>전체 예매 목록(관리자 모드)</h2>
		</c:when>
		<c:otherwise>
			<h2>${user.getId()}님의 예매 목록</h2>
		</c:otherwise>
	</c:choose>
	
		<table class="ui inverted pink table">
			<thead>
				<tr>
					<th>티켓 번호</th>
					<th>영화 제목</th>
					<th>상영 날짜</th>
					<th>스케줄 번호</th>
					<th>상영관</th>
					<th>좌석 번호</th>
					<th>회원아이디</th>
					<th>예매 취소</th>
				</tr>
			</thead>
			<tbody>
				<%-- <%
					for(TicketVO item : data) {
				%>
				<tr>
					<td><%=item.getTicketNo() %></td>
					<td><%=item.getBookDate() %></td>
					<td><%=item.getSchNo() %></td>
					<td><%=item.getSeatNo() %></td>
					<td><%=item.getId() %></td>
					<td><a href="#">예매 취소</a></td>
				</tr>
				<%
					}
				%> --%>
				<c:forEach var="item" items="${myTicket }">
					<fmt:formatDate var="runDayandDate" value="${item.bookDate }" pattern="yyyy년 MM월 dd일 (HH시 mm분)"/>
					<tr>
						<td>${item.ticketNo}</td>
						<td>${item.movieName}</td>
						<td>${runDayandDate}</td>
						<td>${item.schNo}번</td>
						<td>${item.roomNo}관</td>
						<td>${item.seatNo}</td>
						<td>${item.id}</td>
						<td>
							<div class="item">
    							<div class="ui blue button" onclick="location.href = '/deleteTicket.do?ticketNo=${item.ticketNo}&user=${myUser}&schNo=${item.schNo}';">예매 취소</div>
  							</div>
							<%-- <a href="/deleteTicket.do?ticketNo=${item.ticketNo}&user=${myUser}&schNo=${item.schNo}">예매 취소</a> --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>


<%@ include file="../footer.jsp" %>