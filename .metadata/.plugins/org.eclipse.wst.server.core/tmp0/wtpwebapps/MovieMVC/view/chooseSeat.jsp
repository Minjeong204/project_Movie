<%@page import="vo.TicketVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ScheduleVO"%>
<%@page import="vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>

<%
	if(user == null) {
		out.print("<script>alert('로그인 후 이용 가능합니다.'); location.href = '/view/login.jsp';</script>");
		return;
	}

	ArrayList<TicketVO> ticketList = new ArrayList<>();
	
	int schNo = (int)request.getAttribute("schNo");
	int roomNo = (int)request.getAttribute("roomNo");

	if(request.getAttribute("ticketList") == null) {
		response.sendRedirect("/");
	}else {
		ticketList = (ArrayList) request.getAttribute("ticketList");
	}
%>

<div class="ui container">
	<div id="screen"><p>S C R R E N </p></div>
    <div class="main" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
        <h2 class=seat_select>좌석 선택하기</h2>
        
        <div class="seatBox">
        <%-- <%
        for(int i = 1; i <= 25; i++) {
        	boolean status = false;
        	
        	for (TicketVO item : ticketList) {
        		if(item.getSeatNo() == i) {
        			status = true;
        		}
        	}
        	
        	if(status == true) {
        %>
        	<button class="ui pink basic button" disabled><%= i %></button>
        <%
        	}else {
       	%>
       		<button class="ui blue basic button" data-seatno="<%=i %>"><%= i %></button>
       	<%
        	}
        	if(i % 5 == 0) {
        %>
        	<br>
        <%
        	}
        }        
        %> --%>
       		<c:forEach var="i" begin="1" end="25">
        		<c:set var="status" value="0"/>
        		<fmt:formatNumber value="${i}" var="num" type="number"/>
        		<c:forEach var="ticketVO" items="${ticketList }">
        			<c:if test="${ticketVO.seatNo==num }">
        				<c:set var="status" value="1"/>
        			</c:if>
        		</c:forEach>
        		<c:choose>
        			<c:when test="${status eq 1}">
        				<button class="ui pink basic button" disabled>${num}</button>
        			</c:when>
        			<c:otherwise>
        				<button class="ui blue basic button" data-seatno="${i}">${num}</button>
        			</c:otherwise>
        		</c:choose>
        		<c:if test="${num%5 == 0 }"><br></c:if>
        	</c:forEach>
        </div>
        
        <div style="text-align: right;">
        	<button class="ticketing ui purple basic button submitBtn">예매하기</button>
        </div>
	</div>
</div>

<script>
	let arr = [];
	
	$(".seatBox > button").on("click", function() {		
		$(this).toggleClass("basic");
		
		if(arr.indexOf($(this).data("seatno")) == -1) {
			arr.push($(this).data("seatno"));	
		}else {
			arr.splice(arr.indexOf($(this).data("seatno")), 1);  
		}
	});
	
	$(".submitBtn").on("click", function() {
		if(arr.length <= 0) {
			swal("오류", "좌석이 선택되지 않았습니다.", "error");
			return;
		}else {
			location.href = "ticketBuy.do?schNo="+ <%=schNo%> +"&seatNo=" + arr + "&roomNo=" +${roomNo} + "&user=<%=user.getId()%>";
		} <%-- + "&roomNo=" +<%=roomNo%> --%>
	});
</script>

<%@ include file="../footer.jsp" %>